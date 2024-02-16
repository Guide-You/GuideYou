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
public class Product {
	private Integer id;
	private Integer user_id;
	private String title;
	private String content;
	private Long price;
	private Integer sold_count;
	private Integer wish_count;
	private Integer view_count;
	private Timestamp created_at;
}
