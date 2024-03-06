<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- mypage Start -->
<div class="container">
	<div class="row g-5">
		<div class="col-md-12 col-lg-6 col-xl-3">
			<!-- aside Start -->
			<div class="d-flex flex-column flex-shrink-0 p-3 aside--template "
				style="width: 280px;">
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span
					class="fs-4 mypage--title">My Page</span>
				</a>

				<div class="dropdown ">
					<a href="#"
						class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle profile--myinfo"
						id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
						<c:choose>
							<c:when test="${not empty principalPhoto.id}">
								<img src="/images/upload/${principalPhoto.uploadFileName}"
									alt="" width="32" height="32" class="rounded-circle me-2">
							</c:when>
							<c:otherwise>
								<img src="${principalPhoto.profilePhoto}${principalPhoto.uploadFileName}" alt="" width="32" height="32"
									class="rounded-circle me-2">
							</c:otherwise>
						</c:choose> <strong>${principal.nickname}님</strong>
					</a>
					<ul class="dropdown-menu text-small shadow"
						aria-labelledby="dropdownUser2">
						<li><a class="dropdown-item profile--logout"
							href="/member/logout">로그아웃</a></li>
					</ul>
				</div>

				<hr>
				<ul class="nav nav-pills flex-column mb-auto aside--mypage">
					마이 페이지
					<!-- nav bar 활성화 일때 => class="nav-link active", 비활성화 일떄 => class="nav-link link-dark" -->
					<li class="nav-item"><a href="/member/profile"
						class="nav-link link-dark" aria-current="page"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#home"></use></svg><i class="bi bi-person-circle"></i>
							프로필 수정
					</a></li>
					<li><a href="/member/paymentHistoryList" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg><i class="bi bi-credit-card"></i>
							결제 내역
					</a></li>
				</ul>
				<ul class="nav nav-pills flex-column mb-auto aside--mypage">
					나의 여행 일정
					<li><a href="/member/uploadList" class="nav-link link-dark">
							<svg class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg><i class="bi bi-map"></i> 나의 여행
							이야기
					</a></li>
					<li><a href="/member/purchasedList" class="nav-link link-dark">
							<svg class="bi me-2" width="16" height="16">
								<use xlink:href="#grid"></use></svg><i class="bi bi-geo-alt"></i> 구매한
							일정 내역
					</a></li>
					<li><a href="/member/cartList" class="nav-link link-dark">
							<svg class="bi me-2" width="16" height="16">
								<use xlink:href="#people-circle"></use></svg><i class="bi bi-heart"></i>
							찜목록
					</a></li>
				</ul>
				<hr>
				<button class="aside--Withdrawal">회원탈퇴</button>
			</div>
		</div>
		<!-- aside End -->