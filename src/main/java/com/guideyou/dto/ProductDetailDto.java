package com.guideyou.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductDetailDto {
	private Integer productId;
	private Integer userId;
	private String productTitle;
	private String productContent;
	private long price;
	private Integer soldCount;
	private MultipartFile[] uploadFileName;
	private MultipartFile thumbFile;
	private String nickName;
	private String email;
	private Integer wUserId;
	private Integer rProductId;
	private Double score;
	private String reviewContent;
	private Timestamp reviewreatedAt; 
}
