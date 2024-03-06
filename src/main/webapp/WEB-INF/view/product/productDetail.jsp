<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<c:when test="${paidYn} eq false">
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
		<span id="title--writer">작성자 : ${product.nickName}</span> 
			<span
			id="title--like">
			<img src="${wishYn ? '/img/like.png' : '/img/unlike.png'}" alt="like" />
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
<input type="hidden" name="loginId" id="login--id" value="${principal.id}">

<!-- Request Info to Server -->
<form id="send--detail--form">
	<input type="hidden" name="productId" id="product--id" value="${product.productId}"> 
	<input type="hidden" name="productTitle" id="product--title" value="${product.productTitle}"> 
	<input type="hidden" name="sellerNickname" id="seller--nickname" value="${product.nickName}">
	<input type="hidden" name="productPrice" id="product--price" value="${product.price}">
	<input type="hidden" name="productAvg" id="title--rate" value="${productAvg.avgScore}">
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
			<div class="h-100 rounded">
				<div id="map" style="width: 100%; height: 350px;"></div>
				<div id="locationList"></div>
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
							<img
								src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(9).webp"
								class="rounded-circle shadow-1-strong" width="150" height="150" />
						</div>
						<h5 class="mb-3" id="revName">${rev.name}</h5>
						<h6 class="text-primary mb-3" id="revCreatedAt">${rev.createdAt}</h6>
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