package com.embun.cookingrecipeapp.data.model;

import java.util.List;

public class DefaultResponse {
    private String message;
    private List<Recipe> recipeList= null;
    private Recipe recipe = null;

    public DefaultResponse(String message) {
        this.message = message;
    }

    public DefaultResponse(String message, List<Recipe> recipeList) {
        this.message = message;
        this.recipeList = recipeList;
    }

    public DefaultResponse(String message, Recipe recipe) {
        this.message = message;
        this.recipe = recipe;
    }

    public DefaultResponse(String message, List<Recipe> recipeList, Recipe recipe) {
        this.message = message;
        this.recipeList = recipeList;
        this.recipe = recipe;
    }

    public String getMessage() {
        return message;
    }

    public List<Recipe> getRecipeList() {
        return recipeList;
    }

    public Recipe getRecipe() {
        return recipe;
    }
}
