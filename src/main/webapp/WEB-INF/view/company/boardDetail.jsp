<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!--  글 상세 view -->

<div class="container">
	<div class="row g-4">
		<div class="col-lg-6"></div>
		<div class="col-lg-6">
			<h4 class="fw-bold mb-3">${board.title}</h4>
			<p class="mb-3">${board.type}</p>
			<p class="fw-bold mb-3">${board.writerId}</p>

			<p class="mb-4">
				<fmt:formatDate value="${board.createdAt}"
					pattern="yyyy-MM-dd hh:mm:ss" />
			</p>
		</div>

		<div class="col-lg-12">
			<nav>
				<div class="nav nav-tabs mb-3">
					<button class="nav-link active border-white border-bottom-0"
						type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
						data-bs-target="#nav-about" aria-controls="nav-about"
						aria-selected="true">상세내용</button>

					<button class="nav-link border-white border-bottom-0" type="button"
						role="tab" id="nav-mission-tab" data-bs-toggle="tab"
						data-bs-target="#nav-mission" aria-controls="nav-mission"
						aria-selected="false">댓글 리스트</button>
				</div>
			</nav>
			<div class="tab-content mb-5">
				<div class="tab-pane active" id="nav-about" role="tabpanel"
					aria-labelledby="nav-about-tab">
					<p>${board.content}</p>
				</div>
				<div class="tab-pane" id="nav-mission" role="tabpanel"
					aria-labelledby="nav-mission-tab">
					<div class="d-flex">
						<div class="">
							<p class="mb-2" style="font-size: 14px;">
								<fmt:formatDate value="${comment.createdAt}"
									pattern="yyyy-MM-dd hh:mm:ss" />
							</p>
							<div class="d-flex justify-content-between">
								<h5>${comment.writerId}</h5>
							</div>
							<p>${comment.content}</p>
						</div>
					</div>
				</div>
			</div>
			
				<h4 class="mb-5 fw-bold">댓글을 남겨주세요</h4>
				<div class="row g-4">
					<div class="col-lg-6">
						<div class="border-bottom rounded">
							<input type="text" class="form-control border-0 me-4"
								placeholder="UserId*">
						</div>
					</div>

					<div class="col-lg-12">
						<div class="border-bottom rounded my-4">
							<textarea name="" id="" class="form-control border-0" cols="30"
								rows="8" placeholder="댓글내용 *" spellcheck="false"></textarea>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="d-flex justify-content-between py-3 mb-5"></div>
						<form action="/company/boardDetail" method="post" id="insertComment">
						<a href="/company/boardDetail"
							class="btn border border-secondary text-primary rounded-pill px-4 py-3"
							type="submit" value="댓글등록">댓글등록</a>
							</form>
					</div>
				</div>
		</div>
		</form>
	</div>
	
	<div class="text-end">
	<button type="button" class="btn btn-outline-info"
		onclick="location.href='/company/delete/${board.id}'">삭제</button>
	<button type="button" class="btn btn-outline-info"
		onclick="location.href='/company/boardModify/${board.id}'">수정</button>

	<a href="/company/boardList"><button type="button"
			class="btn btn-outline-info">게시글 목록</button></a>

</div>
</div>

<fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd hh:mm:ss" />


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>