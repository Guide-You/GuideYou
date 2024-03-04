package com.guideyou.dto.product;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;


@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductDto {
	private Integer id; // product index
	private Integer userId;
	private Integer cityCodeId;
	private Integer revenue;
	private String title;
	private String introContent;
	private String content;
	private Long price;
	private Integer productId;
	private MultipartFile[] customFile;
	private MultipartFile thumbFile;
	private String productPhotoPath;
	private String originFileName;
	private String uploadFileName;
	private String thumbnail;
	private Integer soldCount;
	private Integer wishCount;
	private Integer viewCount;
	private String cityName;
	private String nickName;
	private String email;
	private Double score;
	private Timestamp createdAt;
	private String dateType;
	private String data1;
	private String data2;
	
}


