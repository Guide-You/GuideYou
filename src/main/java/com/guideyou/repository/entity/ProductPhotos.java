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
	private Integer product_id;
	private String product_photo_path;
	private String origin_file_name;
	private String upload_file_name;
	private Timestamp created_at;
}
