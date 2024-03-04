<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<button onclick="hideMarkers()">마커 감추기</button>
		<button onclick="showMarkers()">마커 보이기</button>
	</p>
	<em>클릭한 위치에 마커가 표시됩니다!</em>

	<div id="locationList"></div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb"></script>
	<script src="/js/product/map/readMap.js"></script>
</body>

<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>