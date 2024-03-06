<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/admin/layout/header.jsp"%>
<%@ include file="/WEB-INF/view/admin/layout/sidebar.jsp"%>


<main id="main" class="main">

        <div class="table container-fluid contact py-5">
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">TYPE</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성시간</th>
                  </tr>
                </thead>
                <tbody>
				 <c:forEach var="board" items="${boardList}">
                  <tr>
                    <th>${board.id}</th>
                    <td>${board.type}</td>  <!--관리자니까 board.writerId로 가야하나  -->
                    <td><a href="/admin/adminArticleDetail/${board.id}">${board.title}</a></td>
                    <td><a href="/admin/adminArticleDetail/${board.id}">${board.content}</a></td>
                    <td>${board.viewCount}</td>
                    <td>
                      <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd hh:mm:ss"/>
                    <button type="button" class="btn btn-outline-info" onclick="location.href='/admin/delete/${board.id}'">삭제</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='/admin/adminModify/${board.id}'">수정</button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
        </div>
        <!-- page group-->
         <div class="d-flex pagination justify-content-center buttons-group">
		<c:if test="${page > 1}">
			<a href="?page=1&size=${size}">&laquo; 첫 페이지</a>
			<a href="?page=${page - 1}&size=${size}">&laquo; 이전</a>
		</c:if>
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${i eq page}">
					<a href="?page=${i}&size=${size}" class="active">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="?page=${i}&size=${size}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page < totalPages}">
			<a href="?page=${page + 1}&size=${size}">다음 &raquo;</a>
			<a href="?page=${totalPages}&size=${size}">마지막 페이지
				&raquo;</a>
		</c:if>
	</div>
<!-- page group-->
<%@ include file="/WEB-INF/view/admin/layout/footer.jsp"%>