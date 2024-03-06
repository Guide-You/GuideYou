/* 사진 선택시 바로 보이게 하는 함수 */
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('thumbFile').addEventListener('change', function() {
		showImage.call(this, '#thumbImage');
	});

	document.getElementById('detailFile').addEventListener('change', function() {
		showMultipleImages.call(this, '#detailImageContainer');
	});

	function showImage(selector) {
		// 파일이 선택되었는지 확인
		if (this.files && this.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				// 선택된 파일의 URL을 이미지 태그의 src 속성에 설정
				var imageElement = document.querySelector(selector);
				imageElement.src = e.target.result;
			};

			// 파일을 읽어서 DataURL로 변환
			reader.readAsDataURL(this.files[0]);
		}
	}

	function showMultipleImages(selector) {
		// 파일이 선택되었는지 확인
		if (this.files && this.files.length > 0) {
			var container = document.querySelector(selector);
			container.innerHTML = ''; // Clear previous images

			for (var i = 0; i < this.files.length; i++) {
				var reader = new FileReader();

				reader.onload = (function(index) {
					return function(e) {
						// 선택된 파일의 URL을 이미지 태그의 src 속성에 설정
						var imageElement = document.createElement('img');
						imageElement.src = e.target.result;
						imageElement.className = 'img-fluid w-100 rounded-top';

						// Append image to the container
						container.appendChild(imageElement);
					};
				})(i);

				// 파일을 읽어서 DataURL로 변환
				reader.readAsDataURL(this.files[i]);
			}
		}
	}
});
document.addEventListener('DOMContentLoaded', function() {
	$(document).ready(function() {
		$('#productForm').submit(function(event) {
			var errorMessage = ""; // 에러 메시지를 저장할 변수

			var titleInput = $('#title').val();
			var introContentInput = $('#introContent').val();
			var contentInput = $('#content').val();
			var priceInput = $('#price').val();
			var thumbFile = $('#thumbFile').val();
			var customFile = $('#detailFile').val();

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

			console.log(thumbFile === "");
			console.log(customFile === "");

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
});