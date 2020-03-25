package com.gonzalezolmedo.credhub.model;

import android.graphics.drawable.Drawable;

public class Credential {
    private String identifier;
    private String username;
    private String password;
    private Drawable icon;

    public Credential(String identifier, String username, String password, Drawable icon) {
        this.identifier = identifier;
        this.username = username;
        this.password = password;
        this.icon = icon;
    }

    public String getIdentifier() {
        return identifier;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Drawable getIcon() {
        return icon;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIcon(Drawable icon) {
        this.icon = icon;
    }
}
