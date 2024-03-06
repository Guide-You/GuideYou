<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/css/productcss/saveUpdate.css" rel="stylesheet" />
<!-- 지도 css -->
<link href="/css/productcss/map/insertMap.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div class="container" style="margin-top: 20%">
		<form id="productForm" action="/save" method="post"
			enctype="multipart/form-data">

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
			<br> <label for="price">가격:</label><br> <input type="text"
				id="price" name="price" maxlength="10" value="10000"><br>
			<br> <label for="introContent">판매 소개글 내용:</label><br>
			<textarea id="introContent" name="introContent"
				style="height: 150px; resize: none;">맛집 여행 일지</textarea>
			<br> <br> <label for="content">글 내용:</label><br>
			<textarea id="content" name="content"
				style="height: 150px; resize: none;">구매 후 확인하세요</textarea>
			<br> <br>




			<!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
			<p>썸네일</p>
			<label for="thumbFile" style="display: block;">
				<div class="form-photo">
					<span class="icon-container"> <img id="thumbImage"
						src="/img/main-busan.jpg" class="img-fluid w-100 rounded-top" />
					</span> <input type="file" id="thumbFile" name="thumbFile"
						accept="image/*" style="display: none;" />
				</div>
			</label>
			<p>디테일사진</p>
			<label for="detailFile" style="display: block;">
				<div class="form-photo">
					<span class="icon-container" id="detailImageContainer"><img
						id="thumbImage" src="/img/main-busan.jpg"
						class="img-fluid w-100 rounded-top" /></span> <input type="file"
						id="detailFile" name="customFile" multiple style="display: none;" />
				</div>
			</label>
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
			<button id="saveButton" onclick="saveMarkers()">저장</button>
			<div id="locationList"></div>

			<!-- 등록 버튼 -->
			<input type="submit" value="등록">
		</form>
	</div>

	<!-- 지도 section 시작 -->

	<!-- 지도 section 종료 -->
</body>
</html>
<!-- footer -->
<script src="/js/product/productSave.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=services"></script>
<script src="/js/product/map/insertMap.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
