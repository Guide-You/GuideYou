package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : Board.java
  * @Project : GuideYou
  * @Date : 2024. 2. 20. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 :
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	
	private Integer id;
	private String type;
	private String writer;
	private String title;
	private String content;
	private Integer viewCount;
	private Timestamp createdAt;

}
