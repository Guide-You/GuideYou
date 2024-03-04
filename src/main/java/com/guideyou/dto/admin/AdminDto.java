package com.guideyou.dto.admin;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class AdminDto {
	
	private Integer paymentCount;
	private Integer totalPrice;
	private Integer userCount;
	
}
