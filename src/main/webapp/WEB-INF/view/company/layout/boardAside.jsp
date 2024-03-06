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
					class="fs-4 mypage--title">게시판</span>
				</a>

				<hr>
				<ul class="nav nav-pills flex-column mb-auto aside--mypage">
					<!-- nav bar 활성화 일때 => class="nav-link active", 비활성화 일떄 => class="nav-link link-dark" -->
					<li class="nav-item">
						<a href="/member/profile" class="nav-link link-dark" aria-current="page"> 
						<svg class="bi me-2" width="16" height="16">
						</svg>
							notice
						</a>
					</li>
					<li>
						<a href="/member/paymentHistoryList" class="nav-link link-dark"> 
						<svg class="bi me-2" width="16" height="16">
						</svg>
							faq
						</a>
					</li>
					<li><a href="/member/paymentHistoryList" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg>
							qna
					</a></li>
				</ul>
				<hr>
			</div>
		</div>
		<!-- aside End -->