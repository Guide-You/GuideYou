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
    <form id="productForm" action="/save" method="post" enctype="multipart/form-data">
        
        <!-- 지역 선택 콤보박스 -->
        <label for="region"></label><br>
        <select id="region" name="region">
            <option value="1">서울</option>
            <option value="2">부산</option>
            <option value="3">인천</option>
            <option value="4">대구</option>
            <option value="5">대전</option>
            <option value="6">광주</option>
            <option value="7">경기도</option>
            <option value="8">충청도</option>
            <option value="9">전라도</option>
            <option value="10">경상도</option>
            <option value="11">강원도</option>
            <option value="12">제주도</option>
            <option value="13">기타</option>
        </select><br><br>
        
        <!-- 글 정보 입력 -->
        <label for="title">글 제목:</label><br>
        <input type="text" id="title" name="title" maxlength="50" value="sss"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="1000"><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px; resize: none;">aaa</textarea><br><br>
        
        
        
        <!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
        <label for="fileInput" class="custom-file-input">사진 추가</label>
        <input type="file" id="fileInput" name="customFile"  multiple>


        <!-- 등록 버튼 -->
        <input type="submit" value="등록">
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
</script>    
</body>
</html>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
