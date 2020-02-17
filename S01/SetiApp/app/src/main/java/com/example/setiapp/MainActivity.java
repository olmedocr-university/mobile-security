package com.example.setiapp;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

public class MainActivity extends AppCompatActivity {

    int counter;
    Button buttonAdd, buttonSubtract;
    TextView textViewTotal;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        counter = 0;
        buttonAdd = findViewById(R.id.button_add);
        buttonSubtract = findViewById(R.id.button_subtract);
        textViewTotal = findViewById(R.id.text_view_total);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        buttonAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                counter++;
                textViewTotal.setText("Your total is " + counter);

                if (counter == 10) {
                    activateReceiver(counter);
                }
            }
        });

        buttonSubtract.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                counter--;
                textViewTotal.setText("Your total is " + counter);

                if (counter == 10) {
                    activateReceiver(counter);
                }
            }
        });
    }

    public void activateReceiver(int c) {
        int i = c;
        Intent intent = new Intent(this, BroadCastReceiver.class);
        sendBroadcast(intent);
        Log.i("Receiver", "Intent sent");
    }
}
