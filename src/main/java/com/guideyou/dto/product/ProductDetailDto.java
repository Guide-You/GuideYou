package com.guideyou.dto.product;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductDetailDto {
	private Integer productId;
	private Integer userId;
	private String productTitle;
	private String introProductContent;
	private String productContent;
	private Long price;
	private Integer soldCount;
	private String uploadFileName;
	private String nickName;
	private String email;
	private Integer wUserId;
	private Integer rProductId;
	private Double score;
	private String reviewContent;
	private Timestamp reviewreatedAt; 
}
