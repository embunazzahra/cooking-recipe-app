package com.embun.cookingrecipeapp.data.services;

import com.embun.cookingrecipeapp.data.model.DefaultResponse;
import com.embun.cookingrecipeapp.data.model.GetRecipesResponse;
import com.embun.cookingrecipeapp.data.model.GetUserResponse;
import com.embun.cookingrecipeapp.data.model.Recipe;
import com.embun.cookingrecipeapp.data.model.User;

import java.util.HashMap;
import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.HTTP;
import retrofit2.http.POST;
import retrofit2.http.PUT;

/**
 * Interface for API call methods
 * using retrofit.
 *
 * @author Dhau' Embun Azzahra
 */
public interface RetrofitServices {

    @POST("/login")
    Call<GetUserResponse> login(@Body User user);

    @POST("/register")
    Call<DefaultResponse> register(@Body User user);

    @GET("/recipes")
    Call<GetRecipesResponse> recipes();

    @POST("/getBookmark")
    Call<GetRecipesResponse> getBookmark(@Body User user);

    @POST("/recipebyid")
    Call<GetRecipesResponse> recipebyid(@Body Recipe recipe);

    @POST("/addBookmark")
    Call<DefaultResponse> addBookmark(@Body HashMap map);

    @POST("/checkBookmark")
    Call<DefaultResponse> checkBookmark(@Body HashMap map);

    @HTTP(method = "DELETE", path = "/deleteBookmark", hasBody = true)
    Call<DefaultResponse> deleteBookmark(@Body HashMap map);

    @POST("/recipebyuser")
    Call<GetRecipesResponse> recipebyuser(@Body User user);

    @POST("/addRecipe")
    Call<DefaultResponse> addRecipe(@Body Recipe recipe);

    @PUT("/updateRecipe")
    Call<DefaultResponse> updateRecipe(@Body Recipe recipe);

    @HTTP(method = "DELETE", path = "/deleteRecipe", hasBody = true)
    Call<DefaultResponse> deleteRecipe(@Body Recipe recipe);

    @POST("/getUserByUserId")
    Call<GetUserResponse> getUserByUserId(@Body User user);

}
