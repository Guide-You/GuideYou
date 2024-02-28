<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Drawing Library에서 데이터 얻기</title>
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

        #drawingMap,
        #map {
            width: 100%;
            height: 350px;
        }

        #map {
            margin-top: 10px;
        }


        /* 검색 css*/

        .map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }

        .map_wrap a,
        .map_wrap a:hover,
        .map_wrap a:active {
            color: #000;
            text-decoration: none;
        }

        /*.map_wrap {position:relative;width:100%;height:500px;}*/
        #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.7);
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
        }

        .bg_white {
            background: #fff;
        }

        #menu_wrap hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 2px solid #5F5F5F;
            margin: 3px 0;
        }

        #menu_wrap .option {
            text-align: center;
        }

        #menu_wrap .option p {
            margin: 10px 0;
        }

        #menu_wrap .option button {
            margin-left: 5px;
        }

        #placesList li {
            list-style: none;
        }

        #placesList .item {
            position: relative;
            border-bottom: 1px solid #888;
            overflow: hidden;
            cursor: pointer;
            min-height: 65px;
        }

        #placesList .item span {
            display: block;
            margin-top: 4px;
        }

        #placesList .item h5,
        #placesList .item .info {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        #placesList .item .info {
            padding: 10px 0 10px 55px;
        }

        #placesList .info .gray {
            color: #8a8a8a;
        }

        #placesList .info .jibun {
            padding-left: 26px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
        }

        #placesList .info .tel {
            color: #009900;
        }

        #placesList .item .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
        }

        #placesList .item .marker_1 {
            background-position: 0 -10px;
        }

        #placesList .item .marker_2 {
            background-position: 0 -56px;
        }

        #placesList .item .marker_3 {
            background-position: 0 -102px
        }

        #placesList .item .marker_4 {
            background-position: 0 -148px;
        }

        #placesList .item .marker_5 {
            background-position: 0 -194px;
        }

        #placesList .item .marker_6 {
            background-position: 0 -240px;
        }

        #placesList .item .marker_7 {
            background-position: 0 -286px;
        }

        #placesList .item .marker_8 {
            background-position: 0 -332px;
        }

        #placesList .item .marker_9 {
            background-position: 0 -378px;
        }

        #placesList .item .marker_10 {
            background-position: 0 -423px;
        }

        #placesList .item .marker_11 {
            background-position: 0 -470px;
        }

        #placesList .item .marker_12 {
            background-position: 0 -516px;
        }

        #placesList .item .marker_13 {
            background-position: 0 -562px;
        }

        #placesList .item .marker_14 {
            background-position: 0 -608px;
        }

        #placesList .item .marker_15 {
            background-position: 0 -654px;
        }

        #pagination {
            margin: 10px auto;
            text-align: center;
        }

        #pagination a {
            display: inline-block;
            margin-right: 10px;
        }

        #pagination .on {
            font-weight: bold;
            cursor: default;
            color: #777;
        }
    </style>
</head>

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
    </div>

    <body>
        <div id="map" style="width:100%;height:350px;"></div>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ef018e0a6a5030e54ff1e2da58cdceb&libraries=services"></script>
        <script>


            // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
            var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });


            // Drawing Manager로 도형을 그릴 지도 div -- 변경
            var drawingMapContainer = document.getElementById('drawingMap'),
                drawingMap = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다 -- 변경
            var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap);

            // 마커 생성 -- 추가
            var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
                map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
                drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
                    kakao.maps.drawing.OverlayType.MARKER,
                ],
                // 사용자에게 제공할 그리기 가이드 툴팁입니다
                // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
                guideTooltip: ['draw', 'drag', 'edit'],
                markerOptions: { // 마커 옵션입니다 
                    draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
                    removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
                },
            };


            // 위에 작성한 옵션으로 Drawing Manager를 생성합니다 -- 추가
            var manager = new kakao.maps.drawing.DrawingManager(options);


            // 버튼 클릭 시 호출되는 핸들러 입니다 -- 추가
            function selectOverlay(type) {
                // 그리기 중이면 그리기를 취소합니다 --추가
                manager.cancel();

                // 클릭한 그리기 요소 타입을 선택합니다 -- 추가
                manager.select(kakao.maps.drawing.OverlayType[type]);
            }







            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();


            // 키워드로 장소를 검색합니다
            ps.keywordSearch('이태원 맛집', placesSearchCB);


            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    drawingMap.setBounds(bounds);
                }
            }

            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(place) {

                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: drawingMap,
                    position: new kakao.maps.LatLng(place.y, place.x)
                });

                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(drawingMap, marker);
                });
            }


            // Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div
            var mapContainer = document.getElementById('map'),
                mapOptions = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도 div와 지도 옵션으로 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOptions),
                overlays = []; // 지도에 그려진 도형을 담을 배열

            // 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
            // Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
            function getDataFromDrawingMap() {
                // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
                var data = manager.getData();

                // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
                removeOverlays();

                // 지도에 가져온 데이터로 도형들을 그립니다
                drawMarker(data[kakao.maps.drawing.OverlayType.MARKER]);
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
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(markers[i].y, markers[i].x),
                        zIndex: markers[i].zIndex
                    });

                    overlays.push(marker);
                }
            }
        </script>
    </body>

</html>