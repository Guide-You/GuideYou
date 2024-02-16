package com.guideyou.dto;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductSaveFormDto {
	private Integer userId;
	private String title;
	private String content;
	private Long price;
	private MultipartFile customFile;
	
	private String originFileName;
	private String uploadFileName;
}
