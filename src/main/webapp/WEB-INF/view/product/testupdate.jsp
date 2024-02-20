<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/css/productcss/saveUpdate.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
<div class="container">        
    <form id="productForm" action="/update/${product.id}" method="post" enctype="multipart/form-data">
        
        
        <!-- 지역 선택 콤보박스 -->
        <label for="region"></label><br>
        <select id="region" name="region">
            <option value="1" <c:if test="${product.cityCodeId == 1}">selected</c:if>>서울</option>
            <option value="2" <c:if test="${product.cityCodeId == 2}">selected</c:if>>부산</option>
            <option value="3" <c:if test="${product.cityCodeId == 3}">selected</c:if>>인천</option>
            <option value="4" <c:if test="${product.cityCodeId == 4}">selected</c:if>>대구</option>
            <option value="5" <c:if test="${product.cityCodeId == 5}">selected</c:if>>대전</option>
            <option value="6" <c:if test="${product.cityCodeId == 6}">selected</c:if>>광주</option>
            <option value="7" <c:if test="${product.cityCodeId == 7}">selected</c:if>>경기도</option>
            <option value="8" <c:if test="${product.cityCodeId == 8}">selected</c:if>>충청도</option>
            <option value="9" <c:if test="${product.cityCodeId == 9}">selected</c:if>>전라도</option>
            <option value="10" <c:if test="${product.cityCodeId == 10}">selected</c:if>>경상도</option>
            <option value="11" <c:if test="${product.cityCodeId == 11}">selected</c:if>>강원도</option>
            <option value="12" <c:if test="${product.cityCodeId == 12}">selected</c:if>>제주도</option>
            <option value="13" <c:if test="${product.cityCodeId == 13}">selected</c:if>>기타</option>
        </select><br><br>
        
        <!-- 글 정보 입력 -->
        <label for="title">글 제목:</label><br>
        <input type="text" id="title" name="title" maxlength="50" value="${product.title}"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="${product.price}"><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px; resize: none;">${product.content}</textarea><br><br>
        
       	
        
        <!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
        <label for="fileInput" class="custom-file-input">사진 추가</label>
        <input type="file" id="fileInput" name="customFile"  multiple>
		
		<input type="hidden" value="" id="removeImgs" name="removeImgs">
		
		
		<style>
			.imgNameBox {
				background-color: #ccc;
				width: 100%;
				height: 300px;
				overflow: scroll;
			
			}
			
			.removeImg {
				color: red;
				margin-left: 20px;
			}
		</style>
		<div class="imgNameBox">
			<c:forEach items="${photoResult}" var="pho">
				<p id="imgName_${pho.id}">${pho.originFileName}<span onclick="deleteImg(${pho.id})" class="removeImg">X</span></p>
				
			</c:forEach>
		</div>
		
		
        <!-- 등록 버튼 -->
        <input type="submit" value="수정">
    </form>
</div>
<script>
$(document).ready(function() {
    $('#region').change(function() {
        var selectedCityCodeId = $(this).val(); // 선택된 지역의 cityCodeId 값을 가져옴
        $('#cityCodeId').val(selectedCityCodeId); // 숨은 필드에 cityCodeId 값을 설정
    });
});

$(document).ready(function() {
    // 파일 선택이 변경되었을 때 실행되는 함수
    $('#fileInput').change(function() {
        // 선택된 파일 목록 가져오기
        var files = $(this)[0].files;
        // 선택된 파일 이름을 보여줄 공간 선택
        var selectedFilesContainer = $('#selectedFiles');
        // 선택된 파일 이름을 초기화
        selectedFilesContainer.empty();
        // 선택된 파일이 있으면 파일 이름을 표시
        if (files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                selectedFilesContainer.append('<p>' + files[i].name + '</p>');
            }
        } else {
            selectedFilesContainer.append('<p>선택된 파일 없음</p>');
        }
    });
});

function deleteImg(id) {
	let removeImgNum = ${"#removeImgs"}.val();
	if (removeImgNum == "") {
		removeImgNum += id; 
	} else {
		removeImgNum += "," + id;
	}
	
	${"#removeImgs"}.val(removeImgNum);
	${"#imgName_" + id}.css("display","none");
}



</script>    
</body>
</html>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
