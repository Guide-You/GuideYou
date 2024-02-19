<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 상세보기</title>
</head>
<body>
    <div style="float: left; width: 30%;">
        <!-- 이미지 목록 -->
        <h2>이미지 목록</h2>
        <ul>
            <c:forEach var="image" items="${imageList}">
                <li>
                    <a href="#" onclick="fetchImageDetails('${image.id}')">
                        ${image.title}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div style="float: right; width: 60%;">
        <!-- 이미지 상세 정보 -->
        <h2>이미지 상세 정보</h2>
        <div id="imageDetails">
            <!-- 이미지 상세 정보가 여기에 동적으로 업데이트됩니다. -->
        </div>
    </div>

    <script>
        // 이미지를 클릭했을 때 해당 이미지의 상세 정보를 가져오는 함수
        function fetchImageDetails(imageId) {
            // Ajax 또는 fetch API를 사용하여 서버에서 해당 이미지의 상세 정보를 가져옵니다.
            // 가져온 정보를 #imageDetails에 동적으로 업데이트합니다.
        }
    </script>
</body>
</html>