package com.gonzalezolmedo.credhub;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.gonzalezolmedo.credhub.model.Credential;
import com.gonzalezolmedo.credhub.repository.ExportCredentialTask;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class EditRecordActivity extends AppCompatActivity {
    private String mIdentifier;
    private String mUsername;
    private String mPassword;
    private String TAG = "EditRecordActivity";

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_item_export:
                Log.i(TAG, "onOptionsItemSelected: exporting current credential");
                boolean isExported = false;
                try {
                    isExported = new ExportCredentialTask().execute(mIdentifier, mUsername, mPassword).get(5, TimeUnit.SECONDS);
                } catch (ExecutionException e) {
                    Log.e(TAG, "onOptionsItemSelected: execution exception while exporting record", e);
                } catch (InterruptedException e) {
                    Log.e(TAG, "onOptionsItemSelected: connection interrupted", e);
                } catch (TimeoutException e) {
                    Log.e(TAG, "onOptionsItemSelected: timeout while exporting", e);
                }

                if (isExported) {
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Success!", Snackbar.LENGTH_SHORT);
                    snackbar.show();
                } else {
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Error while exporting credential", Snackbar.LENGTH_LONG);
                    snackbar.show();
                }

                return true;
            case android.R.id.home:
                Log.i(TAG, "onOptionsItemSelected: going back");
                this.onBackPressed();
                return true;

            default:
                return super.onOptionsItemSelected(item);
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_record);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        TextView textViewIdentifier = findViewById(R.id.text_view_identifier);
        TextView textViewUsername = findViewById(R.id.text_view_username);
        final TextView textViewPassword = findViewById(R.id.text_view_password);
        textViewPassword.setText("Hidden");

        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            mIdentifier = extras.getString("identifier");
            mUsername = extras.getString("username");
            mPassword = extras.getString("password");

            textViewIdentifier.setText(mIdentifier);
            textViewUsername.setText(mUsername);
            getSupportActionBar().setTitle(mIdentifier);
        }

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            private boolean isVisible;

            @Override
            public void onClick(View view) {
                if (isVisible) {
                    textViewPassword.setText("Hidden");
                    isVisible = !isVisible;
                } else {
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Showing password", Snackbar.LENGTH_SHORT);
                    snackbar.show();

                    textViewPassword.setText(mPassword);
                    isVisible = !isVisible;
                }
            }
        });


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_edit_record, menu);
        return super.onCreateOptionsMenu(menu);
    }
}
