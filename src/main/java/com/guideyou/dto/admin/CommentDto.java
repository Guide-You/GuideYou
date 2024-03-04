package com.guideyou.dto.admin;

import lombok.Data;

/**
  * @FileName : CommentDto.java
  * @Project : GuideYou
  * @Date : 2024. 2. 28. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : board detail하단 comment dto입니다
  */
@Data
public class CommentDto {
	
	private Integer id;  // 댓글 id
	private Integer bContentsId; //해당게시물번호
	private Integer writerId;
	private String content; // 댓글 내용
	private Integer createdAt;

}
