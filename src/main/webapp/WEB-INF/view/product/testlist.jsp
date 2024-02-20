<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<!-- 검색 창 -->
		<form name="search-form" action="/select" method="post"
			autocomplete="off">
			<input type="text" name="keyword" placeholder="검색어를 입력하세요"></input> <input
				type="button" onclick="getSearchList()"
				class="btn btn-outline-primary mr-2" value="검색"></input>
		</form>
	</header>
	<main>
		<c:forEach items="${product}" var="prod">
				<div class="card" style="width: 18rem;">
					<img src="/images/upload/${uploadFileName}"
						class="card-img-top">
					<div class="card-body">
						<p class="card-title">제목 : ${prod.title}</p>
						<p class="card-text">${prod.content}</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">가격 : ${prod.price}</li>
					</ul>
					<div class="d-flex">
						<form action="/delete/${prod.id}" method="post">
							<button class="btn btn-danger">삭제</button>
						</form>
						<form action="/update/${prod.id}" method="get">
							<button class="btn btn-warning updateBtn">수정</button>
							<input type="hidden" name="productId" value="${prod.id}">
						</form>
					</div>
				</div>
		</c:forEach>
	</main>
</body>
</html>
