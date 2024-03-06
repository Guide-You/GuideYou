document.addEventListener('DOMContentLoaded', function() {
	
	
	const saveBtn = document.getElementById('save--button');
		
    // productForm을 선택하여 submit
    const productForm= document.getElementById('productForm')
	
	
    const searchInput = document.getElementById('keyword'); // 검색 입력란

	let productId='' ;
    // 클릭 이벤트 등록
    saveBtn.addEventListener('click', function(event) {
        // 폼의 유효성 검사
        if (!validateForm()) {
            event.preventDefault(); // 폼 제출 중지
            return false;
        }
        
        productForm.action = '/save';
        productForm.method = 'post';
        
        // SAVE btn click시 map 정보 insert 함수
        if( saveMarkers(event) == true){
			
        productForm.submit();
			
		}else {
			
			console.log("등록 실패!");
		} 
        
        
    });
    

    // 검색 입력란에서 Enter 키 입력 이벤트 처리
    searchInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 동작(새로고침) 방지
            searchPlaces(); // 검색 기능 호출
        }
    });
	
	
	

    // 사진 선택시 바로 보이게 하는 함수
    document.getElementById('thumbFile').addEventListener('change', function() {
        showImage.call(this, '#thumbImage');
    });

    document.getElementById('detailFile').addEventListener('change', function() {
        showMultipleImages.call(this, '#detailImageContainer');
    });

    function showImage(selector) {
        // 파일이 선택되었는지 확인
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                // 선택된 파일의 URL을 이미지 태그의 src 속성에 설정
                var imageElement = document.querySelector(selector);
                imageElement.src = e.target.result;
            };

            // 파일을 읽어서 DataURL로 변환
            reader.readAsDataURL(this.files[0]);
        }
    }

    function showMultipleImages(selector) {
        // 파일이 선택되었는지 확인
        if (this.files && this.files.length > 0) {
            var container = document.querySelector(selector);
            container.innerHTML = ''; // Clear previous images

            for (var i = 0; i < this.files.length; i++) {
                var reader = new FileReader();

                reader.onload = (function(index) {
                    return function(e) {
                        // 선택된 파일의 URL을 이미지 태그의 src 속성에 설정
                        var imageElement = document.createElement('img');
                        imageElement.src = e.target.result;
                        imageElement.className = 'img-fluid w-100 rounded-top';

                        // Append image to the container
                        container.appendChild(imageElement);
                    };
                })(i);

                // 파일을 읽어서 DataURL로 변환
                reader.readAsDataURL(this.files[i]);
            }
        }
    }

    // 제품 정보 폼 제출 시 유효성 검사
    function validateForm() {
        var titleInput = document.getElementById('title').value.trim();
        var introContentInput = document.getElementById('introContent').value.trim();
        var contentInput = document.getElementById('content').value.trim();
        var priceInput = document.getElementById('price').value.trim();
        var thumbFile = document.getElementById('thumbFile').value.trim();
        var customFile = document.getElementById('detailFile').value.trim();

        var errorMessage = ""; // 에러 메시지를 저장할 변수

        // 제목이 비어있는 경우 에러 메시지에 추가
        if (titleInput === "") {
            errorMessage += "글 제목을 입력해주세요.\n";
        }

        // 소개 내용이 비어있는 경우 에러 메시지에 추가
        if (introContentInput === "") {
            errorMessage += "소개글 내용을 입력해주세요.\n";
        }

        // 내용이 비어있는 경우 에러 메시지에 추가
        if (contentInput === "") {
            errorMessage += "글 내용을 입력해주세요.\n";
        }

        // 가격이 비어있거나 숫자가 아닌 경우 에러 메시지에 추가
        var numericExpression = /^[0-9]+$/;
        if (!numericExpression.test(priceInput)) {
            errorMessage += "잘못된 가격입니다. 숫자만 입력해주세요.\n";
        }

        // 썸네일과 디테일사진을 모두 선택하지 않은 경우 에러 메시지에 추가
        if (thumbFile === "" || customFile === "") {
            errorMessage += "썸네일과 디테일사진을 모두 선택해주세요.\n";
        }

        // 에러 메시지가 비어있지 않은 경우에만 알림 창 표시 및 이벤트 중단
        if (errorMessage !== "") {
            alert(errorMessage); // 에러 메시지 표시
            return false; // 폼 제출 중단
        }

        // 유효성 검사 통과
        return true;
    }

	    
    
    
    
    
    /* 카카오 Map */
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
				var placePosition = new kakao.maps.LatLng(places[i].y,places[i].x), 
					marker = addMarker(placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

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
			}, 
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imgOptions), 
			marker = new kakao.maps.Marker({
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
					imgOptions),
				marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
	//		checkMarkers.push(marker); // 배열에 생성된 마커를 추가합니다
		    checkMarkers.push({ // marker와 place_name을 객체로 묶어 배열에 추가
		        marker: marker,
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
		        	alert("중복 추가 입니다.");
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

		function saveMarkers(event) { //*************************************** 저장 버튼 클릭시 추가한 마커 배열 가져온다.
		
		let flag = false;
		 event.preventDefault();
		   // checkMarkers 배열의 값들을 콘솔에 출력
		    console.log(checkMarkers);
		    // 여기에 저장 로직 추가 가능
		    if (checkMarkers.length != 0) {
		        saveMarkersToServer(checkMarkers);
		        alert("저장되었습니다");
		        flag = true;
		    } else {
		        alert("마커를 추가 해주세요");
		        // 폼 제출을 막기 위해 아래 코드 추가
		       
		        flag = false;
		    }
		    
		    return flag;
		}

		// 서버에 데이터를 전송하는 함수
		function saveMarkersToServer(markers) {
			// 마커의 위치 정보만을 추출하여 새로운 배열에 저장합니다
			var markerPositions = [];
			for (var i = 0; i < markers.length; i++) {
				var position = markers[i].marker.getPosition();
				markerPositions.push({
					lat : position.getLat(),
					lng : position.getLng(),
					placeName : markers[i].placeInfo.placeName,
					roadAddressName : markers[i].placeInfo.roadAddressName,
					addressName :markers[i].placeInfo.addressName,
					phone : markers[i].placeInfo.phone
				//	placeInfo : markers[i].placeInfo // 마커와 관련된 장소 이름 가져오기
				});
			}

			// 추출한 위치 정보 배열을 JSON 형식으로 변환합니다
			var jsonData = JSON.stringify(markerPositions);

			// Ajax 요청
			$.ajax({
				type : 'POST',
				url : '/map/save?productId=' + productId,
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
		    
		    // mouseover 이벤트 추가
		    listItem.addEventListener('click', function() {
		    	var moveLatLng = new kakao.maps.LatLng(places.y, places.x);   
		    	map.panTo(moveLatLng);
				
				var iwContent = '<div style="padding:5px;">' + places.place_name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(places.y, places.x), //인포윈도우 표시 위치입니다
			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다


				infowindow.setContent(iwContent);
				infowindow.setPosition(iwPosition);
			    infowindow.open(map);
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
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}); // document addEventListener end