package com.embun.cookingrecipeapp.ui;

import com.embun.cookingrecipeapp.R;
import com.embun.cookingrecipeapp.data.RetrofitInstance;
import com.embun.cookingrecipeapp.data.model.User;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;
import com.google.gson.Gson;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LoginActivity extends AppCompatActivity {

    private RetrofitServices retrofitServices;
    private EditText etPassword;
    private EditText etEmail;
    private Button loginBtn;
    private Button regBtn;
    private static User loggedAccount = null;

    private static final Gson gson = new Gson();
    public static User getLoggedAccount(){
        return loggedAccount;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        etPassword = findViewById(R.id.etLoginPassword);
        etEmail = findViewById(R.id.etLoginEmail);
        loginBtn = findViewById(R.id.button2);
        regBtn = findViewById(R.id.button3);

        retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);

        loginBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                login();
            }
        });

        regBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(LoginActivity.this,RegisterActivity.class));
            }
        });
    }

    private void login() {
        String email = etEmail.getText().toString();
        String password = etPassword.getText().toString();

        User user = new User(email,password);

        Call<Object> call = retrofitServices.login(user);
        call.enqueue(
                new Callback<Object>() {
                    @Override
                    public void onResponse(Call<Object> call, Response<Object> response) {
                        try{
                            String obj = gson.toJson(response.body());
                            JSONObject jsonObject = new JSONObject(obj);
                            String message = jsonObject.getString("message");
                            loggedAccount = gson.fromJson(jsonObject.getString("user"),User.class);
                            if(message!=null) {
                                Toast.makeText(LoginActivity.this, message,Toast.LENGTH_SHORT).show();
                                if (message.equalsIgnoreCase("log in success")) {
                                    Intent intent = new Intent(LoginActivity.this, MainActivity.class);
                                    startActivity(intent);
                                }
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }

                    @Override
                    public void onFailure(Call<Object> call, Throwable t) {
                        Toast.makeText(LoginActivity.this, t.toString(),Toast.LENGTH_SHORT).show();
                    }
                }
        );
    }
}