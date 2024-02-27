package com.guideyou.dto.product;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductReviewDto {
	private String content;
	private String name;
	private Double score;
	private String uploadFileName;
	private Timestamp createdAt;
}
