package com.guideyou.dto;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

// TODO: DTO명 수정 (2024.02.21 경진) - 확인자 : 명근 
@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductDto {
	private Integer id;
	private Integer userId;
	private Integer cityCodeId;
	private String title;
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
}


