package com.model2.mvc.service.domain;

import java.sql.Date;

public class User {

  private int user_id;
  private String role;
  private String profile;
  private String state_message;
  private Date join_date;
  private String nickname;
  private String password;
  private String email;
  private String phone;
   
  public User(){
    
  }

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id = user_id;
  }

  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

  public String getProfile() {
    return profile;
  }

  public void setProfile(String profile) {
    this.profile = profile;
  }

  public String getState_message() {
    return state_message;
  }

  public void setState_message(String state_message) {
    this.state_message = state_message;
  }

  public Date getJoin_date() {
    return join_date;
  }

  public void setJoin_date(Date join_date) {
    this.join_date = join_date;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  @Override
  public String toString() {
    return "User [user_id=" + user_id + ", role=" + role + ", profile="
        + profile + ", state_message=" + state_message + ", join_date="
        + join_date + ", nickname=" + nickname + ", password=" + password
        + ", email=" + email + ", phone=" + phone + "]";
  }
}
