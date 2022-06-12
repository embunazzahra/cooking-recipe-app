package com.embun.cookingrecipeapp.data.model;

import com.google.gson.annotations.SerializedName;

public class User {
    @SerializedName("user_id")
    private int user_id;
    @SerializedName("username")
    private String username;
    @SerializedName("email")
    private String email;
    @SerializedName("password")
    private String password;

    public User(int user_id, String username, String email, String password){
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(int user_id, String username){
        this.user_id = user_id;
        this.username = username;
    }

    public User(String email, String password){
        this.email = email;
        this.password = password;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
