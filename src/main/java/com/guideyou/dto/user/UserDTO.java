package com.guideyou.dto.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : UserDTO.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : 사용자 DTO
  */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
    private Integer id;

    private String name;
    private String nickname;
    private String gender;
    private String email;
    private String phone;
    private String comment;

    private Timestamp createdAt;
}
