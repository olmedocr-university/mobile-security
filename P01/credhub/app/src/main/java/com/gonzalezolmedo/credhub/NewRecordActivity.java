package com.gonzalezolmedo.credhub;

import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.SQLException;
import android.database.sqlite.SQLiteConstraintException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;
import java.util.List;

import com.gonzalezolmedo.credhub.database.CredentialsDbHelper;
import com.google.android.material.snackbar.Snackbar;

import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.COLUMN_NAME_ID;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.COLUMN_NAME_PASSWORD;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.COLUMN_NAME_USERNAME;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.TABLE_NAME;

public class NewRecordActivity extends AppCompatActivity {
    private String TAG = "NewRecordActivity";
    private List<String> installedAppsNames = new ArrayList<>();
    CredentialsDbHelper credentialsDbHelper;

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            Log.i(TAG, "onOptionsItemSelected: going back");
            this.onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_record);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("New Credential");

        final Spinner spinner = findViewById(R.id.spinner_installed_apps);
        populateSpinner(spinner);

        final EditText editTextUsername = findViewById(R.id.edit_text_username);
        final EditText editTextPassword = findViewById(R.id.edit_text_password);

        credentialsDbHelper = new CredentialsDbHelper(this);
        final SQLiteDatabase database = credentialsDbHelper.getWritableDatabase();

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ContentValues values = new ContentValues();
                values.put(COLUMN_NAME_ID, spinner.getSelectedItem().toString());
                values.put(COLUMN_NAME_USERNAME, editTextUsername.getText().toString());
                values.put(COLUMN_NAME_PASSWORD, editTextPassword.getText().toString());

                try {
                    database.insertOrThrow(TABLE_NAME, null, values);

                    Intent intent = new Intent();
                    setResult(RESULT_OK, intent);
                    finish();

                } catch (SQLException e) {
                    Log.e(TAG, "onClick: a constraint failed (probably a PK)", e);
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Error while saving credential into the DB, try again", Snackbar.LENGTH_LONG);
                    snackbar.show();
                }

            }
        });

    }

    private void populateSpinner(Spinner spinner) {
        // Get installed apps from the device
        List<ApplicationInfo> installedApps = getPackageManager().getInstalledApplications(PackageManager.GET_META_DATA);

        // Check whether the application is a system app or if it is installed by the user
        for (ApplicationInfo installedApp : installedApps) {
            if ((installedApp.flags & ApplicationInfo.FLAG_SYSTEM) == 0 && installedApp.name != null){
                installedAppsNames.add(installedApp.packageName);
                Log.i(TAG, "populateSpinner: added non-system app " + installedApp.name);
            }
        }

        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<String> adapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, installedAppsNames);

        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);
    }


}
