package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * @FileName : Comment.java
  * @Project : GuideYou
  * @Date : 2024. 2. 28. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 :
  */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comment {

	private Integer id; // 댓글user id
	private Integer bContentsId;
	private Integer writerId;
	private String content;
	private Timestamp createdAt;
}
