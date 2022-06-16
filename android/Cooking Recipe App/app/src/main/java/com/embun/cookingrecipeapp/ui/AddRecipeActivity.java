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
import com.embun.cookingrecipeapp.data.model.DefaultResponse;
import com.embun.cookingrecipeapp.data.model.Recipe;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class AddRecipeActivity extends AppCompatActivity {
    EditText etJudulResep,etBahanResep,etLangkahResep;
    Button btnAddRecipe;
    RetrofitServices retrofitServices;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_recipe);
        etJudulResep = findViewById(R.id.etJudulResep);
        etBahanResep = findViewById(R.id.etBahanResep);
        etLangkahResep = findViewById(R.id.etLangkahResep);
        btnAddRecipe = findViewById(R.id.btnAddRecipe);

        /**
         * Call add recipe service
         */
        btnAddRecipe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);
                String recipe_name = etJudulResep.getText().toString();
                String ingredient = etBahanResep.getText().toString();
                String direction = etLangkahResep.getText().toString();
                int user_id = LoginActivity.getLoggedAccount().getUser_id();
                Recipe recipe = new Recipe(recipe_name,ingredient,direction,user_id);

                Call<DefaultResponse> call = retrofitServices.addRecipe(recipe);
                call.enqueue(new Callback<DefaultResponse>() {
                    @Override
                    public void onResponse(Call<DefaultResponse> call, Response<DefaultResponse> response) {
                        if(response.code()==200){
                            DefaultResponse resp = response.body();
                            Toast.makeText(AddRecipeActivity.this, resp.getMessage(),Toast.LENGTH_SHORT).show();
                            if(resp.getMessage().equalsIgnoreCase("Success")){
                                Intent intent = new Intent(AddRecipeActivity.this, UserProfileActivity.class);
                                startActivity(intent);
                            }
                        }else{
                            try {
                                JSONObject jsonObject = new JSONObject(response.errorBody().string());
                                Toast.makeText(AddRecipeActivity.this, jsonObject.getString("message"),Toast.LENGTH_SHORT).show();
                            } catch (IOException | JSONException e) {
                                e.printStackTrace();
                            }
                        }
                    }

                    @Override
                    public void onFailure(Call<DefaultResponse> call, Throwable t) {
                        Toast.makeText(AddRecipeActivity.this, t.toString(),Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });

    }
}