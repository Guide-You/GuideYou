<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.markerbg {
    float: left;
    position: relative;
    width: 36px;
    height: 37px;
    margin: 0 0 -5 0;
    background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
}

.marker_1 { background-position: 0 -10px; }
.marker_2 { background-position: 0 -56px; }
.marker_3 { background-position: 0 -102px; }
.marker_4 {background-position: 0 -148px;}
.marker_5 {background-position: 0 -194px;}
.marker_6 {background-position: 0 -240px;}
.marker_7 {background-position: 0 -286px;}
.marker_8 {background-position: 0 -332px;}
.marker_9 {background-position: 0 -378px;}
.marker_11 {background-position: 0 -470px;}
.marker_12 {background-position: 0 -516px;}
.marker_13 {background-position: 0 -562px;}
.marker_14 {background-position: 0 -608px;}
.marker_15 {background-position: 0 -654px;}
#mapWrapper {
	position: relative; /* 이 부분을 추가 */
}

#locationList {
	top: 0px; /* 상단에서 얼마나 떨어질지 설정 */
	right: 0px; /* 우측에서 얼마나 떨어질지 설정, 필요에 따라 조절 */
	position: absolute; /* 절대 위치 설정 */
	background-color: rgba(255, 255, 255, 0.8); /* 반투명 흰색 배경 */
	padding: 10px;
	border-radius: 8px;
	z-index: 1; /* 지도 위에 표시 */
	display: block; /* 목록 표시 */
	width: 30%; /* 너비 설정 */
	max-height: 90%; /* 최대 높이 설정 */
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤 */
}

.list-item {
    padding: 10px;
    margin-bottom: 10px;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.item-title {
    font-size: 18px;
    color: #333;
    margin-bottom: 5px;
    font-weight: bold;
}

.item-phone, .item-roadAddress, .item-addressName {
    font-size: 14px;
    color: #666;
    margin-bottom: 2px;
}

.item-divider {
    margin-top: 10px;
}
</style>
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Detail Title Start -->
<!-- Title Image 확인 후 사이즈 변경 필요-->
<input type="hidden" name="paidYn" id="paidYn" value="${paidYn}">
<div class="container py-5 product--title text-center">
	<div id="carouselExample" class="carousel slide"
		data-bs-ride="carousel" data-bs-interval="5000">
		<div class="carousel-inner">
			<!-- Iterate over the image list to create carousel slides -->
			<c:forEach items="${imgList}" var="img" varStatus="loop">
				<c:choose>
					<c:when test="${paidYn eq false}">
						<c:if test="${not empty img.thumbnail}">
							<div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
								<img class="d-block w-100"
									src="/images/upload/${img.uploadFileName}"
									alt="Slide ${loop.index + 1}"
									style="max-height: 400px; max-width: 100%; object-fit: contain;">
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
							<img class="d-block w-100"
								src="/images/upload/${img.uploadFileName}"
								alt="Slide ${loop.index + 1}"
								style="max-height: 400px; max-width: 100%; object-fit: contain;">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<!-- Add previous and next buttons for carousel navigation -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<!-- Rest of your code -->

<div class="container title--title">
	<div class="col-lg-12">
		<h1 class="mb-0">${product.productTitle}</h1>
	</div>

	<div class="col-lg-12 detail--title--info" style="margin-top: 20px">
		<span id="title--writer">작성자 : ${product.nickName}</span> <span
			id="title--like"> <img
			src="${wishYn ? '/img/like.png' : '/img/unlike.png'}" alt="like" />
		</span>
	</div>
	<div class="title--rate--price">
		<span class="title--rate">${productAvg.avgScore}</span> <span
			class="title--price">${product.formatPrice()}</span>
	</div>
</div>
<!-- Detail Title End -->

<!-- Purchase detail Start -->
<div class="purchase">
	<h6>
		👨‍👩‍👧‍👦 <span class="purchase--count">${product.soldCount}</span>명의
		여행자가 선택했어요 👨‍👩‍👧‍👦
	</h6>
</div>
<!-- Purchase detail End -->
<input type="hidden" name="loginId" id="login--id"
	value="${principal.id}">

<!-- Request Info to Server -->
<form id="send--detail--form">
	<input type="hidden" name="productId" id="product--id"
		value="${product.productId}"> <input type="hidden"
		name="productTitle" id="product--title"
		value="${product.productTitle}"> <input type="hidden"
		name="sellerNickname" id="seller--nickname"
		value="${product.nickName}"> <input type="hidden"
		name="productPrice" id="product--price" value="${product.price}">
	<input type="hidden" name="thumbnailFileName" id="product--thumbnail"
		value="${thumbnailFileName}"> <input type="hidden"
		name="productAvg" id="title--rate" value="${productAvg.avgScore}">
</form>

<!-- Plan Selling Button Start -->
<div class="container plan--selling--button">
	<button type="button" id="order--button">일정 구매하러 가유 😘</button>
</div>
<!-- Plan Selling Button End -->

<div class="container" style="margin-top: 4%">
	<hr />
</div>

<!-- Detail Content Start -->
<c:choose>
	<c:when test="${principal == null || paidYn eq false}">
		<div class="container">
			<div class="card content--card">
				<div class="card-body">
					<h5 class="card-title">❣️ 상품 소개 글</h5>
					<p class="card-text">${product.introProductContent}</p>
					<div class="space"></div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="card content--card">
				<div class="card-body">
					<h5 class="card-title">❣️ 상품 상세 글</h5>
					<p class="card-text">구매 후 확인할 수 있습니다.</p>
					<div class="space"></div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container">
			<div class="card content--card">
				<div class="card-body">
					<h5 class="card-title">❣️ 상품 소개 글</h5>
					<p class="card-text">${product.introProductContent}</p>
					<div class="space"></div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="card content--card">
				<div class="card-body">
					<h5 class="card-title">❣️ 상품 상세 글</h5>
					<p class="card-text">${product.productContent}</p>
					<div class="space"></div>
					<h6 class="card-subtitle mb-2 text-body-secondary content--email">
						문의 이메일 : <span>${product.email}</span>
					</h6>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<!-- Detail Content End -->

<!-- Map Section Start -->
<div class="">
	<div class="container py-5">
		<div class="col-lg-12">
			<div class="h-100 rounded" id="mapWrapper">
				<div id="map" style="width: 100%; height: 500px;"></div>
				<c:if test="${paidYn eq true}">
				<div id="locationList"
					style="width: 30%; overflow-y: auto; height: 500px;"></div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- Map Section End -->



<div class="container" style="margin-top: 4%">
	<hr />
</div>

<!-- review Section Start -->
<div class="container">
	<section>
		<div id="reviewCarousel" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="false">
			<div class="row d-flex justify-content-center">
				<div class="col-md-10 col-xl-8 text-center">
					<h3 class="mb-4">Review</h3>
				</div>
			</div>
			<div class="carousel-inner">
				<c:forEach items="${reviewList}" var="rev" varStatus="loop">
					<c:if test="${loop.index % 3 == 0}">
						<div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
							<div class="row">
					</c:if>
					<div class="col-md-4 mb-4">
						<div class="d-flex justify-content-center mb-4">
							<c:choose>
								<c:when test="${not empty rev.uploadFileName}">
									<img src="/images/upload/${rev.uploadFileName}"
										class="rounded-circle shadow-1-strong" width="150"
										height="150" />
								</c:when>
								<c:otherwise>
									<img src="https://ifh.cc/g/p0ghTp.png"
										class="rounded-circle shadow-1-strong" width="150"
										height="150" />
								</c:otherwise>
							</c:choose>
						</div>
						<h5 class="mb-3" id="revName">${rev.name}</h5>
						<h6 class="text-primary mb-3" id="revCreatedAt">${rev.formatDateTime()}</h6>
						<p class="px-xl-3 text-center">
							<!-- Modified: Center align the content -->
							<i class="fas fa-quote-left pe-2" id="revContent"></i>${rev.content}
						</p>
						<ul class="list-unstyled d-flex justify-content-center mb-0">
							<c:forEach begin="1" end="5" varStatus="starLoop">
								<c:set var="star" value="${starLoop.index}" />
								<c:choose>
									<c:when test="${rev.score >= star}">
										<i class="fas fa-star fa-sm text-warning"></i>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${rev.score >= star - 0.5}">
												<i class="fas fa-star-half-alt fa-sm text-warning"></i>
											</c:when>
											<c:otherwise>
												<i class="far fa-star fa-sm text-warning"></i>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>

					<input type="hidden" value="${rev.score }" id="review--score">

					<c:if test="${loop.index % 3 == 2 or loop.last}">
			</div>
			<!-- Close the row -->
		</div>
		<!-- Close the carousel-item -->
		</c:if>
		</c:forEach>
</div>
<!-- Add previous and next buttons for carousel navigation -->
<button class="carousel-control-prev" type="button"
	data-bs-target="#reviewCarousel" data-bs-slide="prev">
	<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button"
	data-bs-target="#reviewCarousel" data-bs-slide="next">
	<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="visually-hidden">Next</span>
</button>
</div>
</section>
</div>
<!-- review Section End -->



<!-- footer -->

<!-- 카카오 map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb"></script>
<script src="/js/product/map/readMap.js"></script>

<script src="/js/productDetail.js"></script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>