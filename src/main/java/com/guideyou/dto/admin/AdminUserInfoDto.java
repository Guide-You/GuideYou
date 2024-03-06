package com.guideyou.dto.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
	
	
	public String formatCreatedAt() {
	    if (createdAt != null) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        return dateFormat.format(createdAt);
	    } else {
	        return ""; // 빈 문자열 반환
	    }
	}
	
	public String formatDeleteAt() {
		if (deleteAt != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateFormat.format(deleteAt);
		} else {
			return ""; // 빈 문자열 반환
		}
	}
}
