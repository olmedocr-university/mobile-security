package com.gonzalezolmedo.credhub;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.gonzalezolmedo.credhub.model.Credential;
import com.gonzalezolmedo.credhub.repository.ImportCredentialTask;
import com.gonzalezolmedo.credhub.repository.RetrieveCredentialListTask;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class ImportActivity extends AppCompatActivity {
    private String TAG = "ImportActivity";
    private Credential mRemoteCredential;

    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_import);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Import Credentials");

        final Spinner spinner = findViewById(R.id.spinner_server_credentials);
        populateSpinner(spinner);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    mRemoteCredential = new ImportCredentialTask().execute(spinner.getSelectedItem().toString()).get(5, TimeUnit.SECONDS);
                } catch (ExecutionException e) {
                    Log.e(TAG, "onClick: error while importing credential", e);
                } catch (InterruptedException e) {
                    Log.e(TAG, "onClick: interrupted task while importing credential", e);
                } catch (TimeoutException e) {
                    Log.e(TAG, "onClick: timeout while importing credential", e);
                }

                if (mRemoteCredential != null) {
                    Log.i(TAG, "onClick: imported credential " + mRemoteCredential.toString());
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Success!", Snackbar.LENGTH_SHORT);
                    snackbar.show();

                    Intent intent = new Intent();
                    intent.putExtra("credentialID", mRemoteCredential.getIdentifier());
                    intent.putExtra("username", mRemoteCredential.getUsername());
                    intent.putExtra("password", mRemoteCredential.getPassword());
                    setResult(Activity.RESULT_OK, intent);

                    finish();

                } else {
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Error importing credential", Snackbar.LENGTH_LONG);
                    snackbar.show();
                }
            }
        });

    }

    private void populateSpinner(Spinner spinner) {
        List<String> credentialsIds;

        try {
            credentialsIds = new RetrieveCredentialListTask().execute().get(5, TimeUnit.SECONDS);

            // Create an ArrayAdapter using the string array and a default spinner layout
            ArrayAdapter<String> adapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, credentialsIds);

            // Specify the layout to use when the list of choices appears
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

            // Apply the adapter to the spinner
            spinner.setAdapter(adapter);
        } catch (ExecutionException e) {
            Log.e(TAG, "populateSpinner: error while retrieving credentials from repo", e);
        } catch (InterruptedException e) {
            Log.e(TAG, "populateSpinner: interrupted connection with repo", e);
        } catch (TimeoutException e) {
            Log.e(TAG, "populateSpinner: connection timeout while retrieving credentials", e);
        }
    }
}
