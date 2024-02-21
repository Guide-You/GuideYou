package com.guideyou.repository.entity;

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
	private Integer userId;
	private Integer cityCodeId;
	private String title;
	private String content;
	private Long price;
	private Integer soldCount;
	private Integer wishCount;
	private Integer viewCount;

}
