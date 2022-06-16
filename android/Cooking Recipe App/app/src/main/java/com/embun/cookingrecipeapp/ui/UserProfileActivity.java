package com.embun.cookingrecipeapp.ui;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.embun.cookingrecipeapp.R;
import com.embun.cookingrecipeapp.data.RetrofitInstance;
import com.embun.cookingrecipeapp.data.model.GetRecipesResponse;
import com.embun.cookingrecipeapp.data.model.Recipe;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;

import java.io.IOException;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class UserProfileActivity extends AppCompatActivity {
    TextView tvProfileUsername,tvProfileEmail,tvUserRecipes;
    ListView lvUserRecipes;
    RetrofitServices retrofitServices;
    private List<Recipe> recipes;
    private static ArrayAdapter<Recipe> userRecipeLVAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_profile);
        tvProfileUsername = findViewById(R.id.tvProfileUsername);
        tvProfileEmail = findViewById(R.id.tvProfileEmail);
        lvUserRecipes = findViewById(R.id.lvUserRecipes);
        tvUserRecipes = findViewById(R.id.tvUserRecipes);

        /**
         * set text on User Profile
         */
        tvProfileUsername.setText(LoginActivity.getLoggedAccount().getUsername());
        tvProfileEmail.setText(LoginActivity.getLoggedAccount().getEmail());

        /**
         * Fetch all recipes create by user
         */
        retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);
        Call<GetRecipesResponse> call = retrofitServices.recipebyuser(LoginActivity.getLoggedAccount());
        call.enqueue(new Callback<GetRecipesResponse>() {
            @Override
            public void onResponse(Call<GetRecipesResponse> call, Response<GetRecipesResponse> response) {
                if(response.code()==200){
                    GetRecipesResponse resp = response.body();
                    recipes = resp.getRecipes();
                    if(recipes!=null){
                        userRecipeLVAdapter = new ArrayAdapter<Recipe>(UserProfileActivity.this,android.R.layout.simple_list_item_1, recipes);
                        lvUserRecipes.setAdapter(userRecipeLVAdapter);
                    }else {
                        tvUserRecipes.setText(resp.getMessage());
                        tvUserRecipes.setVisibility(View.VISIBLE);
                        lvUserRecipes.setVisibility(View.GONE);
                    }

                }else{
                    try {
                        Toast.makeText(UserProfileActivity.this, response.errorBody().string(),Toast.LENGTH_SHORT).show();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<GetRecipesResponse> call, Throwable t) {

            }
        });
    }

    /**
     * If user pressed back button, push them to main page
     * to prevent back to add page, etc.
     */
    @Override
    public void onBackPressed()
    {
        super.onBackPressed();
        startActivity(new Intent(UserProfileActivity.this, MainActivity.class));
        finish();

    }
}