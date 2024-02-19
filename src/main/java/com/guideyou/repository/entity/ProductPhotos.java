package com.guideyou.repository.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductPhotos {
	private Integer id;
	private Integer productId;
	private String productPhotoPath;
	private String originFileName;
	private String uploadFileName;
	private Timestamp createdAt;
}
