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
    <form id="productForm" action="/save" method="post" enctype="multipart/form-data">
        <!-- 글 정보 입력 -->
        <label for="title">글 제목:</label><br>
        <input type="text" id="title" name="title" maxlength="50"><br><br>
        
        <label for="price">가격:</label><br>
        <input type="text" id="price" name="price" maxlength="10"><br><br>
        
        <label for="content">글 내용:</label><br>
        <textarea id="content" name="content" style="height:150px;"></textarea><br><br>
        
        <!-- 사진 정보 입력 -->
        <label for="customFile" class="custom-file-input">사진 추가:</label><br>
        <input type="file" id="customFile" name="customFile" multiple><br><br>
        
        <!-- 등록 버튼 -->
        <input type="submit" value="등록">
    </form>
    
    <script>
      $(document).ready(function() {
        $('#content').summernote({
          placeholder: '글을 입력하세요...',
          tabsize: 2,
          height: 100
          codeview: false
        });
        
        $('#productForm').submit(function(event) {
          event.preventDefault(); // 폼 제출 방지
          
          // Summernote에서 작성한 내용을 textarea에 저장
          var content = $('#content').summernote('code');
          $('#content').val(content);
          
          // 폼을 서버로 제출
          $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function(response) {
              console.log(response); // 서버 응답 확인
              // 여기서 필요한 추가 작업 수행
            },
            error: function(xhr, status, error) {
              console.error('Error:', error); // 오류 처리
            }
          });
        });
      });
      
      $(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass(
							"selected").html(fileName);
				});
    </script>
</body>
</html>
