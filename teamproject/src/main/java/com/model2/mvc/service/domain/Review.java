package com.model2.mvc.service.domain;

import java.sql.Date;

public class Review {

  private int review_no;  
  private int user_id;
  private String title;
  private String period1;
  private String period2;
  private Date writeDate;
  private int likeCnt;
  private String nationName;
  private String content;
  private int image_no;
   
  public Review(){
    
  }

  public int getReview_no() {
    return review_no;
  }

  public void setReview_no(int review_no) {
    this.review_no = review_no;
  }



  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  


 

  public String getPeriod1() {
    return period1;
  }

  public void setPeriod1(String period1) {
    this.period1 = period1;
  }

  public String getPeriod2() {
    return period2;
  }

  public void setPeriod2(String period2) {
    this.period2 = period2;
  }

  public Date getWriteDate() {
    return writeDate;
  }

  public void setWriteDate(Date writeDate) {
    this.writeDate = writeDate;
  }

  public int getLikeCnt() {
    return likeCnt;
  }

  public void setLikeCnt(int likeCnt) {
    this.likeCnt = likeCnt;
  }

  public String getNationName() {
    return nationName;
  }

  public void setNationName(String nationName) {
    this.nationName = nationName;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getImage_no() {
    return image_no;
  }

  public void setImage_no(int image_no) {
    this.image_no = image_no;
  }

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id = user_id;
  }

  @Override
  public String toString() {
    return "Review [review_no=" + review_no + ", user_id=" + user_id
        + ", title=" + title + ", period1=" + period1 + ", period2=" + period2
        + ", writeDate=" + writeDate + ", likeCnt=" + likeCnt + ", nationName="
        + nationName + ", content=" + content + ", image_no=" + image_no + "]";
  }
}
