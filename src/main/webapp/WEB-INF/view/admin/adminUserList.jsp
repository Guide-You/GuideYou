<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp 내장객체, 날짜 형식 변경  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header -->
<%@ include file="/WEB-INF/view/admin/layout/header.jsp"%>

<!-- sidebar -->
<%@ include file="/WEB-INF/view/admin/layout/sidebar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main id="main" class="main">

		<!-- User List Start -->
		<div class="col-md-12 col-lg-6 col-xl-9">
			<div class="table-responsive">
				<table class="table cart--table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이름</th>
							<th scope="col">닉네임</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">가입일자</th>
							<th scope="col">탈퇴유무</th>
							<th scope="col">탈퇴일자</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="adminUser" items="${adminUserList}"
							varStatus="loop">
							<tr>
								<td class="py-5">${loop.index + 1}</td>
								<td class="py-5">${adminUser.name}</td>
								<td class="py-5">${adminUser.nickname}</td>
								<td class="py-5">${adminUser.email}</td>
								<td class="py-5">${adminUser.phone}</td>
								<td class="py-5">${adminUser.formatCreatedAt()}</td>
								<td class="py-5">${adminUser.deleteYn}</td>
								<td class="py-5">${adminUser.formatDeleteAt()}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div class="pagination justify-content-center mb-5">
					<c:if test="${page > 1}">
						<a href="?page=1&size=${size}" class="page-link">&laquo; 첫 페이지</a>
						<a href="?page=${page - 1}&size=${size}" class="page-link">&laquo;
							이전</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i eq page}">
								<a href="?page=${i}&size=${size}" class="page-link active">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}&size=${size}" class="page-link">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page < totalPages}">
						<a href="?page=${page + 1}&size=${size}" class="page-link">다음
							&raquo;</a>
						<a href="?page=${totalPages}&size=${size}" class="page-link">마지막
							페이지 &raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
		<!-- User List End -->
	</main>
</body>
</html>
<!-- footer -->
<%@ include file="/WEB-INF/view/admin/layout/footer.jsp"%>