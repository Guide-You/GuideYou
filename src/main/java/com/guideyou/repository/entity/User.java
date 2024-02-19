package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
  * @FileName : User.java
  * @Project : GuideYou
  * @Date : 2024. 2. 18. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : user_tb 객체
  */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private Integer id;

    private String name;
    private String nickname;
    private String gender;
    private String email;
    private String phone;
    private String comment;

    private Timestamp createdAt;
}