document.addEventListener('DOMContentLoaded', function() {

    let thumbIsRemove = false;

	let id = document.getElementById('product--id').value;
	console.log('update productid :'+id);


    function confirmDelete(id) {
        if (confirm("삭제 하시겠습니까?")) {
            deleteImg(id);
        }
    }

    function confirmDeleteThumb(id) {
        if (confirm("삭제 하시겠습니까?")) {
            thumbIsRemove = true;
            deleteImg(id);
        }
    }

    function deleteImg(id) {
        let removeImgNum = document.getElementById("removeImgs").value;
        if (removeImgNum == "") {
            removeImgNum += id;
        } else {
            removeImgNum += "," + id;
        }

        document.getElementById("removeImgs").value = removeImgNum;
        document.getElementById("imgName_" + id).style.display = "none";
    }


	let modifyBtn = document.getElementById('modify--button');
	
	modifyBtn.addEventListener('click', function(e){
		
		// 해당 폼 은 마지막에 productForm.submit();으로 폼전송 할 예정
		let productForm = document.getElementById('productForm');
	
        var errorMessage = ""; // 에러 메시지를 저장할 변수

        var titleInput = document.getElementById('title').value;
        var introContentInput = document.getElementById('introContent').value;
        var contentInput = document.getElementById('content').value;
        var priceInput = document.getElementById('price').value;
        var thumbFile = document.getElementById('thumbFile').value;

        // 제목이 비어있는 경우 에러 메시지에 추가
        if (titleInput.trim() === "") {
            errorMessage += "글 제목을 입력해주세요.\n";
        }

        // 상품 소개 글 내용이 비어있는 경우 에러 메시지에 추가
        if (introContentInput.trim() === "") {
            errorMessage += "상품 소개 글 내용을 입력해주세요.\n";
        }

        // 상품 상세 내용이 비어있는 경우 에러 메시지에 추가
        if (contentInput.trim() === "") {
            errorMessage += "상품 상세 내용을 입력해주세요.\n";
        }

        // 가격이 비어있는 경우 에러 메시지에 추가
        if (priceInput.trim() === "") {
            errorMessage += "가격을 입력해주세요.\n";
        } else {
            // 가격이 숫자가 아닌 경우 에러 메시지에 추가
            var numericExpression = /^[0-9]+$/;
            if (!numericExpression.test(priceInput)) {
                errorMessage += "잘못된 가격입니다. 숫자만 입력해주세요.\n";
            }
        }

        if (thumbIsRemove && thumbFile == "") {
            errorMessage += "썸네일을 넣어주세요. \n";
        }

        // 에러 메시지가 비어있지 않은 경우에만 알림 창 표시 및 이벤트 중단
        if (errorMessage !== "") {
            alert(errorMessage); // 에러 메시지 표시

            if (titleInput.trim() === "") {
                document.getElementById('title').focus();
            } else if (priceInput.trim() === "") {
                document.getElementById('price').focus();
            } else if (introContentInput.trim() === "") {
                document.getElementById('introContent').focus();
            } else if (contentInput.trim() === "") {
                document.getElementById('content').focus();
            }
            event.preventDefault(); // 폼 제출 중지
            return false; // 이벤트 처리 중단
        }
        
    	
    	// 여기에 modify btn click시 map 정보 수정하는 함수 넣어주기
    	saveMarkers();
    
    	productForm.action = '/edit/'+id;
    	productForm.method = 'post';
    	productForm.submit();
    }); //  $('#productForm').submit(function(event) end
    
    	////////////////////Map
        // 마커를 담을 배열입니다
		var markers = [];
		var checkMarkers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		$.ajax({
			url : '/map/readMap', // 서버의 엔드포인트 URL
			type : 'GET',
			data : {
				productId : id
			// TODO : 상품 합치면 실제 productId 입력해야함
			},
			success : function(data) {
				var bounds = new kakao.maps.LatLngBounds();
				// 데이터를 성공적으로 받아왔을 때 처리하는 로직
				console.log(data); // 받아온 데이터를 콘솔에 출력
				// 이제 받아온 데이터(data)를 이용하여 필요한 처리를 진행
				// 여기서는 예시로 마커를 추가하는 함수 호출
				for (var i = 0; i < data.length; i++) {
					addCheckMarker(new kakao.maps.LatLng(data[i].lat,
							data[i].lng), 0, data[i]);
					getListItem(i, data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].lat,
							data[i].lng));
					let places = {
						place_name : data[i].placeName,
						phone : data[i].phone,
						road_address_name : data[i].roadAddressName,
						address_name : data[i].addressName,
						y : data[i].lat,
						x : data[i].lng,
					};
					setCheckLocationList(places);
				}
				map.setBounds(bounds);
			},
			error : function(xhr, status, error) {
				// 요청이 실패했을 때 처리하는 로직
				console.error(error);
			}
		});
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		
		let keywordBtn = document.getElementById('keyword--button');
		console.log(keywordBtn.value);

		keywordBtn.addEventListener('click', function(e){
		    console.log('여기는 keywordBtn을 클릭시에 들어와요! 이게 실행되면 searchPlaces()를 호출해요!');
		    searchPlaces();
		});
		
		
		
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

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			itemStr += '<button class="addMarkerBtn">마커 추가</button>'; // ******************** 추가 버튼
			itemStr += '<button class="removeMarkerBtn">마커 제거</button>'; // ****************** 제거 버튼

			el.innerHTML = itemStr;
			el.className = 'item';

			el.querySelector('.addMarkerBtn').onclick = function() { // **************** 추가 버튼 클릭시 마커 생성 
				addMarkerOnListItemClick(places);
			};

			el.querySelector('.removeMarkerBtn').onclick = function() { // **************** 제거 버튼 클릭시 마커 생성 
				removeMarkerOnListItemClick(places);
			};

			return el;
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
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		function addCheckMarker(position, idx, placeInfo) { //***************************************************** 버튼 클릭시 추가 되는 마커 함수
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			//		checkMarkers.push(marker); // 배열에 생성된 마커를 추가합니다
			checkMarkers.push({ // marker와 place_name을 객체로 묶어 배열에 추가
				marker : marker,
				placeInfo : placeInfo
			});

			return checkMarkers;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		function addMarkerOnListItemClick(places) { //*************************************** 콜백으로 받아온 데이터로 마커 그리기 메소드
			var placePosition = new kakao.maps.LatLng(places.y, places.x);
			var placeInfo = {
				placeName : places.place_name,
				roadAddressName : places.road_address_name,
				addressName : places.address_name,
				phone : places.phone
			}
			
			let duplicate = false;
			
		    // 중복 체크를 위해 이미 추가된 마커의 위치 정보와 비교
		    for (var i = 0; i < checkMarkers.length; i++) {
		        var existingMarker = checkMarkers[i].marker;
		        var existingPosition = existingMarker.getPosition();

		        // 좌표 값을 반올림하지 않고 정확한 비교
		        if (isSamePosition(existingPosition, placePosition)) {
		        	console.log("중복 추가 입니다.");
		        	duplicate = true;
		        }
		    }
			
		    if(duplicate == false) {
			setCheckLocationList(places)	// [마커 추가] 하면 아래에 생기는 장소 리스트
			var marker = addCheckMarker(placePosition, 0, placeInfo); // 필요에 따라 인덱스를 수정할 수 있습니다
		    }
		}

		function removeMarkerOnListItemClick(places) { //*************************************** 마커 제거 메소드
			// 해당 위치의 마커를 찾아서 제거
			for (var i = 0; i < checkMarkers.length; i++) {
				var marker = checkMarkers[i].marker;
				var markerPosition = marker.getPosition();
				var targetPosition = new kakao.maps.LatLng(places.y, places.x);

				// 좌표 값을 반올림하지 않고 정확한 비교
				if (isSamePosition(markerPosition, targetPosition)) {
					marker.setMap(null); // 지도에서 제거
					checkMarkers.splice(i, 1); // 배열에서 제거
					locationList.removeChild(locationList.children[i]); // [마커 제거] 하면 아래에 장소 리스트 삭제
					break;
				}
			}
		}

		// 두 좌표가 정확하게 같은지 확인하는 함수
		function isSamePosition(pos1, pos2) { //*************************************** targetPosition의 좌표가 소수 13자리에서 반올림 되어서 값이 넘어오고 있었다.
			var tolerance = 1e-7; // 허용 오차 범위

			return Math.abs(pos1.getLat() - pos2.getLat()) < tolerance
					&& Math.abs(pos1.getLng() - pos2.getLng()) < tolerance;
		}

		function saveMarkers() { //*************************************** 저장 버튼 클릭시 추가한 마커 배열 가져온다.
			// checkMarkers 배열의 값들을 콘솔에 출력
			console.log(checkMarkers);
			// 여기에 저장 로직 추가 가능
			if (checkMarkers.length != 0) {
				saveMarkersToServer(checkMarkers);
				alert("저장되었습니다");
			} else {
				alert("마커를 추가 해주세요");
			}
		}

		// 서버에 데이터를 전송하는 함수
		function saveMarkersToServer(markers) {
			// 마커의 위치 정보만을 추출하여 새로운 배열에 저장합니다
			var markerPositions = [];
			for (var i = 0; i < markers.length; i++) {
				var position = markers[i].marker.getPosition();
				markerPositions.push({
					id :  markers[i].placeInfo.id,
					lat : position.getLat(),
					lng : position.getLng(),
					placeName : markers[i].placeInfo.placeName,
					roadAddressName : markers[i].placeInfo.roadAddressName,
					addressName : markers[i].placeInfo.addressName,
					phone : markers[i].placeInfo.phone
				//	placeInfo : markers[i].placeInfo // 마커와 관련된 장소 이름 가져오기
				});
			}

			// 추출한 위치 정보 배열을 JSON 형식으로 변환합니다
			var jsonData = JSON.stringify(markerPositions);

			// Ajax 요청
			$.ajax({
				type : 'POST',
				url : '/map/update?productId=' + id,
				contentType : 'application/json;charset=UTF-8',
				data : jsonData,
				success : function(response) {
					console.log(response);
				},
				error : function(error) {
					console.error('Error saving markers:', error);
				}
			});
		}
		
		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
		    removable : true
		});
		
		/*
		function setCheckLocationList(places) {
			var listItem = document.createElement('div');
			
			
			listItem.innerHTML = 
			'가게명: ' + places.place_name
			+ "<br>"
			+ '전화번호: ' +  places.phone
			+ "<br>"
			+ '도로명주소: ' +  places.road_address_name
			+ "<br>"
			+ '지번주소: ' +  places.address_name
			+ "<br>"
			+ 'lat: ' +  + places.y
			+ "<br>"
			+ 'lng: ' +  + places.x
			+ "<button class='locationRemoveBtn' onclick='removeListItem(this.parentNode, "
		    + JSON.stringify(places) + ")'>삭제</button>"  // places 객체를 문자열로 전달
		    + "<hr>";
		    
		    /*
			listItem.innerHTML = 
			    '가게명: ' + places.place_name +
			    "<br>" +
			    '전화번호: ' + places.phone +
			    "<br>" +
			    '도로명주소: ' + places.road_address_name +
			    "<br>" +
			    '지번주소: ' + places.address_name +
			    "<br>" +
			    'lat: ' + places.y +
			    "<br>" +
			    'lng: ' + places.x +
			    "<button type='button' class='locationRemoveBtn' id='remove--list'>삭제</button>" +
			    "<hr>";
			    
			    let removeButton = document.getElementById('remove--list');

				removeButton.addEventListener('click', function(e) {
				    let listItem = this.parentNode;
				    let places = JSON.stringify(places);
				    removeListItem(listItem, places);
				});
		   */
		  /*
		    // mouseover 이벤트 추가
		    listItem.addEventListener('click', function(event) {
		    	 var target = event.target;

		         // 삭제 버튼이 아닌 경우에만 infowindow 열기
		         if (!target.classList.contains('locationRemoveBtn')) {
		        	 
		        	 console.log("삭제 버튼 클릭은 안됨");
		    	
				     var moveLatLng = new kakao.maps.LatLng(places.y, places.x);   
				     map.panTo(moveLatLng);
						
					 var iwContent = '<div style="padding:5px;">' + places.place_name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					   iwPosition = new kakao.maps.LatLng(places.y, places.x), //인포윈도우 표시 위치입니다
					   iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
					 infowindow.setContent(iwContent);
					 infowindow.setPosition(iwPosition);
					 infowindow.open(map);
		         }
		    });
			locationList.appendChild(listItem);
		}
		*/
		function setCheckLocationList(places) {
    var listItem = document.createElement('div');

    listItem.innerHTML = 
    '가게명: ' + places.place_name +
    "<br>" +
    '전화번호: ' +  places.phone +
    "<br>" +
    '도로명주소: ' +  places.road_address_name +
    "<br>" +
    '지번주소: ' +  places.address_name +
    "<br>" +
    'lat: ' +  + places.y +
    "<br>" +
    'lng: ' +  + places.x +
    "<button class='locationRemoveBtn'>삭제</button>"  // onclick 속성 제거
    + "<hr>";

    listItem.querySelector('.locationRemoveBtn').addEventListener('click', function() {
        removeListItem(listItem, places);
    });

    listItem.addEventListener('click', function(event) {
        var target = event.target;

        if (!target.classList.contains('locationRemoveBtn')) {
            var moveLatLng = new kakao.maps.LatLng(places.y, places.x);   
            map.panTo(moveLatLng);

            var iwContent = '<div style="padding:5px;">' + places.place_name + '</div>',
                iwPosition = new kakao.maps.LatLng(places.y, places.x);

            infowindow.setContent(iwContent);
            infowindow.setPosition(iwPosition);
            infowindow.open(map);
        }
    });
    locationList.appendChild(listItem);
}
 		// 항목 제거하는 함수
		function removeListItem(item, places) {
			for (var i = 0; i < checkMarkers.length; i++) {
				var marker = checkMarkers[i].marker;
				var markerPosition = marker.getPosition();
				var targetPosition = new kakao.maps.LatLng(places.y, places.x);

				// 좌표 값을 반올림하지 않고 정확한 비교
				if (isSamePosition(markerPosition, targetPosition)) {
					marker.setMap(null); // 지도에서 제거
					checkMarkers.splice(i, 1); // 배열에서 제거
					locationList.removeChild(locationList.children[i]); // [마커 제거] 하면 아래에 장소 리스트 삭제
					break;
				}
			}
			infowindow.close();
		}
});