package com.example.myfirstcontentprovider;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.util.Log;

public class MainActivity extends AppCompatActivity {
    private static final int MY_PERMISSIONS_REQUEST_READ_CONTACTS = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.READ_CONTACTS}, MY_PERMISSIONS_REQUEST_READ_CONTACTS);
        } else {
            Uri allContacts = Uri.parse("content://contacts/people");
            Cursor c = getContentResolver().query(allContacts, null, null, null, ContactsContract.Contacts.DISPLAY_NAME);
            assert c != null;
            PrintContacts(c);
        }
    }

    private void PrintContacts(Cursor c) {
        if (c.moveToFirst()) {
            do {
                String contactID = c.getString(c.getColumnIndex(ContactsContract.Contacts._ID));
                String contactName = c.getString(c.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME));
                Log.v("ContentProviders", contactID + ", " + contactName);
            } while (c.moveToNext());
        }
    }
}
