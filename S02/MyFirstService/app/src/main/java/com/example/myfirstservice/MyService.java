package com.example.myfirstservice;

import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.Nullable;

public class MyService extends Service {

    MediaPlayer mySong;
    private static final String TAG = "MyService class ";

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Toast.makeText(this, "The service has started", Toast.LENGTH_SHORT).show();
        mySong = MediaPlayer.create(MyService.this, R.raw.ontheroadagain);
        mySong.start();
        Log.i(TAG, "The service has started");
        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Toast.makeText(this, "The service has stopped", Toast.LENGTH_SHORT).show();
        mySong.stop();
        Log.i(TAG, "The service has stopped");
    }
}
