package com.guideyou.dto.product;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ProductPhotoDto {
	private Integer productId;
	private MultipartFile[] customFile;
	private MultipartFile thumbFile;
	private String productPhotoPath;
	private String originFileName;
	private String uploadFileName;
	private String thumbnail;
}
