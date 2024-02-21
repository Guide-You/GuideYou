package com.guideyou.handler.exception;


import org.springframework.http.HttpStatus;

/**
 * @FileName : UnAuthorizedException.java
 * @Project : GuideYou
 * @Date : 2024. 2. 20.
 * @작성자 : 최장호
 * @변경이력 : 
 * @프로그램 설명 : 인증 되지 않았을때 익셉션
 */
public class UnAuthorizedException extends RuntimeException {

	private HttpStatus httpStatus;
	
	public UnAuthorizedException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
}