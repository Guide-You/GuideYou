<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<input type="hidden" id="locationInfoList" value="${locationInfoList}" />
	<p>
		<button onclick="hideMarkers()">마커 감추기</button>
		<button onclick="showMarkers()">마커 보이기</button>
	</p>
	<em>클릭한 위치에 마커가 표시됩니다!</em>

	<ul id="placesList">
	</ul>
	<div id="pagination"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb"></script>
	<script>
		let locationInfoList = "";
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];

		$.ajax({
			url : '/map/readMap', // 서버의 엔드포인트 URL
			type : 'GET',
			success : function(data) {
				// 데이터를 성공적으로 받아왔을 때 처리하는 로직
				console.log(data); // 받아온 데이터를 콘솔에 출력
				// 이제 받아온 데이터(data)를 이용하여 필요한 처리를 진행
				// 여기서는 예시로 마커를 추가하는 함수 호출
				for (var i = 0; i < data.length; i++) {
					addMarker(new kakao.maps.LatLng(data[i].lat, data[i].lng));
					getListItem(i, data[i]);
				}
			},
			error : function(xhr, status, error) {
				// 요청이 실패했을 때 처리하는 로직
				console.error(error);
			}
		});

		// 마커 하나를 지도위에 표시합니다 
		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : position
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 생성된 마커를 배열에 추가합니다
			markers.push(marker);
		}

		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}

		// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
			setMarkers(map)
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
			setMarkers(null);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.placeName + '</h5>';

			if (places.roadAddressName) {
				itemStr += '    <span>' + places.roadAddressName + '</span>'
						+ '   <span class="jibun gray">' + places.addressName
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.addressName + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}
	</script>
</body>

<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>