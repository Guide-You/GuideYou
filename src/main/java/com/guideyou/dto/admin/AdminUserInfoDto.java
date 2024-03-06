package com.guideyou.dto.admin;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class AdminUserInfoDto {
	
	private Integer id;
	private String name;
	private String nickname;
	private String gender;
	private String email;
	private String phone;
	private Timestamp createdAt;
	private String deleteYn;
	private Timestamp deleteAt;
}
