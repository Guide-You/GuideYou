package com.guideyou.dto.admin;

import java.util.List;

import com.guideyou.repository.entity.Board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
  * @FileName : BoardPageS.java
  * @Project : GuideYou
  * @Date : 2024. 2. 22. 
  * @작성자 : 김수현
  * @변경이력 :
  * @프로그램 설명 : board 페이징 결과 클래스 // board page Response 
  */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardPageS<Board> {
	// quantity 양 quty size 대신
	// page 대신 nop : number of pages 페이지
	// 변수 : pgReq 
	// 쿼리 결과를 저장할 배열
	private List<Board> content;

	// 현재 페이지 번호 : 0부터 시작
	private int number;
	
	// 테이블 총 건수
	private long totalElements;
	
	// 테이블 총 건수 / 페이지당 출력할 개수(size)
	// 총 페이지 수
	private int totalNops;
	
	// 1페이지당 개수 
	private int nop;
	
	//시작 블럭 페이지 번호
	private int startNop;
	
	// 끝 블럭 페이지 번호
	private int endNop;
	
	public BoardPageS(List<Board> content, int number, 
			long totalElements, int quty) {
		this.content = content;
		this.number = number; 				// 현재 페이지 번호
		this.totalElements = totalElements; // 총 데이터 개수
		this.nop = nop; 					// 1페이지 당 개수
	
		this.totalNops = (int) Math.ceil((double)totalElements / quty);
		// 총 페이지 수 (소수점이 나오면 +1 페이지 더함)

		this.startNop = ((int) Math.floor((double)(number) / quty) * quty) + 1;
		// 현재 페이지 블럭의 시작 페이지 번호
		this.startNop = (this.startNop < 1) ? 1 : this.startNop;
		// 시작페이지 번호 보정(1보다 작을 수 없음)
		
		this.endNop = this.startNop + (quty - 1); // 현재 페이지 블럭의 끝 페이지 번호
		this.endNop = (this.endNop > this.totalNops) ? this.totalNops : this.endNop;
		//끝 페이지 보정(총페이지수보다 클 수 없음)
	}
	 //    데이터가 없으면 false, 있으면 true
    	public boolean isEmpty() {
        if (totalElements > 0) {
            return false;
        } else {
            return true;
        }
    }
	
	
	

	
}

