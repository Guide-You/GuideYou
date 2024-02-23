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
        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;" id="cityCodeId"></div>
        
        <!-- 글 정보 입력 -->
        <label for="title">글 제목:</label><br>
        <input type="text" id="title" name="title" maxlength="50"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10" value="1000"><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px; resize: none;"></textarea><br><br>
        
        
        
        <!-- 파일 선택 input 대신 label을 사용하여 버튼으로 보여줌 -->
        <label for="customFile" class="custom-file-input">사진 추가</label>
        <input type="file" id="customFile" name="customFile"  multiple>
		
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
				<p id="imgName_${pho.id}">${pho.originFileName}<span onclick="deleteImg(${pho.id})" class="removeImg">O</span></p>
				
				
			</c:forEach>
		</div>
		
		
		
		
		

        <!-- 등록 버튼 -->
        <input type="submit" value="등록">
    </form>
</div>
<script>
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


    
    function displaySelectedRegion() {
        var regionSelect = document.getElementById("region");
        var selectedText = regionSelect.options[regionSelect.selectedIndex].text;
        var cityCodeIdElement = document.getElementById("cityCodeId");
        cityCodeIdElement.textContent = selectedText;
    }
    
    
});

$(document).ready(function() {
    // 파일이 선택되면 실행되는 이벤트 핸들러
    $('#customFile').change(function() {
        // 선택된 파일 목록을 가져옴
        var files = $(this)[0].files; 
        
        // 선택된 파일 목록을 순회하며 파일 이름을 표시
        for (var i = 0; i < files.length; i++) {
            // 새로운 파일 이름을 추가하는 HTML 코드 생성
            var fileName = files[i].name;
            var newFileNameElement = fileName;
            
            // 새로운 파일 이름을 imgNameBox에 추가
            $('.imgNameBox').append(newFileNameElement);
        }
    });
});




</script>    
</body>
</html>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
