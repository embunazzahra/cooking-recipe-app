package com.embun.cookingrecipeapp.ui;

import com.embun.cookingrecipeapp.R;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TextView tvMain = findViewById(R.id.tvMain);
        tvMain.setText(LoginActivity.getLoggedAccount().getUsername()+" "+LoginActivity.getLoggedAccount().getUser_id());
    }
}