package com.embun.cookingrecipeapp.data.model;

import com.google.gson.annotations.SerializedName;

public class GetUserResponse extends DefaultResponse{
    @SerializedName("data")
    private User user = null;

    public GetUserResponse(String message, User user) {
        super(message);
        this.user = user;
    }

    public GetUserResponse(String message) {
        super(message);
    }

    public User getUser() {
        return user;
    }

    public String getMessage() {
        return super.getMessage();
    }
}
