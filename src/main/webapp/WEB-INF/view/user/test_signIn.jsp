<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
	<div class="container-fluid contact py-5">
		<div class="container py-5">
			<div class="p-5 bg-light rounded">
				<div class="row g-4">
					<!-- Payment Start -->
					<div class="container">
						<div class="row">
							<div class="table-responsive">
								<div>
									<!--  ************************여기서 부터 작성************************  -->
									<div class="loginAll">
										<a href="/login/kakao" class="loginBtn"> 
										<img src="/img/kakao/kakao-login-small.png" alt="Kakao"> 
										  카카오 로그인
										</a> 
										<a href="/login/google" class="loginBtn"> 
										<img src="/img/google/google-login-small.png" alt="Google">
										  구글 로그인
										</a> 
										<a href="/login/naver" class="loginBtn"> 
										<img src="/img/naver/naver-login-small.png" alt="Naver"> 
										  네이버 로그인
										</a>
									</div>
									<!-- ************************여기까지 작성************************  -->
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!--  payment End -->
</body>




<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
