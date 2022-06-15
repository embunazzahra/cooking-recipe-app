package com.embun.cookingrecipeapp.data.model;

import com.google.gson.annotations.SerializedName;

public class DefaultResponse {
    @SerializedName("message")
    private String message;

    public DefaultResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

}
