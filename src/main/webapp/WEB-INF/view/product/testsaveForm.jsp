<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<style>
/* 이미지 컨테이너에 대한 스타일 */
#detailImageContainer {
    display: flex;
    flex-wrap: wrap; /* 이미지들이 여러 줄에 걸쳐 표시되도록 설정 */
    gap: 10px; /* 이미지 간의 간격 설정 (원하는 크기로 조절) */
}

/* 각 이미지에 대한 스타일 */
#detailImageContainer img {
    width: 100px; /* 이미지의 가로 크기를 원하는 크기로 조절 */
    height: 100px; /* 이미지의 세로 크기를 원하는 크기로 조절 */
    object-fit: cover; /* 이미지가 컨테이너에 맞게 잘리지 않도록 설정 */
    border-radius: 5px; /* 이미지에 둥근 테두리 설정 */
    margin-right: 5px; /* 이미지 간의 우측 마진 설정 (원하는 크기로 조절) */
    margin-bottom: 5px; /* 이미지 간의 하단 마진 설정 (원하는 크기로 조절) */
}
.form-photo {
    margin-right: 100px; /* 이미지 사이의 우측 마진을 설정 (원하는 크기로 조절) */
}
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
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/css/productcss/saveUpdate.css" rel="stylesheet" />
<!-- 지도 css -->
<link href="/css/productcss/map/insertMap.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>




<div class="container-fluid contact">
	<div class="container">
		<div class="p-5 bg-light rounded">



			<div class="container">
				<form id="productForm" enctype="multipart/form-data">
					<!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
					<div style="display: flex;">
						<div>
							<p>썸네일</p>
							<label for="thumbFile" style="display: block;">
								<div class="form-photo">
									<span class="icon-container"> <img id="thumbImage"
										src="/img/insert_thumb_default_img.png"
										class="img-fluid rounded-top insert--image" />
									</span> <input type="file" id="thumbFile" name="thumbFile"
										accept="image/*" style="display: none;" />
								</div>
							</label>
						</div>

						<div>
							<p>디테일사진</p>
							<label for="detailFile" style="display: block;">
								<div class="form-photo">
									<span class="icon-container" id="detailImageContainer">
										<img id="thumbImage" src="/img/insert_detail_default_img.png"
										class="img-fluid rounded-top insert--image" />
									</span> <input type="file" id="detailFile" name="customFile" multiple
										style="display: none;" />
								</div>
							</label>
						</div>
					</div>
					<!-- 지역 선택 콤보박스 -->
					<label for="region"></label><br> <select id="region"
						name="region" onchange="displaySelectedRegion()">
						<option value="1">서울</option>
						<option value="2">부산</option>
						<option value="3">인천</option>
						<option value="4">대구</option>
						<option value="5">대전</option>
						<option value="6">광주</option>
						<option value="7">경기도</option>
						<option value="8">충청도</option>
						<option value="9">전라도</option>
						<option value="10">경상도</option>
						<option value="11">강원도</option>
						<option value="12">제주도</option>
						<option value="13">기타</option>
					</select><br> <br>

					<!-- 글 정보 입력 -->
					<label for="title">글 제목:</label><br> <input type="text"
						id="title" name="title" maxlength="50" value="즐거운 여행"><br>
					<br> <label for="price">가격:</label><br> <input
						type="text" id="price" name="price" maxlength="10" value="10000"><br>
					<br> <label for="introContent">판매 소개글 내용:</label><br>
					<textarea id="introContent" name="introContent"
						style="height: 150px; resize: none;">맛집 여행 일지</textarea>
					<br> <br> <label for="content">글 내용:</label><br>
					<textarea id="content" name="content"
						style="height: 150px; resize: none;">구매 후 확인하세요</textarea>
					<br> <br>
				</form>


				<!-- Map Section Start -->
				<div class="">
					<div class="container py-5">
						<div class="col-lg-12">
							<div class="map_wrap">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

								<div id="menu_wrap" class="bg_white">
									<div class="option">
										<div>
											<form id="keyword--form">
												키워드 : <input type="text" value="" id="keyword" size="15">

												<div class="container plan--selling--button">
													<button type="button" class="custom--button"
														id="keyword--button">검색하기</button>
												</div>
											</form>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
								<div id="locationList"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- Map Section End -->

				<div class="container plan--selling--button">
					<button type="button" id="save--button">등록</button>
				</div>
			</div>

			<!-- Map Section End -->
		</div>
	</div>
</div>

<!-- footer -->

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=services"></script>

<script src="/js/testSaveProduct.js"></script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>