<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.map_wrap {
	width: 100%;
	position: relative;
}

.modes {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 1;
}

.getdata {
	position: absolute;
	top: 370px;
	left: 10px;
	z-index: 1;
}

#drawingMap, #map {
	width: 100%;
	height: 350px;
}

#map {
	margin-top: 10px;
}
</style>
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div class="map_wrap">
		<div id="drawingMap"></div>
		<div id="map"></div>
		<p class="modes">
			<button onclick="selectOverlay('MARKER')">마커</button>
		</p>
		<p class="getdata">
			<button onclick="getDataFromDrawingMap()">가져오기</button>
		</p>

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

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=drawing,services"></script>
	<script>
		var searchData;

		// Drawing Manager로 도형을 그릴 지도 div
		var drawingMapContainer = document.getElementById('drawingMap'), drawingMap = {
			center : new kakao.maps.LatLng(37.535984871501746,
					126.99537241284942), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap);

		var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
			map : drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			drawingMode : [ // Drawing Manager로 제공할 그리기 요소 모드입니다
			kakao.maps.drawing.OverlayType.MARKER ],
			// 사용자에게 제공할 그리기 가이드 툴팁입니다
			// 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
			guideTooltip : [ 'draw', 'drag', 'edit' ],
			markerOptions : { // 마커 옵션입니다 
				draggable : true, // 마커를 그리고 나서 드래그 가능하게 합니다 
				removable : true
			// 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
			},
		};

		// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
		var manager = new kakao.maps.drawing.DrawingManager(options);

		// 버튼 클릭 시 호출되는 핸들러 입니다
		function selectOverlay(type) {
			// 그리기 중이면 그리기를 취소합니다
			manager.cancel();

			// 클릭한 그리기 요소 타입을 선택합니다
			manager.select(kakao.maps.drawing.OverlayType[type]);
		}

		// Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div
		var mapContainer = document.getElementById('map'), mapOptions = {
			center : new kakao.maps.LatLng(37.535984871501746,
					126.99537241284942), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOptions), overlays = []; // 지도에 그려진 도형을 담을 배열

		// 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
		// Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
		function getDataFromDrawingMap() {
			// Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
			var data = manager.getData();

			// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
			removeOverlays();

			// 지도에 가져온 데이터로 도형들을 그립니다
			drawMarker(data[kakao.maps.drawing.OverlayType.MARKER]);

			console.log("최장호 : " + searchData);
			customDrawMarker(searchData);
		}

		// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
		function removeOverlays() {
			var len = overlays.length, i = 0;

			for (; i < len; i++) {
				overlays[i].setMap(null);
			}

			overlays = [];
		}

		// Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
		function drawMarker(markers) {
			var len = markers.length, i = 0;

			for (; i < len; i++) {
				var marker = new kakao.maps.Marker(
						{
							map : map,
							position : new kakao.maps.LatLng(markers[i].y,
									markers[i].x),
							zIndex : markers[i].zIndex
						});

				overlays.push(marker);
			}
		}

		// Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
		function customDrawMarker(markers) {
			var len = markers.length, i = 0;

			for (; i < len; i++) {
				var marker = new kakao.maps.Marker(
						{
							map : map,
							position : new kakao.maps.LatLng(markers[i].y,
									markers[i].x),
							zIndex : markers[i].zIndex
						});

				overlays.push(marker);
			}
		}

		// 마커를 담을 배열입니다
		var markers = [];

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				searchData = data;
				console.log("최장호2  = " + searchData);
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				//	displayPlaces(data);

				// 페이지 번호를 표출합니다
				//	displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
			
			   for ( var i=0; i<data.length; i++ ) {
					console.log("이거 타지?" + i);
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(data[i].y, data[i].x),
			            marker = addMarker(placePosition, i);
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			    }
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, 
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(drawingMap); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}
		
		
	</script>
</body>


<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>