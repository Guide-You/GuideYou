package com.guideyou.dto.payment;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.ToString;

/**
  * @FileName : PaymentCompleteDto.java
  * @Project : GuideYou
  * @Date : 2024. 3. 5. 
  * @작성자 : 박경진
  * @변경이력 :
  * @프로그램 설명 : 결제 완료 된 payment 정보 DTO
  */
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentCompleteDto {
	private Integer productId;
	private String merchantUid;
	private Timestamp paymentDate;
	private Integer productPrice;
	private String productPhoto;
	private String productTitle;
	private Integer totalPrice;
	private String seller;
	
	
	
	
	
	public String formatProductPrice() {
        if (productPrice != 0L) { // 변경된 타입에 따라 null 대신 0L로 비교
            DecimalFormat df = new DecimalFormat("#,###");
            String formaterNumber = df.format(productPrice);
            return formaterNumber + "원";
        } else {
            return ""; // 빈 문자열 반환
        }
    }
	public String formatTotalPrice() {
		if (totalPrice != 0L) { // 변경된 타입에 따라 null 대신 0L로 비교
			DecimalFormat df = new DecimalFormat("#,###");
			String formaterNumber = df.format(totalPrice);
			return formaterNumber + "원";
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
