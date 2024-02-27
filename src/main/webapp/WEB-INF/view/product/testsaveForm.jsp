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
<div class="container" style="margin-top: 20%">        
    <form id="productForm" action="/save" method="post" enctype="multipart/form-data">
        
        <!-- 지역 선택 콤보박스 -->
        <label for="region"></label><br>
        <select id="region" name="region" onchange="displaySelectedRegion()">
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
        <input type="text" id="title" name="title" maxlength="50" value="즐거운 여행"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="10000"><br><br>
        
        <label for="introContent">판매 소개글 내용:</label><br>
        <textarea id="introContent" name="introContent" style="height:150px; resize: none;">맛집 여행 일지</textarea><br><br>
          
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px; resize: none;">구매 후 확인하세요</textarea><br><br>
        
        
        
        
        <!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
        <p>썸네일</p><input type="file" id="thumbFile" name="thumbFile" value="y" accept="image/*">
        <p>디테일사진</p><input type="file" id="fileInput" name="customFile"  multiple>


        <!-- 등록 버튼 -->
        <input type="submit" value="등록">
    </form>
</div>
<script>

$(document).ready(function() {
    $('#productForm').submit(function(event) {
        var errorMessage = ""; // 에러 메시지를 저장할 변수

        var titleInput = $('#title').val();
        var introContentInput = $('#intoContent').val();
        var contentInput = $('#content').val();
        var priceInput = $('#price').val();
        var thumbFile = $('#thumbFile').val();
        var customFile = $('#fileInput').val();

        // 제목이 비어있는 경우 에러 메시지에 추가
        if (titleInput.trim() === "") {
            errorMessage += "글 제목을 입력해주세요.\n";
        }
        
        // 소개 내용이 비어있는 경우 에러 메시지에 추가
        if (introContentInput.trim() === "") {
        	errorMessage += "소개글 내용을 입력해주세요.\n";
        }
        
        // 내용이 비어있는 경우 에러 메시지에 추가
        if (contentInput.trim() === "") {
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
            $('#title').focus();
            $('#intoContent').focus();          
            $('#content').focus();          
            $('#price').focus();
            
            event.preventDefault(); // 폼 제출 중지
            return false; // 이벤트 처리 중단
        } else {
            // thumbFile의 값을 추가하여 서버로 전송
            $(this).append('<input type="hidden" name="thumbFile" value="y">');
        }
    });
});
</script>    
</body>
</html>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
