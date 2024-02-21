<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Profile Start -->
<div class="col-md-12 col-lg-6 col-xl-9">
	<div class="container profile--main">
		<div class="registration-form profile--form">
			<form action="/signUp" method="post">
				<div class="form-icon">
					<span><i class="icon icon-user"></i></span>
				</div>
				<div class="form-group">
					<div class="form-control item" id="username">
						${principal.name}</div>
					<input type="text" class="form-control item" id="nickname"
						placeholder="닉네임을 입력해주세요"
						value="${not empty principal.nickname ? principal.nickname : ''}">
					<div class="form-control item" id="email">${principal.email}
					</div>
					<input type="text" class="form-control item" id="phone"
						placeholder="휴대폰 번호를 입력해주세요"
						value="${not empty principal.phone && principal.phone ne 'DEFAULT_PHONENUMBER' ? principal.phone : ''}">
				</div>
				<hr>
				<h4>소개</h4>
				<div class="form-group">
					<input type="text" class="form-control item" id="profile--intro"
						placeholder="소개글">
				</div>
				<div class="social-media">
					<div class="form-group">
						<button type="submit" class="btn btn-block create--account"
							onclick="validateSignUpProfile()">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Profile End -->
</div>
</div>
</div>
<!--  Page End -->


<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
