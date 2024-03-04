<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>

<!-- Cart List Start -->
<div class="col-md-12 col-lg-6 col-xl-9">
	<div class="table-responsive">
		<c:choose>
			<c:when test="${empty wishListProductUserDTOList}">
				<!-- 장바구니 없을때 메시지 -->
				<div class="text-center">
					<p>장바구니에 담긴 상품이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<form>
					<table class="table cart--table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">plan photo</th>
								<th scope="col">title</th>
								<th scope="col">seller</th>
								<th scope="col">price</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="wishListItem"
								items="${wishListProductUserDTOList}">
								<tr>
									<th scope="row">
										<div class="form-check my-3">
											<input class="form-check-input" type="checkbox"
												id="cart--checkbox"> <label class="form-check-label"
												for="cart--checkbox"></label>
										</div>
									</th>
									<td scope="row">
										<div class="d-flex align-items-center mt-2">
											<img
												src="/images/upload/${wishListItem.productImage}"
												class="img-fluid rounded-circle"
												style="width: 90px; height: 90px;" alt="">
										</div>
									</td>
									<td class="py-5">${wishListItem.productTitle}</td>
									<td class="py-5">${wishListItem.writerNickname}</td>
									<td class="py-5" id="productPrice">${wishListItem.formatPrice()}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</form>
				<div
					class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
					<h5 class="mb-0 ps-4 me-4 total--price">Total</h5>
					<p id="totalPrice" class="mb-0 pe-4">0원</p>
				</div>
				<button
					class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 cart--purchase"
					type="button">구매하기</button>
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
</div>
<!-- Cart List End -->
</div>
</div>
</div>
<!--  Page End -->


<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>