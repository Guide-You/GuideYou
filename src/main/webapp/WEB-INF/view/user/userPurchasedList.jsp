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
          <div class="col-md-12 col-lg-6 col-xl-9" >
            <div class="container">
              <div class="registration-form purchased--list">

              <c:choose>
                  <c:when test="${empty purchasedProductInfoList}">
                    <!-- 구매한 상품 없을때 메시지 -->
                    <div class="text-center">
                      <p>구매한 상품 담긴 상품이 없습니다.</p>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="purchaseProductInfo"
                      items="${purchasedProductInfoList}">
                      <div class="card mb-3 purchsed--list--section" >
                        <div class="row g-0">
                          <div class="col-md-4 purchased--list--img--section">
                            <img src="http://via.placeholder.com/500" class="img-fluid rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body purchased--info">
                              <h3 class="card-title">${purchaseProductInfo.productTitle}</h3>
                              <hr>
                              <p>[${purchaseProductInfo.cityName}] 가유</p>
                              <p class="card-text purchase-date"><small class="text-body-secondary">
                                <fmt:formatDate value="${purchaseProductInfo.paymentDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                              </small></p>
                              <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary purchased--review--btn"
                                data-bs-toggle="modal"
                                data-bs-target="#review--modal">
                                  리뷰쓰기
                                </button>

                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </c:otherwise>
              </c:choose>
            </div>
            </div>
          </div>
          <!-- Purchased List End -->
        </div>
      </div>
    </div>
      <!--  Page End -->
      
<%@ include file="/WEB-INF/view/layout/reviewModal.jsp"%>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
                