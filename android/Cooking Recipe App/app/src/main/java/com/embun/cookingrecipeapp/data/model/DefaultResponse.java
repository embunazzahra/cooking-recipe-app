package com.embun.cookingrecipeapp.data.model;

import com.google.gson.annotations.SerializedName;

/**
 * Class that represents the response in general
 *
 * @author Dhau' Embun Azzahra
 */
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
