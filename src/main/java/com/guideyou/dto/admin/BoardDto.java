package com.guideyou.dto.admin;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;
/**
  * @FileName : BoardDto.java
  * @Project : GuideYou
  * @Date : 2024. 2. 16. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : 
  */
@Data
public class BoardDto {

	private String type;
	private String writer;
	private String title;
	private String content;
	private Integer viewCount;

}
