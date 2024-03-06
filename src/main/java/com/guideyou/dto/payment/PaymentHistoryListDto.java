package com.guideyou.dto.payment;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/**
  * @FileName : PaymentHistoryListDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 5. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제 내역 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentHistoryListDto {
	private String merchantUid;
	private String title;
	private String seller;
	private Integer paymentPrice;
	private Timestamp paymentDate;
	
	private long refundPrice;            
	private String refundCause;            
	private Timestamp refundDate;
	private String refundYn;
	
	
	public String formatRefundPrice() {
        if (refundPrice != 0L) { // 변경된 타입에 따라 null 대신 0L로 비교
            DecimalFormat df = new DecimalFormat("#,###");
            String formaterNumber = df.format(refundPrice);
            return formaterNumber + "원";
        } else {
            return ""; // 빈 문자열 반환
        }
    }
	
	public String formatRefundDate() {
	    if (refundDate != null) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        return dateFormat.format(refundDate);
	    } else {
	        return ""; // 빈 문자열 반환
	    }
	}
	
	public String formatPaymentDate() {
	    if (refundDate != null) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        return dateFormat.format(paymentDate);
	    } else {
	        return ""; // 빈 문자열 반환
	    }
	}
}
