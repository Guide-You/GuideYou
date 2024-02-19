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
		<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=f0f884969309f29b7fbfc740d5cdc024&redirect_uri=http://localhost:80/user/kakao-callback">
			<img alt="" src="/images/kakao_login_small.png" width="75" height="38">
		</a>
		<a href="/login/naver">
			<img alt="" src="/images/btnG_naver.png" width="111" height="39.9967">
		</a>
	</form>
</body>
</html>