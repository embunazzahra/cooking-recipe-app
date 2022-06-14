package com.embun.cookingrecipeapp.data.services;

import com.embun.cookingrecipeapp.data.model.DefaultResponse;
import com.embun.cookingrecipeapp.data.model.User;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface RetrofitServices {

    @POST("/login")
    Call<Object> login(@Body User user);

    @POST("/register")
    Call<DefaultResponse> register(@Body User user);
}
