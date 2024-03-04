<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>


<!-- Upload List Start -->
<div class="col-md-12 col-lg-6 col-xl-9">

	<c:choose>
		<c:when test="${empty uploadProductsInfoList}">
			<!-- 등록한 상품 없을때 메시지 -->
			<div class="text-center">
				<p>등록한 상품이 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row g-4 upload--card">
				<c:forEach var="uploadProductsInfo"
					items="${uploadProductsInfoList}">
					<div class="col-sm-6">
						<div class="rounded position-relative fruite-item">
							<div class="fruite-img">
								<img src="/images/upload/${uploadProductsInfo.uploadFileName}"
									class="img-fluid w-100 rounded-top" alt="">
							</div>
							<div
								class="text-white bg-secondary px-3 py-1 rounded position-absolute"
								style="top: 10px; left: 10px">
								${uploadProductsInfo.cityName}</div>
							<div
								class="p-4 border border-secondary border-top-0 rounded-bottom">
								<h4>${uploadProductsInfo.title}</h4>
								<p>${uploadProductsInfo.shortIntroContent}</p>
								<div class="d-flex justify-content-between flex-lg-wrap">
									<p class="text-dark fs-5 fw-bold mb-0">
										${uploadProductsInfo.productPrice}</p>
									<a href="/update/${uploadProductsInfo.productId}"
										class="btn border border-secondary rounded-pill px-3 text-primary">수정하기</a>
									<a href="/delete/${uploadProductsInfo.productId}"
										class="btn border border-secondary rounded-pill px-3 text-primary">삭제하기</a>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>
		</c:otherwise>
	</c:choose>
	<!-- 페이징 처리 -->
	<div class="pagination justify-content-center mb-5">
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
			<a href="?page=${totalPages}&size=${size}">마지막 페이지 &raquo;</a>
		</c:if>
	</div>
	<!-- 페이징처리 종료 -->
</div>

<!-- Upload List End -->
</div>
</div>
</div>
<!--  Page End -->
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>