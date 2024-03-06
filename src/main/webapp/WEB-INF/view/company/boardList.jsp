<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<%@ include file="/WEB-INF/view/company/layout/boardAside.jsp"%>


                
<!-- Cart List Start -->
<div class="col-md-12 col-lg-6 col-xl-9">
	<div class="table-responsive">
<!-- boardList Start -->
			<table class="table table-hover">
			    <thead>
			      <tr>
			        <th scope="col">ID</th>
			        <th scope="col">작성자</th>
			        <th scope="col">제목</th>
			        <th scope="col">내용</th>
			        <th scope="col">조회수</th>
			      </tr>
			    </thead>
			    
			    <tbody>
					<c:forEach var="board" items="${boardList}" varStatus="loop">
				      <tr>
				        <th class="py-5">${loop.index + 1}</th>
				        <td class="py-5">${board.writerId}</td>
				        <td class="py-5"><a href="/company/boardDetail/${board.id}">${board.title}</a></td>
				        <td class="py-5"><a href="/company/boardDetail/${board.id}">${board.content}</a></td>
				        <td class="py-5">${board.viewCount}</td>
				     
				      </tr>
					</c:forEach>
			    </tbody>
			  </table>
	
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
	</div>
  </div>   
  <!-- Board List End -->

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>