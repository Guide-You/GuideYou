/**
 * 
 */
package com.guideyou.dto.user.photos;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

/**
  * @FileName : UserPhotosDTO.java
  * @Project : GuideYou
  * @Date : 2024. 3. 4. 
  * @작성자 : 최장호
  * @변경이력 :
  * @프로그램 설명 :
  */
@Data
@Builder
public class UserPhotosDTO {
	private Integer Id;
	private Integer userId;
	private String profilePhoto; 
	private String originFileName; 
	private String uploadFileName;
	private Timestamp createdAt;
}
