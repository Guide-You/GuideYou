package com.guideyou.dto.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
  * @FileName : BoardPageRq.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : page Request class , board pageRequest 
  */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardPageRq {
	// 변수 : pgReq 
	// 현재 페이지 번호 : page == number | number of pages : page ==> nop
	private int nop;
	
	// 페이지당 출력할 데이터 개수 
	// quantity 양 quty size 대신
	private int quty;
	
	public BoardPageRq(int nop, int quty) {
		this.nop = nop;
		this.quty = quty;
		
	}
	
}
