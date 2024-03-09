<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!--  글 상세 view -->

<div class="container">
	<div class="row g-4">
		<div class="col-lg-6" style="width: 0%;"></div>
		<div class="col-lg-6">
			<h4 class="fw-bold mb-3">${board.title}</h4>
			<p class="mb-4">
				<fmt:formatDate value="${board.createdAt}"
					pattern="yyyy-MM-dd hh:mm:ss" />
			</p>
		</div>

		<div class="col-lg-12">
			<nav>
				<div class="nav nav-tabs mb-3">
					<p class="nav-link active border-white border-bottom-0"
						type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
						data-bs-target="#nav-about" aria-controls="nav-about"
						aria-selected="true">상세내용</p>
				</div>
			</nav>


			<div class="text-end">

				<c:if
					test="${principal.role eq 'ADMIN' || board.writerId eq writerId}">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/company/delete/${board.type}/${board.id}'"
						" style="color: white;">삭제</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/company/boardModify/${board.id}'"
						" style="color: white;">수정</button>
				</c:if>

				<a href="/company/boardList/${board.type}">
					<button type="button" class="btn btn-primary" style="color: white";>게시글
						목록</button>
				</a>
			</div>






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
								<fmt:formatDate value="${board.createdAt}"
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
			<c:if test="${board.type eq 'QnA'}">
				<h4 class=" fw-bold">관리자님의 답글</h4>
				<form action="/company/saveComment" method="post" id="insertComment">
					<input type="hidden" id="bContentsId" name="bContentsId"
						value="${board.id}">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="border-bottom rounded my-4">
								<c:choose>
									<c:when test="${empty comment}">
										<textarea name="content" id="content"
											class="form-control border-0" cols="30" rows="8"
											placeholder="질문에 답글을 작성해주세요 *" spellcheck="false"
											style="resize: none; height: 130px; border: 1px solid #ffc691 !important;"></textarea>
									</c:when>
									<c:otherwise>

										<input type="hidden" id="commentId" name="commentId"
											value="${comment.id}">
										<input type="hidden" id="writerId" name="writerId"
											value="${principal.id}">

										<textarea name="content" id="content"
											class="form-control border-0" cols="30" rows="8"
											spellcheck="false" disabled
											style="resize: none; height: 130px; margin-top: 10px; background-color: white; border: 1px solid #91caff !important;">${comment.content} </textarea>
									</c:otherwise>
								</c:choose>


								<c:if
									test="${(principal.role eq 'ADMIN' || board.writerId eq writerId) && not empty comment}">
									<button type="button" class="btn btn-primary"
										onclick="location.href='/company/deleteComment/${comment.id}/${board.id}'"
										style="color: white">삭제</button>
									<button type="button" class="btn btn-primary"
										id="commentUpdateBtn" onclick="updateComment()"
										style="color: white">수정</button>
									<!-- 저장 버튼 -->
									<button class="btn btn-primary" id="saveButton" type="button"
										onclick="saveComment()" style="display: none; color: white;">저장</button>
								</c:if>
								<c:if test="${empty comment}">
									<div class="col-lg-12">
										<button class="btn btn-primary" type="submit" value="등록"
											style="color: white;">등록</button>
									</div>
								</c:if>
							</div>
						</div>
				</form>
		</div>
		</c:if>
	</div>
</div>
</div>


<script>
	function updateComment() {
		// content를 활성화하고, 수정 및 삭제 버튼을 감춘다
		$('#content').prop('disabled', false);
		$('#commentUpdateBtn').hide(); // 수정 버튼을 감추기
		$('#insertComment')
		$('#saveButton').show();
	}

	function saveComment() {
		var writerId = document.getElementById('writerId').value;
		var bContentsId = document.getElementById('bContentsId').value;
		var commentId = document.getElementById('commentId').value;

		var content = $('#content').val();

		$.ajax({
			type : 'POST',
			url : '/company/updateComment',
			data : {
				writerId : writerId,
				content : content,
				bContentsId : bContentsId,
				commentId : commentId
			},
			success : function(response) {
				// 수정이 성공하면 알림창을 띄우고, 상세 화면으로 이동한다
				alert('수정되었습니다.');
				window.location.href = '/company/boardDetail/' + bContentsId;
			},
			error : function(xhr, status, error) {
				console.error('Error:', error);
			}
		});
	}
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>