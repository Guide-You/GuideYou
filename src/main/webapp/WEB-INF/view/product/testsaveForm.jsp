<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
body {
    font-family: 'Open Sans', sans-serif;
    background-color: #f8f9fa;
}

.container {
    max-width: 1200px;
    margin: 0 auto; /* 가운데 정렬을 위해 좌우 마진을 자동으로 설정 */
    padding: 0 15px; /* 좌우 여백 설정 */
}

/* 상품 목록 페이지 스타일 */
.fruite-item {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 20px;
}

.fruite-img {
    position: relative;
    overflow: hidden;
}

.fruite-img img {
    transition: transform 0.3s ease-in-out;
}

.fruite-item:hover .fruite-img img {
    transform: scale(1.05);
}

.text-secondary {
    color: #6c757d !important;
}

.text-primary {
    color: #007bff !important;
}

/* 지역 선택 콤보박스 스타일 */
#region {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 200px;
}

/* 글 정보 입력 스타일 */
label {
    font-weight: bold;
}

input[type="text"],
textarea {
    width: calc(100% - 16px); /* 폭을 최대 100%로 설정하고, 패딩을 고려하여 16px을 뺀 크기로 설정 */
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box; /* 입력란의 크기 계산 시 패딩과 테두리를 고려하여 계산 */
}

/* 사진 추가 입력 스타일 */
.custom-file-input {
    display: inline-block;
    width: auto;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
}

/* 등록 버튼 스타일 */
input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

/* 수정된 부분: 헤더 스타일 */
.topbar {
    height: 100px; /* 헤더의 높이 설정 */
}

.bg-primary {
    background-color: #007bff !important; /* 배경색 설정 */
}
</style>
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
