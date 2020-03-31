package com.gonzalezolmedo.credhub;

import android.app.AliasActivity;
import android.app.KeyguardManager;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import net.sqlcipher.database.SQLiteDatabase;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.security.KeyPairGeneratorSpec;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.gonzalezolmedo.credhub.database.CredentialsContract;
import com.gonzalezolmedo.credhub.database.CredentialsDbHelper;
import com.gonzalezolmedo.credhub.model.Credential;
import com.gonzalezolmedo.credhub.repository.SingletonCredential;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.security.auth.x500.X500Principal;

public class MainActivity extends AppCompatActivity {
    private final int NEW_REQUEST_CODE = 100;
    private final int IMPORT_REQUEST_CODE = 101;

    public static final String ANDROID_KEYSTORE = "AndroidKeyStore";
    public static final String KEY_ALIAS = "DBEncryptionKey";
    public static final String DATA = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz|!£$%&/=@#";

    private String TAG = "MainActivity";
    private RecyclerView recyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager layoutManager;

    private CredentialsDbHelper credentialsDbHelper;
    private SQLiteDatabase readableDatabase;
    private SQLiteDatabase writableDatabase;

    private Credential[] credentialsList;

    public static Random RANDOM = new Random();

    KeyStore keyStore;
    SingletonCredential credentials;
    SharedPreferences sharedPreferences;

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

        loadKeyStore();
        createNewKeys();

        sharedPreferences = getSharedPreferences("SharedPrefs", Context.MODE_PRIVATE);
        credentials = SingletonCredential.getInstance();

        if (sharedPreferences.contains("db_password")){
            String encryptedPassword = sharedPreferences.getString("db_password", "");
            credentials.dbPassword = decryptString(encryptedPassword);
        } else {
            SharedPreferences.Editor editor = sharedPreferences.edit();
            String randomPassword = generateRandomPassword(32);
            credentials.dbPassword = randomPassword;
            editor.putString("db_password", encryptString(randomPassword));
            editor.apply();
        }

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
    protected void onResume() {
        super.onResume();
        if (!isDeviceSecured(this)) {
            Snackbar snackbar = Snackbar.make(findViewById(R.id.coordinator_layout), "No lock screen security detected", Snackbar.LENGTH_LONG);
            snackbar.show();
        }
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
        SQLiteDatabase.loadLibs(this);

        Log.i(TAG, "loadDataFromDatabase: getting credentials stored in the local DB");
        readableDatabase = credentialsDbHelper.getReadableDatabase(credentials.dbPassword);

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
        writableDatabase = credentialsDbHelper.getWritableDatabase(credentials.dbPassword);

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

    public void loadKeyStore() {
        try {
            keyStore = KeyStore.getInstance(ANDROID_KEYSTORE);
            keyStore.load(null);
        } catch (Exception e) {
            Log.e(TAG, "loadKeyStore: error while loading the keystore", e);
        }
    }

    public void createNewKeys() {
        try {
            // Create new key if needed
            if (!keyStore.containsAlias(KEY_ALIAS)) {
                Calendar start = Calendar.getInstance();
                Calendar end = Calendar.getInstance();
                end.add(Calendar.YEAR, 1);
                KeyPairGeneratorSpec spec = new KeyPairGeneratorSpec.Builder(this)
                        .setAlias(KEY_ALIAS)
                        .setSubject(new X500Principal("CN=Sample Name, O=Android Authority"))
                        .setSerialNumber(BigInteger.ONE)
                        .setStartDate(start.getTime())
                        .setEndDate(end.getTime())
                        .build();

                KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA", ANDROID_KEYSTORE);
                generator.initialize(spec);

                generator.generateKeyPair();
            }
        } catch (Exception e) {
            Toast.makeText(this, "Exception " + e.getMessage() + " occured", Toast.LENGTH_LONG).show();
            Log.e(TAG, Log.getStackTraceString(e));
        }
    }

    public PrivateKey loadPrivateKey(String alias) throws Exception {
        if (!keyStore.isKeyEntry(alias)) {
            Log.e(TAG, "Could not find key alias: " + alias);
            return null;
        }

        KeyStore.Entry entry = keyStore.getEntry(alias, null);
        if (!(entry instanceof KeyStore.PrivateKeyEntry)) {
            Log.e(TAG, " alias: " + alias + " is not a PrivateKey");
            return null;
        }

        return ((KeyStore.PrivateKeyEntry) entry).getPrivateKey();
    }

    public String encryptString(String stringToEncrypt) {
        String encryptedText = "";
        try {
            KeyStore.PrivateKeyEntry privateKeyEntry = (KeyStore.PrivateKeyEntry)keyStore.getEntry(KEY_ALIAS, null);
            RSAPublicKey publicKey = (RSAPublicKey) privateKeyEntry.getCertificate().getPublicKey();

            Cipher inCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            inCipher.init(Cipher.ENCRYPT_MODE, publicKey);

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            CipherOutputStream cipherOutputStream = new CipherOutputStream(
                    outputStream, inCipher);
            cipherOutputStream.write(stringToEncrypt.getBytes("UTF-8"));
            cipherOutputStream.close();

            byte [] vals = outputStream.toByteArray();
            encryptedText = Base64.encodeToString(vals, Base64.DEFAULT);
        } catch (Exception e) {
            Toast.makeText(this, "Exception " + e.getMessage() + " occured", Toast.LENGTH_LONG).show();
            Log.e(TAG, Log.getStackTraceString(e));
        }
        
        return encryptedText;
    }

    public String decryptString(String stringToDecrypt) {
        String decryptedText = "";
        try {
            PrivateKey privateKey = loadPrivateKey(KEY_ALIAS);

            Cipher output = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            output.init(Cipher.DECRYPT_MODE, privateKey);

            CipherInputStream cipherInputStream = new CipherInputStream(
                    new ByteArrayInputStream(Base64.decode(stringToDecrypt, Base64.DEFAULT)), output);
            ArrayList<Byte> values = new ArrayList<>();
            int nextByte;
            while ((nextByte = cipherInputStream.read()) != -1) {
                values.add((byte)nextByte);
            }

            byte[] bytes = new byte[values.size()];
            for(int i = 0; i < bytes.length; i++) {
                bytes[i] = values.get(i).byteValue();
            }

            decryptedText = new String(bytes, 0, bytes.length, "UTF-8");

        } catch (Exception e) {
            Toast.makeText(this, "Exception " + e.getMessage() + " occured", Toast.LENGTH_LONG).show();
            Log.e(TAG, Log.getStackTraceString(e));
        }
        
        return decryptedText;
    }

    public static boolean isDeviceSecured(Context context) {
        KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService(Context.KEYGUARD_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return keyguardManager.isDeviceSecure();
        } else {
            return (isPatternEnabled(context) ||
                    isPassOrPinEnabled(keyguardManager));
        }
    }

    private static boolean isPatternEnabled(Context context) {
        return (Settings.System.getInt(context.getContentResolver(), Settings.System.LOCK_PATTERN_ENABLED, 0) == 1);
    }

    private static boolean isPassOrPinEnabled(KeyguardManager keyguardManager) {
        return keyguardManager.isKeyguardSecure();
    }

    public static String generateRandomPassword(int len) {
        StringBuilder sb = new StringBuilder(len);

        for (int i = 0; i < len; i++) {
            sb.append(DATA.charAt(RANDOM.nextInt(DATA.length())));
        }

        return sb.toString();
    }

}