/**
 * 
 */
package com.guideyou.repository.entity.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : UserPhotos.java
  * @Project : GuideYou
  * @Date : 2024. 3. 4. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 : user_photos 테이블 entity - 사용자 프로필 사진 테이블
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserPhotos {
	private Integer Id;
	private Integer userId;
	private String profilePhoto; 
	private String originFileName; 
	private String uploadFileName;
	private Timestamp createdAt;
}
