package com.gonzalezolmedo.credhub.database;

import android.content.Context;
import net.sqlcipher.database.SQLiteDatabase;
import net.sqlcipher.database.SQLiteOpenHelper;

import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.SQL_CREATE_ENTRIES;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.CredentialEntry.SQL_DELETE_ENTRIES;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.DATABASE_NAME;
import static com.gonzalezolmedo.credhub.database.CredentialsContract.DATABASE_VERSION;

public class CredentialsDbHelper extends SQLiteOpenHelper {

    public CredentialsDbHelper(Context context){
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(SQL_CREATE_ENTRIES);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL(SQL_DELETE_ENTRIES);
        onCreate(db);
    }
}
