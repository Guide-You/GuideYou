<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>

<!-- Profile Start -->
<input type="hidden" name="userId" id="user--id" value="${principal.id}">
<div class="col-md-12 col-lg-6 col-xl-9">
	<div class="container profile--main">
		<div class="registration-form profile--form">
			<form action="/member/profile" method="post" name="signUpForm"
				enctype="multipart/form-data">
				<label for="fileInput" style="display: block;">
					<div class="form-icon">
						<span class="icon-container"> <i class="icon icon-user"></i>
							<c:choose>
								<c:when test="${not empty principalPhoto.id}">
									<img src="/images/upload/${principalPhoto.uploadFileName}"
									class="form-icon" />
								</c:when>
								<c:otherwise>
									<img src="${principalPhoto.profilePhoto}${principalPhoto.uploadFileName}"
									class="form-icon" />
								</c:otherwise>
							</c:choose>
						</span> <input type="file" id="fileInput" name="file"
							style="display: none;" />
					</div>
				</label>
				<div class="form-group">
					<div class="form-control item" id="username">
						${principal.name}</div>
					<input type="text" class="form-control item" name="nickname"
						id="nickname" placeholder="닉네임을 입력해주세요"
						value="${not empty principal.nickname && principal.nickname ne 'DEFAULT_NICKNAME' ? principal.nickname : ''}">
					<div class="form-control item" id="email">${principal.email}
					</div>
					<input type="text" class="form-control item" name="phone"
						id="phone" placeholder="휴대폰 번호를 입력해주세요"
						value="${not empty principal.phone && principal.phone ne 'DEFAULT_PHONENUMBER' ? principal.phone : ''}">
				</div>
				<hr>
				<h4>소개</h4>
				<div class="form-group">
					<input type="text" class="form-control item" id="profile--intro"
						placeholder="소개글">
				</div>
			</form>
			<div class="social-media">
				<div class="form-group">
					<button type="submit" class="btn btn-block create--account"
						id="signUpBtn">수 정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Profile End -->
</div>
</div>
</div>
<!--  Page End -->
<script>
	document.getElementById('fileInput').addEventListener('change', function() {
		showImage.call(this);
	});

	function showImage() {
		// 파일이 선택되었는지 확인
		if (this.files && this.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				// 선택된 파일의 URL을 이미지 태그의 src 속성에 설정
				var imageElement = document.querySelector('.form-icon img');
				imageElement.src = e.target.result;
			};

			// 파일을 읽어서 DataURL로 변환
			reader.readAsDataURL(this.files[0]);
		}
	}
</script>

<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
