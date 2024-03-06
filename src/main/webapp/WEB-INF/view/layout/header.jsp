<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Guide you</title>

<!-- 결제 PortOne JavaScript -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- 부트스트랩 JavaScript 및 jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="/js/lightbox/css/lightbox.min.css" rel="stylesheet" />
<link href="/js/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />

<!--datepicker-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet" />
</head>

<body>
	<header>
		<!-- Spinner Start -->
		<div id="spinner"
			class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-grow text-primary" role="status"></div>
		</div>
		<!-- Spinner End -->

		<!-- Navbar start -->
		<div class="container-fluid fixed-top">
			<div class="container topbar bg-primary d-none d-lg-block">
				<div class="d-flex justify-content-between">
					<div class="top-info ps-2">
						<small class="me-3"><i
							class="fas fa-map-marker-alt me-2 text-secondary"></i> <a
							href="#" class="text-white">123 Street, New York</a></small> <small
							class="me-3"><i
							class="fas fa-envelope me-2 text-secondary"></i><a href="#"
							class="text-white">Email@Example.com</a></small>
					</div>
					<div class="top-link pe-2">
						<c:choose>
							<c:when test="${principal == null}">

								<a href="/signIn" class="text-white"><small
									class="text-white mx-2">로그인</small>/</a>
							</c:when>
							<c:otherwise>
								<c:if test="${principal.role eq 'ADMIN'}">
									<a href="/admin" class="text-white"><small
										class="text-white mx-2">관리자 페이지</small>/</a>
								</c:if>

								<a href="/member/logout" class="text-white"><small
									class="text-white mx-2">로그아웃</small>/</a>
							</c:otherwise>
						</c:choose>
						<a href="/save" class="text-white"><small
							class="text-white mx-2">글쓰기</small>/</a> <a href="/company/policy"
							class="text-white"><small
							class="text-white mx-2">약관</small>/</a> <a
							href="/company/boardList/Notice" class="text-white"><small
							class="text-white mx-2">고객센터</small>/</a> <a
							href="/company/boardInsert" class="text-white"><small
							class="text-white ms-2">문의하기</small></a>
					</div>
				</div>
			</div>
			<div class="container px-0">
				<nav
					class="navbar navbar-light bg-white navbar-expand-xl header--line">
					<div class="logo--image--container">
						<a href="/main" class="navbar-brand"> <!-- <h1 class="text-primary display-6">GUIDE YOU</h1> -->
							<img alt="원본 로고" src="/img/guideyou_logo_origin.png"
							class="original--logo" style="width: 200px; height: 200px;">
							<img alt="호버 로고" src="/img/guideyou_logo_hover.png"
							class="hover--logo" style="width: 200px; height: 200px;">
						</a>
					</div>
					<button class="navbar-toggler py-2 px-3" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="fa fa-bars text-primary"></span>
					</button>
					<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
						<div class="navbar-nav mx-auto"></div>
						<div class="d-flex m-3 me-0">
							<a href="/member/cartList" class="position-relative me-4 my-auto">
								<i class="fa fa-shopping-bag fa-2x"></i> <c:if
									test="${principal != null}">
									<span
										class="position-absolute alert-badge rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
										style="top: -5px; left: 15px; height: 20px; min-width: 20px"></span>
								</c:if>
							</a> <a href="/member/profile" class="my-auto"> <i
								class="fas fa-user fa-2x"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<!-- Navbar End -->
	</header>
</body>
</html>
