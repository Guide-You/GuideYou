<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .card {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: 200px;
            display: inline-block;
            vertical-align: top;
            position: relative;
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .favorite-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            outline: none;
            font-size: 20px;
            color: gray;
        }
        .favorite-btn:hover {
            color: red;
        }
    </style>
</head>
<body>
    <header>
        <!-- 검색 창 -->
        <form action="search.jsp" method="get">
            <input type="text" name="query" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
        </form>
    </header>
    
    <main>
        <!-- 메인 이미지 영역 -->
        <div class="main-image">
            <!-- 이미지 표시 -->
            <img src="main_image.jpg" alt="Main Image">
        </div>

        <!-- 카드 레이아웃 -->
        <div class="card-layout">
            <!-- 이미지와 이미지 설명을 보여줄 카드 -->
            <div class="card">
                <!-- 이미지 -->
                <img src="image1.jpg" alt="Image 1">
                <!-- 이미지 설명 -->
                <p>이미지 설명 1</p>
                <!-- 찜 버튼 -->
                <button class="favorite-btn">&#9825;</button>
            </div>
            <!-- 다른 이미지 카드들 -->
        </div>
    </main>

    <!-- 필요한 JavaScript 파일 링크 추가 -->
</body>
</html>