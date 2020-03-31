package com.gonzalezolmedo.credhub.database;

import android.provider.BaseColumns;

public final class CredentialsContract {

    public static final int DATABASE_VERSION = 1;
    public static final String DATABASE_NAME = "Credentials-encrypted.db";

    public CredentialsContract() { }

    public static abstract class CredentialEntry implements BaseColumns {
        public static final String TABLE_NAME = "Credentials";
        public static final String COLUMN_NAME_ID = "CredentialId";
        public static final String COLUMN_NAME_USERNAME = "Username";
        public static final String COLUMN_NAME_PASSWORD = "Password";

        public static final String SQL_CREATE_ENTRIES =
                "CREATE TABLE " + CredentialsContract.CredentialEntry.TABLE_NAME + " (" +
                        CredentialsContract.CredentialEntry.COLUMN_NAME_ID + " TEXT PRIMARY KEY," +
                        CredentialsContract.CredentialEntry.COLUMN_NAME_USERNAME + " TEXT," +
                        CredentialsContract.CredentialEntry.COLUMN_NAME_PASSWORD + " TEXT)";

        public static final String SQL_DELETE_ENTRIES =
                "DROP TABLE IF EXISTS " + CredentialsContract.CredentialEntry.TABLE_NAME;

    }
}
