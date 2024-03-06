<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp 내장객체, 날짜 형식 변경  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>
<!-- Purchased List Start -->
<div class="col-md-12 col-lg-6 col-xl-9">
    <div class="container">
        <div class="registration-form purchased--list paging--parent">

            <c:choose>
                <c:when test="${empty purchasedProductInfoList}">
                    <!-- 구매한 상품 없을때 메시지 -->
                    <div class="text-center">
                        <p>구매한 상품 담긴 상품이 없습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="purchaseProductInfo" items="${purchasedProductInfoList}">
                        <div class="card mb-3 purchased--list--section">
                            <div class="row g-0">
                                <div class="col-md-4 purchased--list--img--section">
                                    <div class="fixed-image-container">
                                        <img src="/images/upload/${purchaseProductInfo.productImage}"
                                            class="img-fluid w-100 rounded-start purchased--img" alt="...">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body purchased--info">
                                        <h3 class="card-title">${purchaseProductInfo.productTitle}</h3>
                                        <hr>
                                        <p>[${purchaseProductInfo.cityName}] 가유</p>
                                        <p class="card-text purchase-date">
                                            <small class="text-body-secondary">
                                                <fmt:formatDate value="${purchaseProductInfo.paymentDate}"
                                                    pattern="yyyy-MM-dd HH:mm:ss" />
                                            </small>
                                            
                                        <!-- Button trigger modal -->
                                        <input type="hidden" value="${purchaseProductInfo.productId }">
                                        <button type="button" class="btn btn-primary purchased--review--btn"
                                            data-bs-toggle="modal" data-bs-target="#review--modal" id="review--modal--btn">
                                            리뷰쓰기
                                        </button>
                                        </p>

                                        <!-- review modal start -->
                                        <div class="modal fade" id="review--modal" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                <div class="modal-content rounded-0">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Review 등록</h5>
                                                        <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="d-flex main-content">
                                                        <div class="content-text p-4">
                                                            <form action="#" id="send--review--form">
                                                                <input type="text" id="review--product--id"
                                                                    name="reviewProductId"
                                                                    value="${purchaseProductInfo.productId }" /> <span>구매
                                                                    플랜 :
                                                                    <a href="">${purchaseProductInfo.productTitle}</a>
                                                                </span>
                                                                <p>
                                                                    구매하신 플랜에 대해 리뷰 작성을 해주세요! <br /> 해당 리뷰는
                                                                    다른 플랜 구매자에게 큰 도움이 될 수 있습니다
                                                                </p>
                                                                <div class="form-group review--group">
                                                                    <label for="review--register--title">리뷰 제목</label>
                                                                    <input type="text"
                                                                        class="form-control review--register--title"
                                                                        placeholder="Review Title" name="reviewTitle"
                                                                        id="review--title" value="review title" />
                                                                </div>
                                                                <div class="form-group review--group">
                                                                    <label for="review--register--content">리뷰 내용</label>
                                                                    <input type="text"
                                                                        class="form-control review--content--input"
                                                                        placeholder="Enter content" name="reviewContent"
                                                                        id="review--content" value="review content" />
                                                                </div>
                                                                <div class="form-group review--group">
                                                                    <lable for="review--score">별점</lable>
                                                                    <input type="text"
                                                                        class="form-control review--score--input"
                                                                        placeholder="Enter Score" name="reviewScore"
                                                                        id="review--score" value="5" />
                                                                </div>

                                                                <div class="form-group">
                                                                    <input type="submit" value="리뷰 등록"
                                                                        class="btn btn-primary btn-block review--btn"
                                                                        id="review--button" />
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- review modal end -->

                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
</div>
<!-- Purchased List End -->
</div>
</div>
</div>
<!--  Page End -->
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

