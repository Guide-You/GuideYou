package com.guideyou.dto.product;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductReviewDto {
	private String content;
	private String name;
	private Double score;
	private String uploadFileName;
	private Integer rProductId;
	private Double avgScore;
	private Timestamp createdAt;
	
	
	
	
	public String formatDateTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fomaterDate = dateFormat.format(createdAt);
		
		return fomaterDate;
	}
	
}
