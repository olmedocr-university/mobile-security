package com.gonzalezolmedo.credhub;

import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.gonzalezolmedo.credhub.database.CredentialsContract;
import com.gonzalezolmedo.credhub.database.CredentialsDbHelper;
import com.gonzalezolmedo.credhub.model.Credential;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private final int NEW_REQUEST_CODE = 100;
    private final int IMPORT_REQUEST_CODE = 101;

    private String TAG = "MainActivity";
    private RecyclerView recyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager layoutManager;

    private CredentialsDbHelper credentialsDbHelper;
    private SQLiteDatabase readableDatabase;
    private SQLiteDatabase writableDatabase;

    private Credential[] credentialsList;

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if (item.getItemId() == R.id.menu_item_import) {
            Log.i(TAG, "onOptionsItemSelected: importing credentials");
            Intent intent = new Intent(this, ImportActivity.class);
            startActivityForResult(intent, IMPORT_REQUEST_CODE);
            return true;
        }
        return super.onOptionsItemSelected(item);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), NewRecordActivity.class);
                startActivityForResult(intent, NEW_REQUEST_CODE);
            }
        });

        credentialsDbHelper = new CredentialsDbHelper(this);

        recyclerView = findViewById(R.id.recycler_view_credentials);

        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        loadDataFromDatabase();

        mAdapter = new CredentialsAdapter(credentialsList);
        recyclerView.setAdapter(mAdapter);

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.i(TAG, "onActivityResult: returned from child with resultCode:" + resultCode);

        if (resultCode == RESULT_OK && requestCode == NEW_REQUEST_CODE) {
            Log.i(TAG, "onActivityResult: the user has added a credential");
            Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Success creating credential", Snackbar.LENGTH_SHORT);
            snackbar.show();

        } else if (resultCode == RESULT_OK && requestCode == IMPORT_REQUEST_CODE) {
            Log.i(TAG, "onActivityResult: credential correctly imported");
            Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Success importing credential", Snackbar.LENGTH_SHORT);
            snackbar.show();

            Bundle extras = data.getExtras();
            if (extras != null) {
                String identifier = extras.getString("identifier");
                String username = extras.getString("username");
                String password = extras.getString("password");

                storeDataInDatabase(identifier, username, password);
            }
        }

        loadDataFromDatabase();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    private void loadDataFromDatabase() {
        Log.i(TAG, "loadDataFromDatabase: getting credentials stored in the local DB");
        readableDatabase = credentialsDbHelper.getReadableDatabase();

        String[] projection = {
                CredentialsContract.CredentialEntry.COLUMN_NAME_ID,
                CredentialsContract.CredentialEntry.COLUMN_NAME_USERNAME,
                CredentialsContract.CredentialEntry.COLUMN_NAME_PASSWORD
        };

        Cursor cursor = readableDatabase.query(
                CredentialsContract.CredentialEntry.TABLE_NAME,   // The table to query
                projection,                                       // The array of columns to return (pass null to get all)
                null,                                        // The columns for the WHERE clause
                null,                                    // The values for the WHERE clause
                null,                                    // don't group the rows
                null,                                     // don't filter by row groups
                null                                         // The sort order
        );

        List<Credential> storedCredentials = new ArrayList<>();

        while (cursor.moveToNext()) {
            String identifier = cursor.getString(cursor.getColumnIndexOrThrow(CredentialsContract.CredentialEntry.COLUMN_NAME_ID));
            String username = cursor.getString(cursor.getColumnIndexOrThrow(CredentialsContract.CredentialEntry.COLUMN_NAME_USERNAME));
            String password = cursor.getString(cursor.getColumnIndexOrThrow(CredentialsContract.CredentialEntry.COLUMN_NAME_PASSWORD));

            storedCredentials.add(new Credential(identifier, username, password, null));
        }

        credentialsList = storedCredentials.toArray(new Credential[0]);
        loadIconsFromPhone();

        if (mAdapter != null) {
            CredentialsAdapter.updateList(credentialsList);
            mAdapter.notifyDataSetChanged();
        }

        cursor.close();
    }

    private void storeDataInDatabase(String id, String username, String password) {
        Log.i(TAG, "storeDataInDatabase: saving imported credential in db");
        writableDatabase = credentialsDbHelper.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(CredentialsContract.CredentialEntry.COLUMN_NAME_ID, id);
        values.put(CredentialsContract.CredentialEntry.COLUMN_NAME_USERNAME, username);
        values.put(CredentialsContract.CredentialEntry.COLUMN_NAME_PASSWORD, password);

        // Insert the new row
        readableDatabase.insertWithOnConflict(CredentialsContract.CredentialEntry.TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }

    private void loadIconsFromPhone() {
        for (Credential credential : credentialsList) {
            try {
                Drawable icon = getPackageManager().getApplicationIcon(credential.getIdentifier());
                credential.setIcon(icon);
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}