<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>가유 Guide You 관리자 페이지</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="admin/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="admin/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="admin/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="/admin" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">Guide You</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> </a> <!-- End Profile Iamge Icon -->
				
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="/admin"> <i
					class="bi bi-grid"></i> <span>관리자 main</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>회원</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>회원정보
								리스트</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>카테고리
								별 검색 기능</span>
					</a></li>
					<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>신고
								관리</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>수익</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>판매 수익</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li>


			
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>관리자 게시판 관리</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/admin/adminComment"> <i class="bi bi-circle"></i><span>QnA
								관리자 권한 댓글 등록 삭제</span>
					</a></li>
					<li><a href="/admin/adminList"> <i
							class="bi bi-circle"></i><span>관리자 권한 FaQ 관리</span>
					</a></li>
					<li><a href="/admin/adminList"> <i
							class="bi bi-circle"></i><span>관리자 권한 Notice 관리</span>
					</a></li>
					
				</ul></li>
			<!-- End Charts Nav -->
			
			<!-- End F.A.Q Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<!-- hidden_input -->
<!-- 		<input type="hidden" id="dateType" name="dateType" value=""> -->

		<div class="pagetitle">
			<h1>가유 관리자 main</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		
		<div class="filter">
			<form action="/admin" method="get" id="searchForm">
				<select id="dateTypeSelect" name="dateType" class="form-select">
					<option value="1" <c:if test="${param.dateType == 1}">selected</c:if>>오늘</option>
					<option value="2" <c:if test="${param.dateType == 2}">selected</c:if>>이번 달</option>
					<option value="3" <c:if test="${param.dateType == 3}">selected</c:if>>올해</option>
				</select>
			</form>	
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">
								<div class="card-body">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												판매 갯수 <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												판매 갯수 <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												판매 갯수 <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												판매 갯수 <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<c:choose>
											<c:when test="${param.dateType == 1}">
												<div class="ps-3">
													<h6>${productList3.paymentCount}개</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<div class="ps-3">
													<h6>${productList3.paymentCount}개</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<div class="ps-3">
													<h6>${productList3.paymentCount}개</h6>
												</div>
											</c:when>
											<c:otherwise>
												<div class="ps-3">
													<h6>${productList3.paymentCount}개</h6>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">
								<div class="card-body">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												판매 금액 <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												판매 금액 <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												판매 금액 <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												판매 금액 <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<c:choose>
											<c:when test="${param.dateType == 1}">
												<div class="ps-3">
													<h6>${productList4.totalPrice}원</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<div class="ps-3">
													<h6>${productList4.totalPrice}원</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<div class="ps-3">
													<h6>${productList4.totalPrice}원</h6>
												</div>
											</c:when>
											<c:otherwise>
												<div class="ps-3">
													<h6>${productList4.totalPrice}원</h6>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">
							<div class="card info-card customers-card">
								<div class="card-body">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												가입자 <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												가입자 <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												가입자 <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												가입자 <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<c:choose>
											<c:when test="${param.dateType == 1}">
												<div class="ps-3">
													<h6>${productList5.userCount}명</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<div class="ps-3">
													<h6>${productList5.userCount}명</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<div class="ps-3">
													<h6>${productList5.userCount}명</h6>
												</div>
											</c:when>
											<c:otherwise>
												<div class="ps-3">
													<h6>${productList5.userCount}명</h6>
												</div>
											</c:otherwise>
										</c:choose>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												Reports <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												Reports <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												Reports <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												Reports <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>
									<!-- Line Chart -->
									<div id="reportsChart"></div>									
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">
								<div class="card-body">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												등록한 게시물 <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												등록한 게시물 <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												등록한 게시물 <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												등록한 게시물 <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>
									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">판매자</th>
												<th scope="col">상품명</th>
												<th scope="col">가격</th>
												<th scope="col">상품 등록일</th>
											</tr>
										</thead>

										<tbody>
											<c:choose>
												<c:when test="${param.dateType == 1}">
													<c:forEach items="${productList}" var="post">
														<tr>
															<td>${post.nickName}</td>
															<td><a href="#" class="text-primary">${post.title}</a></td>
															<td>${post.price}</td>
															<td><span class="badge bg-success">${post.createdAt}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 2}">
													<c:forEach items="${productList}" var="post">
														<tr>
															<td>${post.nickName}</td>
															<td><a href="#" class="text-primary">${post.title}</a></td>
															<td>${post.price}</td>
															<td><span class="badge bg-success">${post.createdAt}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 3}">
													<c:forEach items="${productList}" var="info">
														<tr>
															<td>${info.nickName}</td>
															<td><a href="#" class="text-primary">${info.title}</a></td>
															<td>${info.price}</td>
															<td><span class="badge bg-success">${info.createdAt}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${productList}" var="info">
														<tr>
															<td>${info.nickName}</td>
															<td><a href="#" class="text-primary">${info.title}</a></td>
															<td>${info.price}</td>
															<td><span class="badge bg-success">${info.createdAt}</span></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<div class="col-12">
							<div class="card top-selling overflow-auto">

								<div class="card-body pb-0">
									<c:choose>
										<c:when test="${param.dateType == 1}">
											<h5 class="card-title">
												인기상품 <span>| 오늘</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 2}">
											<h5 class="card-title">
												인기상품 <span>| 이번 달</span>
											</h5>
										</c:when>
										<c:when test="${param.dateType == 3}">
											<h5 class="card-title">
												인기상품 <span>| 올해</span>
											</h5>
										</c:when>
										<c:otherwise>
											<h5 class="card-title">
												인기상품 <span>| 오늘</span>
											</h5>
										</c:otherwise>
									</c:choose>

									<table class="table table-borderless datatable"
										id="productTable">
										<thead>
											<tr>
												<th scope="col">이미지</th>
												<th scope="col">상품</th>
												<th scope="col">가격</th>
												<th scope="col">판매 수</th>
												<th scope="col">수익</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${param.dateType == 1}">
													<c:forEach items="${productList2}" var="post">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${post.uploadFileName}" alt=""></a>
															</th>
															<td><a href="#" class="text-primary fw-bold">${post.introContent}</a></td>
															<td>${post.price}원</td>
															<td class="fw-bold">${post.soldCount}</td>
															<td>${post.revenue}원</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 2}">
													<c:forEach items="${productList2}" var="post">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${post.uploadFileName}" alt=""></a>
															</th>
															<td><a href="#" class="text-primary fw-bold">${post.introContent}</a></td>
															<td>${post.price}원</td>
															<td class="fw-bold">${post.soldCount}</td>
															<td>${post.revenue}원</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 3}">
													<c:forEach items="${productList2}" var="info">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${info.uploadFileName}" alt=""></a>
															</th>
															<td><a href="detail/{productId}" class="text-primary fw-bold">${info.introContent}</a></td>
															<td>${info.price}원</td>
															<td class="fw-bold">${info.soldCount}</td>
															<td>${info.revenue}원</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${productList2}" var="info">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${info.uploadFileName}" alt=""></a>
															</th>
															<td><a href="#" class="text-primary fw-bold">${info.introContent}</a></td>
															<td>${info.price}원</td>
															<td class="fw-bold">${info.soldCount}</td>
															<td>${info.revenue}원</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- News & Updates Traffic -->
					<div class="card">

						<div class="card-body pb-0">

							<c:choose>
								<c:when test="${param.dateType == 1}">
									<h5 class="card-title">
										News <span>| 오늘</span>
									</h5>
								</c:when>
								<c:when test="${param.dateType == 2}">
									<h5 class="card-title">
										News <span>| 이번 달</span>
									</h5>
								</c:when>
								<c:when test="${param.dateType == 3}">
									<h5 class="card-title">
										News <span>| 올해</span>
									</h5>
								</c:when>
								<c:otherwise>
									<h5 class="card-title">
										News <span>| 오늘</span>
									</h5>
								</c:otherwise>
							</c:choose>
							<div class="table-responsive">
								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">Type</th>
											<th scope="col">Title</th>
											<th scope="col">Content</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${param.dateType == 1}">
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td>${board.title}</td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td>${board.title}</td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td>${board.title}</td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td>${board.title}</td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>

								</table>
							</div>
							<!-- End table responsive -->
						</div>
					</div>
					<!-- End News & Updates -->

				</div>
				<!-- End Right side columns -->

			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Guide You</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="admin/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="admin/vendor/chart.js/chart.umd.js"></script>
	<script src="admin/vendor/echarts/echarts.min.js"></script>
	<script src="admin/vendor/quill/quill.min.js"></script>
	<script src="admin/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="admin/vendor/tinymce/tinymce.min.js"></script>
	<script src="admin/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="admin/js/main.js"></script>
<script>
let data = ${chartInformationList};
console.log(data);


document.addEventListener("DOMContentLoaded", () => {
	
	$('#dateTypeSelect').on("change", function(){
		$("#searchForm").submit();
	});
	
    let chart = null; // 차트 변수 선언
	    

    // 페이지가 로드될 때 실행
    createChart(data);
    

    // 차트 생성 함수
    function createChart(data) {
    	let paymentCount = [];
    	let totalPrice = [];
    	let userCount = [];
    	let createdAt = [];
    	
    	$.each(data,function(key,val){
    		paymentCount.push(val.paymentCount);
    		totalPrice.push(val.totalPrice / 10000);
    		userCount.push(val.userCount);
    		createdAt.push(val.createdAt);
    		
    	});
    	console.log(paymentCount);
        chart = new ApexCharts(document.querySelector("#reportsChart"), {
            series: [{
                name: '판매 갯수',
                data: paymentCount
              }, {
                name: '판매 금액(만원)',
                data: totalPrice
              }, {
                name: '가입자',
                data: userCount
              }],
            chart: {
                height: 350,
                type: 'bar',
                stacked: true,
                toolbar: {
                    show: false
                },               
            },
            markers: {
                size: 5
            },
            colors: ['#4154f1', '#2eca6a', '#ff771d'],
            fill: {
                type: "gradient",
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.3,
                    opacityTo: 0.4,
                    stops: [0, 90, 100]
                }
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 2
            },
            xaxis: {
                type: 'datetime',
                categories: createdAt
            },
            tooltip: {
                x: {
                    format: 'dd/MM/yy'
                },
            }
        });
        
        chart.render();
    }
 });

</script>

</body>
</html>