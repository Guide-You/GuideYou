package com.guideyou.handler;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.guideyou.handler.exception.UnAuthorizedException;
import com.guideyou.repository.entity.User;
import com.guideyou.utils.Define;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * @FileName : AuthInterceptor.java
 * @Project : GuideYou
 * @Date : 2024. 2. 20.
 * @작성자 : 최장호
 * @변경이력 : 
 * @프로그램 설명 : 인증 인터셉터
 */
@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	// preHandle
	// 컨트롤러 들어오기 전에 동작.
	// true -> 컨트롤러 안으로 들어감
	// false -> 안들어감.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("***************** 인터 셉터 동작 확인 *****************");
		// 인증 검사
		HttpSession session = request.getSession();
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		
		// TODO : 결제 session 세팅해야함. 결제 Exception 작성해야함. 결제 validation 추가 필요.
		
		if(principal == null) {
//			 response.sendRedirect("/user/sign-in");

			// 예외 처리
			throw new UnAuthorizedException("로그인 먼저 해주세요", HttpStatus.UNAUTHORIZED);
		}
		//
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	// postHandle
	// 뷰가 렌더링 되기 전에 호출 되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	// afterCompletion
	// 요청 처리가 완료 된 후, 뷰 렌더링이 완료된 후 호출된다.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
