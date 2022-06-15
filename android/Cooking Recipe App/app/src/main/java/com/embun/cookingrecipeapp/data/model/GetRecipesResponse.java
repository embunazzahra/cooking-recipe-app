package com.embun.cookingrecipeapp.data.model;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class GetRecipesResponse extends  DefaultResponse{
    @SerializedName("data")
    private List<Recipe> recipes;

    public GetRecipesResponse(String message, List<Recipe> recipes) {
        super(message);
        this.recipes = recipes;
    }

    public String getMessage() {
        return super.getMessage();
    }

    public List<Recipe> getRecipes() {
        return recipes;
    }
}
