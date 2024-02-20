<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>
<body>
        
    <form id="productForm" action="/update/${product.id}" method="post" enctype="multipart/form-data">
        <input type="hidden" id="productId" name="productId" value="${product.id}">
        <!-- 지역 선택 콤보박스 -->
        <label for="region">지역 선택:</label><br>
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
        <input type="text" id="title" name="title" maxlength="50" value="${product.title}"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="${product.price}"><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px;">${product.content}</textarea><br><br>
        
        
        
        <!-- 사진 정보 입력 -->
        <label for="customFile" class="custom-file-input">사진 추가:</label><br>
        <input type="file" id="customFile" name="customFile" multiple value=""><br><br>
        
        
        <!-- 등록 버튼 -->
        <input type="submit" value="수정">
    </form>
<script>
$(document).ready(function() {
    $('#region').change(function() {
        var selectedCityCodeId = $(this).val(); // 선택된 지역의 cityCodeId 값을 가져옴
        $('#cityCodeId').val(selectedCityCodeId); // 숨은 필드에 cityCodeId 값을 설정
    });
});

</script>    
</body>
</html>
