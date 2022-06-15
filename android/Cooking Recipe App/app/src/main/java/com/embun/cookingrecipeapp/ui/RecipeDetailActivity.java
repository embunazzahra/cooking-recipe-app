package com.embun.cookingrecipeapp.ui;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.embun.cookingrecipeapp.R;
import com.embun.cookingrecipeapp.data.RetrofitInstance;
import com.embun.cookingrecipeapp.data.model.GetRecipesResponse;
import com.embun.cookingrecipeapp.data.model.Recipe;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;

import java.io.IOException;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RecipeDetailActivity extends AppCompatActivity {
    private RetrofitServices retrofitServices;
    TextView tvRecipeName, tvrecipeWriter,tvIngredient,tvDirection;
    Button btnBookmark;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recipe_detail);
        tvRecipeName = findViewById(R.id.tvRecipeName);
        tvrecipeWriter = findViewById(R.id.tvrecipeWriter);
        tvIngredient = findViewById(R.id.tvIngredient);
        tvDirection = findViewById(R.id.tvDirection);
        btnBookmark = findViewById(R.id.btnBookmark);

        Recipe recipe = RecipeFragment.selectedRecipe;

        retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);
        Call<GetRecipesResponse> call = retrofitServices.recipebyid(recipe);
        call.enqueue(new Callback<GetRecipesResponse>() {
            @Override
            public void onResponse(Call<GetRecipesResponse> call, Response<GetRecipesResponse> response) {
                if(response.code()==200){
                    GetRecipesResponse recipesResponse = response.body();
                    Recipe recipe = recipesResponse.getRecipes().get(0);
                    if(recipe!=null){
                        tvRecipeName.setText(recipe.getRecipe_name());
                        tvrecipeWriter.setText(recipe.getUsername());
                        tvIngredient.setText(recipe.getIngredient());
                        tvDirection.setText(recipe.getDirection());
                    }

                }else{
                    try {
                        Toast.makeText(RecipeDetailActivity.this, response.errorBody().string(),Toast.LENGTH_SHORT).show();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<GetRecipesResponse> call, Throwable t) {
                Toast.makeText(RecipeDetailActivity.this, t.toString(),Toast.LENGTH_SHORT).show();
            }
        });
    }
}