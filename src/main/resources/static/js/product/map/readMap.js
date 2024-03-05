var purchased = document.getElementById('paidYn');  

console.log("구매여부 : " + purchased);
let locationInfoList = "";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 3
		// 지도의 확대 레벨
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

var productId = document.getElementById("product--id").value;

$.ajax({
	url: '/map/readMap', // 서버의 엔드포인트 URL
	type: 'GET',
	data: {
		productId: productId
	},
	// 데이터를 성공적으로 받아왔을 때 처리하는 로직
	success: function(data) {
		var bounds = new kakao.maps.LatLngBounds();
		console.log(data); // 받아온 데이터를 콘솔에 출력
		var locationList = document.getElementById('locationList'); // locationList 세팅
		// 이제 받아온 데이터(data)를 이용하여 필요한 처리를 진행
		// 마커를 추가하는 함수 호출
		for (var i = 0; i < data.length; i++) {
			addMarker(new kakao.maps.LatLng(data[i].lat, data[i].lng),
				i, data[i]);
			bounds.extend(new kakao.maps.LatLng(data[i].lat,
				data[i].lng));

			// <div id = locationList> 목록 추가 로직
			if (purchased == true) {
				setCheckLocationList(data, i);
			} else {
				hideMarkers();
			}
		}
		map.setBounds(bounds);
	},
	error: function(xhr, status, error) {
		// 요청이 실패했을 때 처리하는 로직
		console.error(error);
	}
});

// 마커 하나를 지도위에 표시합니다 
// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position, idx, placeInfo) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset: new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imgOptions),
		// 마커를 생성합니다
		marker = new kakao.maps.Marker({
			position: position, // 마커의 위치
			image: markerImage
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

// "마커 보이기" 버튼 클릭시 마커를 지도에 표시하는 함수
function showMarkers() {
	setMarkers(map);
}

// "마커 감추기" 버튼을 클릭시 마커를 지도에사 삭제하는 함수
function hideMarkers() {
	setMarkers(null);
}

var infowindow = new kakao.maps.InfoWindow({
	removable: true
});

// 가게 정보 리스트 세팅하는 함수
function setCheckLocationList(data, index) {
	var listItem = document.createElement('div');
	listItem.innerHTML =
		'가게명: ' + data[index].placeName
		+ "<br>"
		+ '전화번호: ' + data[index].phone
		+ "<br>"
		+ '도로명주소: ' + data[index].roadAddressName
		+ "<br>"
		+ '지번주소: ' + data[index].addressName
		+ "<br>"
		+ 'lat: ' + + data[index].lat
		+ "<br>"
		+ 'lng: ' + + data[index].lng
		+ "<hr>";

	// mouseover 이벤트 추가
	listItem.addEventListener('click', function(event) {
		console.log("삭제 버튼 클릭은 안됨");

		var moveLatLng = new kakao.maps.LatLng(data[index].lat, data[index].lng);
		map.panTo(moveLatLng);

		var iwContent = '<div style="padding:5px;">' + data[index].placeName + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(data[index].lat, data[index].lng), //인포윈도우 표시 위치입니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		infowindow.setContent(iwContent);
		infowindow.setPosition(iwPosition);
		infowindow.open(map);
	});

	locationList.appendChild(listItem);
}