<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>

<!-- Cart List Start -->
<div class="col-md-12 col-lg-6 col-xl-9 ">
	<div class="table-responsive paging--parent">
		<c:choose>
			<c:when test="${empty wishListProductUserDTOList}">
				<!-- 장바구니 없을때 메시지 -->
				<div class="text-center">
					<p>장바구니에 담긴 상품이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
					<table class="table cart--table">
						<thead>
							<tr>
								<th scope="col">plan photo</th>
								<th scope="col">title</th>
								<th scope="col">seller</th>
								<th scope="col">price</th>
								<th scope="col"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="wishListItem"
								items="${wishListProductUserDTOList}">
								<tr>
									<td scope="row">
										<div class="d-flex align-items-center mt-2">
											<img src="/images/upload/${wishListItem.productImage}"
												class="img-fluid rounded-circle"
												style="width: 90px; height: 90px;" alt="">
										</div>
									</td>
									<td class="py-5">${wishListItem.productTitle}</td>
									<td class="py-5">${wishListItem.writerNickname}</td>
									<td class="py-5" id="productPrice">${wishListItem.formatPrice()}</td>
									<th scope="row">
										<div>
											<button type="button"
												class="border-secondary rounded-pill text-primary text-uppercase mb-4 ms-4"
												data-wishlist-id="${wishListItem.wishListId}">삭제
											</button>
										</div>
										<div>
											<form id="send--detail--form">
											    <input type="hidden" name="productId" id="product--id" value="${wishListItem.productId}"> 
											    <input type="hidden" name="productTitle" id="product--title" value="${wishListItem.productTitle}"> 
											    <input type="hidden" name="productSellerId" id="product--seller--id" value="${wishListItem.authorId}">
											    <input type="hidden" name="sellerNickname" id="seller--nickname" value="${wishListItem.writerNickname}">
											    <input type="hidden" name="productPrice" id="product--price" value="${wishListItem.productPrice}">
											    <input type="hidden" name="thumbnailFileName" id="thumbnail--file--name" value="${wishListItem.productImage}">
											</form>
											<button type="button"
													class="border-secondary rounded-pill text-primary text-uppercase mb-4 ms-4"
													id="cart--purchase--btn">구매
												</button>
										</div>
									</th>
								</tr>
							</c:forEach>
						</tbody>

					</table>
			</c:otherwise>
		</c:choose>
		<!-- 페이징 처리 -->
		<div class="pagination justify-content-center mb-5 paging--num">
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
<script src="/js/user/userCartList.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>