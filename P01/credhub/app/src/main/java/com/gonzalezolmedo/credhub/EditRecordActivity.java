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

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

public class EditRecordActivity extends AppCompatActivity {
    private String mPassword;
    private String TAG = "EditRecordActivity";

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_item_export:
                Log.i(TAG, "onOptionsItemSelected: exporting current credential");
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
            String mIdentifier = extras.getString("identifier");
            textViewIdentifier.setText(mIdentifier);
            textViewUsername.setText(extras.getString("username"));
            mPassword = extras.getString("password");
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
