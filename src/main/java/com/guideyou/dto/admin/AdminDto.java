package com.guideyou.dto.admin;

import java.text.DecimalFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class AdminDto {
	
	private Integer paymentCount;
	private Integer totalPrice;
	private Integer userCount;
	private String createdAt;
	private String selectedDateType;
	
	
	public String formatTotalPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formaterNumber = df.format(totalPrice);
		return formaterNumber + "원";
	}
	
}
