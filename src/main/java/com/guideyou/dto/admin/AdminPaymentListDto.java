package com.guideyou.dto.admin;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class AdminPaymentListDto {
	
	private Integer id;
	private String merchantUid;
	private Integer userId;
	private Long totalPrice;
	private String paymentStatus;            
	private Timestamp paymentDate;            
	private long refundPrice;            
	private String refundCause;            
	private Timestamp refundDate;
	private String refundYn;
	private Timestamp createdAt;
	
	
	
	
	
	public String formatTotalPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formaterNumber = df.format(totalPrice);
		return formaterNumber + "원";
	}
	
	
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
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fomaterDate = dateFormat.format(paymentDate);
		
		return fomaterDate;
	}
	
}
