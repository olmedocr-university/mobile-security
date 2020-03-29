package com.gonzalezolmedo.credhub;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.gonzalezolmedo.credhub.repository.SingletonCredential;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class LoginActivity extends AppCompatActivity {
    public static final String credHubPrefs = "CredHubPrefs";
    public static final String usernameKey = "username";
    public static final String passwordKey = "password";
    private String TAG = "LoginActivity";
    private EditText editTextUsername;
    private EditText editTextPassword;
    private SharedPreferences sharedPreferences;

    private static String bytesToHex(byte[] hash) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }

    private static byte[] encodeString(String string) {
        MessageDigest digest = null;
        byte[] encodedString = null;

        try {
            digest = MessageDigest.getInstance("SHA-256");
            encodedString = digest.digest(string.getBytes(StandardCharsets.UTF_8));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return encodedString;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        editTextPassword = findViewById(R.id.edit_text_password);
        editTextUsername = findViewById(R.id.edit_text_username);

        sharedPreferences = getSharedPreferences(credHubPrefs, Context.MODE_PRIVATE);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String salt = getResources().getString(R.string.hash_salt);

                String username = editTextUsername.getText().toString();
                String password = editTextPassword.getText().toString();

                boolean isUsernameValid = username.equals(getResources().getString(R.string.username));
                boolean isPasswordValid = bytesToHex(encodeString(salt + password)).equals(getResources().getString(R.string.hashed_password));

                if (isPasswordValid && isUsernameValid) {
                    Intent intent = new Intent(view.getContext(), MainActivity.class);

                    SingletonCredential credentials = SingletonCredential.getInstance();
                    credentials.username = username;
                    credentials.password = password;

                    startActivity(intent);
                } else {
                    Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "Error: Login incorrect", Snackbar.LENGTH_SHORT);
                    snackbar.show();
                }
            }
        });
    }
}
