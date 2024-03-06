<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/admin/layout/header.jsp"%>     
	
<!-- sidebar -->
<%@ include file="/WEB-INF/view/admin/layout/sidebar.jsp"%>     

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
													<h6>${productList4.formatTotalPrice()}</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<div class="ps-3">
													<h6>${productList4.formatTotalPrice()}</h6>
												</div>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<div class="ps-3">
													<h6>${productList4.formatTotalPrice()}</h6>
												</div>
											</c:when>
											<c:otherwise>
												<div class="ps-3">
													<h6>${productList4.formatTotalPrice()}</h6>
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
															<td><a href="/detail/${post.productId}" class="text-primary">${post.title}</a></td>
															<td>${post.formatPrice()}</td>
															<td><span class="badge bg-success">${post.formatDateTime()}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 2}">
													<c:forEach items="${productList}" var="post">
														<tr>
															<td>${post.nickName}</td>
															<td><a href="/detail/${post.productId}" class="text-primary">${post.title}</a></td>
															<td>${post.formatPrice()}</td>
															<td><span class="badge bg-success">${post.formatDateTime()}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 3}">
													<c:forEach items="${productList}" var="info">
														<tr>
															<td>${info.nickName}</td>
															<td><a href="/detail/${info.productId}" class="text-primary">${info.title}</a></td>
															<td>${info.formatPrice()}</td>
															<td><span class="badge bg-success">${info.formatDateTime()}</span></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${productList}" var="info">
														<tr>
															<td>${info.nickName}</td>
															<td><a href="/detail/${info.productId}" class="text-primary">${info.title}</a></td>
															<td>${info.formatPrice()}</td>
															<td><span class="badge bg-success">${info.formatDateTime()}</span></td>
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
															<td><a href="/detail/${post.productId}" class="text-primary fw-bold">${post.introContent}</a></td>
															<td>${post.formatPrice()}</td>
															<td class="fw-bold">${post.soldCount}</td>
															<td>${post.formatRevenue()}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 2}">
													<c:forEach items="${productList2}" var="post">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${post.uploadFileName}" alt=""></a>
															</th>
															<td><a href="/detail/${post.productId}" class="text-primary fw-bold">${post.introContent}</a></td>
															<td>${post.formatPrice()}</td>
															<td class="fw-bold">${post.soldCount}</td>
															<td>${post.formatRevenue()}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:when test="${param.dateType == 3}">
													<c:forEach items="${productList2}" var="info">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${info.uploadFileName}" alt=""></a>
															</th>
															<td><a href="/detail/${info.productId}" class="text-primary fw-bold">${info.introContent}</a></td>
															<td>${info.formatPrice()}</td>
															<td class="fw-bold">${info.soldCount}</td>
															<td>${info.formatRevenue()}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach items="${productList2}" var="info">
														<tr>
															<th scope="row"><a href="#"><img
																	src="/images/upload/${info.uploadFileName}" alt=""></a>
															</th>
															<td><a href="/detail/${info.productId}" class="text-primary fw-bold">${info.introContent}</a></td>
															<td>${info.formatPrice()}</td>
															<td class="fw-bold">${info.soldCount}</td>
															<td>${info.formatRevenue()}</td>
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
														<td><a href="/company/boardDetail/${board.boardId}">${board.title}</a></td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${param.dateType == 2}">
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td><a href="/company/boardDetail/${board.boardId}">${board.title}</a></td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${param.dateType == 3}">
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td><a href="/company/boardDetail/${board.boardId}">${board.title}</a></td>
														<td>${board.content}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${productList6}" var="board">
													<tr>
														<td>${board.type}</td>
														<td><a href="/company/boardDetail/${board.boardId}">${board.title}</a></td>
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
    	console.log(totalPrice);
    	console.log(userCount);
    	console.log(createdAt);
    	
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
                    format: 'dd/MM/yy HH'
                },
            }
        });
        
        chart.render();
    }
 });

</script>
<!-- footer -->
<%@ include file="/WEB-INF/view/admin/layout/footer.jsp"%>