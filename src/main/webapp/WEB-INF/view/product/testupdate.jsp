<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/css/productcss/saveUpdate.css" rel="stylesheet" />
</head>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
<div class="container">        
    <form id="productForm" action="/edit/${ProductInfo.id}" method="post" enctype="multipart/form-data">
        
        
        <!-- 지역 선택 콤보박스 -->
        <label for="region"></label><br>
        <select id="region" name="region">
            <option value="1" <c:if test="${ProductInfo.cityCodeId == 1}">selected</c:if>>서울</option>
            <option value="2" <c:if test="${ProductInfo.cityCodeId == 2}">selected</c:if>>부산</option>
            <option value="3" <c:if test="${ProductInfo.cityCodeId == 3}">selected</c:if>>인천</option>
            <option value="4" <c:if test="${ProductInfo.cityCodeId == 4}">selected</c:if>>대구</option>
            <option value="5" <c:if test="${ProductInfo.cityCodeId == 5}">selected</c:if>>대전</option>
            <option value="6" <c:if test="${ProductInfo.cityCodeId == 6}">selected</c:if>>광주</option>
            <option value="7" <c:if test="${ProductInfo.cityCodeId == 7}">selected</c:if>>경기도</option>
            <option value="8" <c:if test="${ProductInfo.cityCodeId == 8}">selected</c:if>>충청도</option>
            <option value="9" <c:if test="${ProductInfo.cityCodeId == 9}">selected</c:if>>전라도</option>
            <option value="10" <c:if test="${ProductInfo.cityCodeId == 10}">selected</c:if>>경상도</option>
            <option value="11" <c:if test="${ProductInfo.cityCodeId == 11}">selected</c:if>>강원도</option>
            <option value="12" <c:if test="${ProductInfo.cityCodeId == 12}">selected</c:if>>제주도</option>
            <option value="13" <c:if test="${ProductInfo.cityCodeId == 13}">selected</c:if>>기타</option>
        </select><br><br>
        
        <!-- 글 정보 입력 -->
        <label for="title">글 제목:</label><br>
        <input type="text" id="title" name="title" maxlength="50" value="${ProductInfo.title}"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="${ProductInfo.price}"><br><br>
        
        <label for="introContent">판매 소개글 내용:</label><br>
        <textarea id="introContent" name="introContent" style="height:150px; resize: none;">${ProductInfo.introContent}</textarea><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px; resize: none;">${ProductInfo.content}</textarea><br><br>
        
       	
        
        <!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
		<p>썸네일</p><input type="file" id="thumbFile" name="customFile" value="y" accept="image/*">
		<div class="imgthumbBox">
<%-- 			<p id="imgName_${ProductInfo.id}">${ProductInfo.originFileName}<span onclick="confirmDelete(${photoResult.id})" class="removeImg">X</span></p> --%>
		</div>
        <p>디테일사진</p><input type="file" id="fileInput" name="customFile"  multiple>
		
		<input type="hidden" value="" id="removeImgs" name="removeImgs">
		
		
		<style>
			.imgthumbBox {
				background-color: #ccc;
				width: 100%;
				height: 50px;
				margin-top: 10px;
			}
			
			.imgNameBox {
				background-color: #ccc;
				width: 100%;
				height: 300px;
				overflow: scroll;
				margin-top: 10px;
			
			}
			
			.removeImg {
				color: red;
				margin-left: 20px;
			}
		</style>
		<div class="imgNameBox">
			<c:forEach items="${photoResult}" var="pho">
				<p id="imgName_${pho.id}">${pho.originFileName}<span onclick="confirmDelete(${pho.id})" class="removeImg">X</span></p>
			</c:forEach>
		</div>
		
		
        <!-- 등록 버튼 -->
        <input type="submit" value="수정">
    </form>
</div>
<script>

function confirmDelete(id) {
    if (confirm("삭제 하시겠습니까?")) {
        deleteImg(id);
    }
}


function deleteImg(id) {
	let removeImgNum = $("#removeImgs").val();
	if (removeImgNum == "") {
		removeImgNum += id; 
	} else {
		removeImgNum += "," + id;
	}
	
	$("#removeImgs").val(removeImgNum);
	$("#imgName_" + id).css("display","none");
}

$(document).ready(function() {
    $('#productForm').submit(function(event) {
        var errorMessage = ""; // 에러 메시지를 저장할 변수

        var titleInput = $('#title').val();
        var introContentInput = $('#introContent').val();
        var contentInput = $('#content').val();
        var priceInput = $('#price').val();
        var thumbFile = $('#thumbFile').val();
        var customFile = $('#fileInput').val();

        // 제목이 비어있는 경우 에러 메시지에 추가
        if (titleInput.trim() === "") {
            errorMessage += "글 제목을 입력해주세요.\n";
        } 
        
     	// 내용이 비어있는 경우 에러 메시지에 추가
        if (introContentInput.trim() === "") {
        	errorMessage += "상품 소개 글 내용을 입력해주세요.\n";
        }
        
        
        // 내용이 비어있는 경우 에러 메시지에 추가
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

        // 에러 메시지가 비어있지 않은 경우에만 알림 창 표시 및 이벤트 중단
        if (errorMessage !== "") {
            alert(errorMessage); // 에러 메시지 표시
            $('#price').focus();
            $('#introContent').focus();
            $('#title').focus();
            $('#content').focus();
            
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
