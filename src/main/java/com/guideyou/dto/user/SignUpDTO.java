package com.guideyou.dto.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : SignUpDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 19. 
  * @작성자 : 최장호
  * @변경이력 : 회원가입 DTO
  * @프로그램 설명 :
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpDTO {
    private String name;
    private String nickname;
    private String gender;
    private String email;
    private String phone;
    private String comment;
}