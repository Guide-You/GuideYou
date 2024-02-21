package com.guideyou.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.guideyou.handler.AuthInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private AuthInterceptor authInterceptor;

	// 요청 올때 마다 domain URI 검사를 할 예정
	// /account/xxx <- 으로 들어오는 도메인을 다 검사해!!!
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO : 인증 필요한 인터셉터 2개. 1) payment 2) login auth
//		registry.addInterceptor(authInterceptor).addPathPatterns("/product/details/**").addPathPatterns("/member/**");
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/upload/**")
		.addResourceLocations("file:///C:\\wok_spring\\upload/");
	}
}
