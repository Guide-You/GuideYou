
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/productcss/map/updateMap.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<body>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="" id="keyword" size="15">
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

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=services"></script>
	<script src="/js/product/map/updateMap.js"></script>
</body>


<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>