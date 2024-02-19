<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.guideyou.config.NaverConfig" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/sign-in" method="post">
		<a href="/login/kakao">
			카카오
		</a>
		<a href="/login/naver">
			네이버
		</a>
		<a href="">
			구글
		</a>
	</form>
</body>
</html>