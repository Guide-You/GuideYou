<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/css/productcss/saveUpdate.css" rel="stylesheet" />
<link href="/css/productcss/map/updateMap.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div class="container">
		<input type="hidden" name="productId" id="product--id"
			value="${ProductInfo.id}">
		<form id="productForm" enctype="multipart/form-data">


			<!-- 지역 선택 콤보박스 -->
			<label for="region"></label><br> <select id="region"
				name="region">
				<option value="1"
					<c:if test="${ProductInfo.cityCodeId == 1}">selected</c:if>>서울</option>
				<option value="2"
					<c:if test="${ProductInfo.cityCodeId == 2}">selected</c:if>>부산</option>
				<option value="3"
					<c:if test="${ProductInfo.cityCodeId == 3}">selected</c:if>>인천</option>
				<option value="4"
					<c:if test="${ProductInfo.cityCodeId == 4}">selected</c:if>>대구</option>
				<option value="5"
					<c:if test="${ProductInfo.cityCodeId == 5}">selected</c:if>>대전</option>
				<option value="6"
					<c:if test="${ProductInfo.cityCodeId == 6}">selected</c:if>>광주</option>
				<option value="7"
					<c:if test="${ProductInfo.cityCodeId == 7}">selected</c:if>>경기도</option>
				<option value="8"
					<c:if test="${ProductInfo.cityCodeId == 8}">selected</c:if>>충청도</option>
				<option value="9"
					<c:if test="${ProductInfo.cityCodeId == 9}">selected</c:if>>전라도</option>
				<option value="10"
					<c:if test="${ProductInfo.cityCodeId == 10}">selected</c:if>>경상도</option>
				<option value="11"
					<c:if test="${ProductInfo.cityCodeId == 11}">selected</c:if>>강원도</option>
				<option value="12"
					<c:if test="${ProductInfo.cityCodeId == 12}">selected</c:if>>제주도</option>
				<option value="13"
					<c:if test="${ProductInfo.cityCodeId == 13}">selected</c:if>>기타</option>
			</select><br> <br>

			<!-- 글 정보 입력 -->
			<label for="title">글 제목:</label><br> <input type="text"
				id="title" name="title" maxlength="50" value="${ProductInfo.title}"><br>
			<br> <label for="price">가격:</label><br> <input type="text"
				id="price" name="price" maxlength="10" value="${ProductInfo.price}"><br>
			<br> <label for="introContent">판매 소개글 내용:</label><br>
			<textarea id="introContent" name="introContent"
				style="height: 150px; resize: none;">${ProductInfo.introContent}</textarea>
			<br> <br> <label for="content">글 내용:</label><br>
			<textarea id="content" name="content"
				style="height: 150px; resize: none;">${ProductInfo.content}</textarea>
			<br> <br>



			<!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
			<p>썸네일</p>
			<input type="file" id="thumbFile" name="thumbFile" accept="image/*">
			<div class="imgthumbBox" id="thumbNailBox">
				<c:if test="${!empty thumb.id}">
					<p id="imgName_${thumb.id}">${thumb.originFileName}<span
							onclick="confirmDeleteThumb(${thumb.id})" class="removeImg">X</span>
					</p>
				</c:if>
			</div>
			<p>디테일사진</p>
			<input type="file" id="fileInput" name="customFile" multiple>

			<input type="hidden" value="" id="removeImgs" name="removeImgs">


			<style>
			.imgthumbBox {
				background-color: #ccc;
				width: 100%;
				height: 50px;
				margin-top: 10px;
			}
			
			.imgNameBox {
				background-color: #ccc;
				width: 100%;
				height: 300px;
				overflow: scroll;
				margin-top: 10px;
			}
			
			.removeImg {
				color: red;
				margin-left: 20px;
			}
			</style>
			
			<div class="imgNameBox">
				<c:forEach items="${photoResult}" var="pho">
					<p id="imgName_${pho.id}">${pho.originFileName}<span
							onclick="confirmDelete(${pho.id})" class="removeImg">X</span>
					</p>
				</c:forEach>
			</div>


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
									<!-- 
										<form onsubmit="searchPlaces(); return false;">
											키워드 : <input type="text" value="" id="keyword" size="15">
											<button type="submit">검색하기</button>
										</form>
										 -->
										<form id="keyword--form">
											키워드 : <input type="text" value="" id="keyword" size="15">
											
											<div class="container plan--selling--button">
												<button type="button" id="keyword--button">검색하기</button>
											</div>
										</form>
									</div>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>
						
						<div id="locationList"></div>
					</div>
				</div>
			</div>
			<!-- Map Section End -->
			
						<!-- 등록 버튼 <input type="submit" id="modify--button" value="수정"> -->
			<div class="container plan--selling--button">
				<button type="button" id="modify--button">수정</button>
			</div>
	</div>
	<script>

</script>
</body>
</html>
<!-- footer -->
<!-- 카카오 map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=services"></script>
<script src="/js/testUpdateProduct.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
