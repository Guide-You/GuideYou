package com.guideyou.dto.admin;

import java.sql.Timestamp;

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
	private Long refundPrice;            
	private String refundCause;            
	private Timestamp refundDate;
	private String refundYn;
	private Timestamp createdAt;               
	
}
