package com.example.setiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;

public class WelcomeActivity extends AppCompatActivity {

    MediaPlayer myWelcomeSong;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);

        myWelcomeSong = MediaPlayer.create(this, R.raw.ontheroadagain);
        //myWelcomeSong.start();

        Thread clock = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(9000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    Intent intent = new Intent(WelcomeActivity.this, MainActivity.class);
                    startActivity(intent);
                }
            }
        });

        clock.start();
    }

    @Override
    protected void onPause() {
        super.onPause();

        myWelcomeSong.release();

        finish();
    }
}
