package com.example.setiapp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Vibrator;
import android.util.Log;
import android.widget.Toast;

public class BroadCastReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "You've reached 10!!", Toast.LENGTH_LONG).show();
        Vibrator vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        assert vibrator != null;
        vibrator.vibrate(3000);
        Log.i("Receiver", "Intent received");

    }
}
