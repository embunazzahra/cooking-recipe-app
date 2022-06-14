package com.embun.cookingrecipeapp.ui;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.embun.cookingrecipeapp.R;
import com.embun.cookingrecipeapp.data.RetrofitInstance;
import com.embun.cookingrecipeapp.data.model.User;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RegisterActivity extends AppCompatActivity {
    private RetrofitServices retrofitServices;
    private EditText etPassword;
    private EditText etEmail;
    private EditText etUsername;
    private Button loginBtn;
    private Button regBtn;
    private static final Gson gson = new Gson();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        etPassword = findViewById(R.id.etRegisterPassword);
        etEmail = findViewById(R.id.etRegisterEmail);
        etUsername = findViewById(R.id.etRegisterUsername);
        loginBtn = findViewById(R.id.btnToLogin);
        regBtn = findViewById(R.id.btnRegister);

        retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);

        loginBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(RegisterActivity.this,LoginActivity.class));
            }
        });

        regBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                register();
            }
        });
    }

    private void register() {
        String username = etUsername.getText().toString();
        String email = etEmail.getText().toString();
        String password = etPassword.getText().toString();

        User user = new User(username,email,password);

        Call<Object> call = retrofitServices.register(user);
        call.enqueue(
                new Callback<Object>() {
                    @Override
                    public void onResponse(Call<Object> call, Response<Object> response) {
                        try{
                            if(response.code()==200){
                                String body = response.body().toString();
                                Toast.makeText(RegisterActivity.this, "resp code 200",Toast.LENGTH_SHORT).show();
                            }else{
                                String errorBody = response.errorBody().string();
                                Toast.makeText(RegisterActivity.this, errorBody,Toast.LENGTH_SHORT).show();
                            }


//                            String obj = gson.toJson(response.body());
//                            JSONObject jsonObject = new JSONObject(obj);
//                            String message = jsonObject.getString("message");
//                            if(jsonObject!=null){
//                                if(message!=null) {
//                                    Toast.makeText(RegisterActivity.this, message,Toast.LENGTH_SHORT).show();
//                                    if (message.equalsIgnoreCase("Register Success.")) {
//                                        Intent intent = new Intent(RegisterActivity.this, LoginActivity.class);
//                                        startActivity(intent);
//                                    }
//                                }
//                            }
//
//                            Toast.makeText(RegisterActivity.this, "something wrong",Toast.LENGTH_SHORT).show();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }

                    @Override
                    public void onFailure(Call<Object> call, Throwable t) {
                        Toast.makeText(RegisterActivity .this, t.toString(),Toast.LENGTH_SHORT).show();
                    }
                }
        );
    }
}