<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.fruite .fruite-item .fruite-img img {
    height: 170px;
}

.title-text {
	background-color: rgba(255,255,255,0.8);
	border-radius: 2px;
	
}

.searchBtn {
	background-color: #91caff;
	border-radius: 5px;
	padding: 15px 25px;
	margin-left: 25px;
	font-size: 20px;

}

#localName, #popCityName {
	background-color: #91caff;
	top: 10px; 
	right: 10px;
}

</style>


<!-- Hero Start -->
<div class="container-fluid mb-5 hero-header">
	<div class="container py-5">
		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-ride="carousel" data-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/banner1.png" alt="First slide" />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/banner2.png" alt="Second slide" />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/banner3.png" alt="Third slide" />
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Hero End -->
<section class="sc-a37b6b4d-0 iVnkhP">
		<form action="list" id="searchForm">
			<div class="sc-a37b6b4d-1 bBhtyX">
				<input id="searchText" maxlength="20" class="sc-a37b6b4d-2 cpWeqo" value="" placeholder="🔍 어느 도시로 떠나시나요?" name="searchText"/>
					<span class="searchBtn btn" onclick="showCity()">검색</span>
				<input type="hidden" id="cityCodeId" name="cityCodeId">
			</div>
		</form>
	</section>
<!-- Featurs Section Start -->
<div class="container-fluid featurs py-5">
	<div class="container py-5">
		<div class="col-lg-4 text-start">
			<h1>어디가유?</h1>
		</div>
		<div>
			<button class="city-button">
				<img src="/img/main-seoul.jpg" class="city-image" />
				<div class="city-info">
					<a href="/list"><p class="city-name">전체</p></a>
				</div>
			</button>
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

<!-- Vesitable Shop Start-->
<div class="container-fluid vesitable py-5">
	<div class="container py-5">
		<h1 class="mb-0">지역 별 인기 여행지</h1>
		<div class="owl-carousel vegetable-carousel justify-content-center">
			
		<c:forEach items="${popluarLocalProduct}" var="local">	
			<div
				class="border border-primary rounded position-relative vesitable-item">
				<div class="vesitable-img">
					<a href="/detail/${local.id}"><img src="/images/upload/${local.uploadFileName}"
						class="img-fluid w-100 rounded-top top-city" alt="" /></a>
				</div>
				<div
					class="text-white bg-primary px-3 py-1 rounded position-absolute"
					id="localName">${local.cityName}</div>
			</div>
		</c:forEach>	
			
			
		</div>
	</div>
</div>
<!-- Vesitable Shop End -->

<!-- Fruits Shop Start-->
<div class="container-fluid fruite">
	<div class="container">
		<div class="tab-class text-center">
			<div class="row g-4">
				<div class="col-lg-4 text-start">
					<h1>인기 플랜</h1>
				</div>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="row g-4">
								
								<c:forEach items="${popluarProduct}" var="pop">
									<div class="col-md-6 col-lg-4 col-xl-3">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="/images/upload/${pop.uploadFileName}"
													class="img-fluid w-100 rounded-top" alt="" />
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												 id="popCityName">${pop.cityName}</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<a href="/detail/${pop.id}"><h4>${pop.title}</h4></a>
												<a href="/detail/${pop.id}"><p>${pop.content}</p></a>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">${pop.price}</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> 구경하기</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>	
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Banner Section Start-->
				<div
					class="container-fluid banner bg-secondary my-5 banner-promotion">
					<div class="row g-4">
						<img src="img/banner-promotion.png" />
					</div>
				</div>
				<!-- Banner Section End -->

				<!-- Fact Start -->
				<div class="container-fluid py-5">
					<div class="container">
						<div class="bg-light p-5 rounded">
							<div class="row g-4 justify-content-center">
								<div class="col-md-6 col-lg-6 col-xl-3">
									<div class="counter bg-white rounded p-5">
										<i class="fa fa-users text-secondary"></i>
										<h4>여행 플랜 수</h4>
										<h1>${count.productCount}개</h1>
									</div>
								</div>
								<div class="col-md-6 col-lg-6 col-xl-3">
									<div class="counter bg-white rounded p-5">
										<i class="fa fa-users text-secondary"></i>
										<h4>이용자 수</h4>
										<h1>${count.userCount}명</h1>
									</div>
								</div>							
								<div class="col-md-6 col-lg-6 col-xl-3">
									<div class="counter bg-white rounded p-5">
										<i class="fa fa-users text-secondary"></i>
										<h4>총 후기 수</h4>
										<h1>${count.reviewCount}개</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Fact Start -->

				<!-- Tastimonial Start -->
				<div class="container-fluid testimonial py-5">
					<div class="container py-5">
						<div class="testimonial-header text-center">
							<h1 class="display-5 mb-5 text-dark">공지사항</h1>
						</div>
						<div class="owl-carousel testimonial-carousel">
							<div
								class="testimonial-item img-border-radius bg-light rounded p-4">
								<div class="position-relative">
									<div class="mb-4 pb-4 border-bottom border-secondary">
										<p class="mb-0">[이벤트] KTX 서울-부산 반값으로 가자!</p>
									</div>
								</div>
							</div>
							<div
								class="testimonial-item img-border-radius bg-light rounded p-4">
								<div class="position-relative">
									<div class="mb-4 pb-4 border-bottom border-secondary">
										<p class="mb-0">[이벤트] KTX 서울-부산 반값으로 가자!</p>
									</div>
								</div>
							</div>
							<div
								class="testimonial-item img-border-radius bg-light rounded p-4">
								<div class="position-relative">
									<div class="mb-4 pb-4 border-bottom border-secondary">
										<p class="mb-0">[멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중</p>
									</div>
								</div>
							</div>
							<div
								class="testimonial-item img-border-radius bg-light rounded p-4">
								<div class="position-relative">
									<div class="mb-4 pb-4 border-bottom border-secondary">
										<p class="mb-0">[멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중</p>
									</div>
								</div>
							</div>
							<div
								class="testimonial-item img-border-radius bg-light rounded p-4">
								<div class="position-relative">
									<div class="mb-4 pb-4 border-bottom border-secondary">
										<p class="mb-0">[멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Tastimonial End -->
			</div>
		</div>
	</div>
</div>

<script>

function showCity(id) {
	$("#cityCodeId").val(id);
	$("#searchForm").submit();
	

}
</script>

<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
