<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/productList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	

	
<body>
	
	<!-- Search Start -->
	<section class="sc-a37b6b4d-0 iVnkhP">
		<form action="list" id="searchForm">
			<div class="sc-a37b6b4d-1 bBhtyX">
				<input id="searchText" maxlength="20" class="sc-a37b6b4d-2 cpWeqo" value="" placeholder="🔍 어느 도시로 떠나시나요?" name="searchText"/>
					<span class="searchBtn btn" onclick="showCity()">검색</span>
				<input type="hidden" id="cityCodeId" name="cityCodeId">
			</div>
		</form>
	</section>
	<!-- Search End -->

	<!-- City Photo Start -->
	<div class="container-fluid mb-5">
		<div class="container py-5">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="/img/banner1.png" alt="First slide" />
				</div>
			</div>
		</div>
	</div>
	<!-- City Photo End -->

	<!-- Featurs Section Start -->
	<div class="">
		<div class="container py-5">
			<div class="col-lg-4 text-start">
				<h1>어디가유?</h1>
			</div>
			<div>
				<button class="city-button" onclick="showCity('1')">
					<img src="/img/main-seoul.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">서울</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('2')">
					<img src="/img/main-busan.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">부산</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('3')">
					<img src="/img/main-incheon.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">인천</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('4')">
					<img src="/img/main-daegu.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">대구</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('5')">
					<img src="/img/main-daejeon.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">대전</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('6')">
					<img src="/img/main-gwangju.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">광주</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('7')">
					<img src="/img/main-gyeonggi-do.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">경기도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('8')">
					<img src="/img/main-chungcheong-do.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">충청도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('9')">
					<img src="/img/main-jeolla-do.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">전라도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('1')">
					<img src="/img/main-gyeongsang-do.jpeg" class="city-image" />
					<div class="city-info">
						<p class="city-name">경상도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('11')">
					<img src="/img/main-gangwon-do.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">강원도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('12')">
					<img src="/img/main-jeju.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">제주도</p>
					</div>
				</button>
				<button class="city-button" onclick="showCity('13')">
					<img src="/img/main-jeju.jpg" class="city-image" />
					<div class="city-info">
						<p class="city-name">기타</p>
					</div>
				</button>
			</div>
		</div>
	</div>

	<!-- Featurs Section End -->

	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite">
		<div class="container">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-4 text-start">
						<h1>어디든 가유</h1>
					</div>

					<div class="tab-content">
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="row g-4">

										<c:forEach items="${productList}" var="prod" varStatus="loop">
											<div class="col-md-6 col-lg-4 col-xl-3">
												<div class="rounded position-relative fruite-item card"
													id="card-${loop.index}">
													<!-- Your existing card content -->
													<div class="fruite-img">
														<img src="/images/upload/${prod.uploadFileName}"
															class="img-fluid w-100 rounded-top" />
													</div>
													<div
														class="title-text bg-secondary px-3 py-1 rounded position-absolute"
														style="top: 10px; left: 10px;">${prod.cityName}</div>
													<div
														class="p-4 border border-secondary border-top-0 rounded-bottom"
														style="max-height: 300px; overflow: hidden;">
														<!-- Link added to the title -->
														<a href="/detail/${prod.id}"><h4>${prod.title}</h4></a>
														<!-- Assuming "id" is the unique identifier for each product -->
														<!-- Adjusted prod.content -->
														<a href="/detail/${prod.id}">
														<p style="font-size: 14px; line-height: 1.5; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
															${prod.content}</p></a>
														<div class="d-flex justify-content-between flex-lg-wrap">
															<p class="text-dark fs-5 fw-bold mb-0">${prod.formatPrice()}</p>
															<a href="#"
																class="btn border border-secondary rounded-pill px-3 text-primary">
																<i class="fa fa-shopping-bag me-2 text-primary"></i>구경가기
															</a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>

										<!-- 페이징 처리 -->
										<div class="pagination justify-content-center mb-5">
											<c:if test="${page > 1}">
												<a href="?page=1&size=${size}">&laquo; 첫 페이지</a>
												<a href="?page=${page - 1}&size=${size}">&laquo; 이전</a>
											</c:if>
											<c:forEach begin="${startPage}" end="${endPage}" var="i">
												<c:choose>
													<c:when test="${i eq page}">
														<a href="?page=${i}&size=${size}" class="active">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="?page=${i}&size=${size}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${page < totalPages}">
												<a href="?page=${page + 1}&size=${size}">다음 &raquo;</a>
												<a href="?page=${totalPages}&size=${size}">마지막 페이지
													&raquo;</a>
											</c:if>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- footer -->
<script src="/js/productList.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
