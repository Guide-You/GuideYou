<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp 내장객체, 날짜 형식 변경  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>
                
                
          <!-- 해당 페이지는 결제 내역 리스트 이 페이지에 환불 내역을 줄건지???? -->
          <!-- 그거 보단 여기는 그냥 결제 내역만 출력을 하는게 좋을거 같음 -->
          <!-- userPurchasedList 페이지에서 구매한 리스트 출력되고 본 상품인지 안 본 상품인지 표시해주고 -->
          <!-- 안 본 상품일 때 는 환불 버튼열리게 해주는게 좋을듯 -->
          <!-- 본 상품, 안 본 상품 체크는 detail view에서 아코디언처럼 숨겨두고 버튼 클릭시 구매내역 검증하고 -->
          <!-- 구매 확인이 완료 된 경우에만 아코디언 열리게 해주는게 좋을 것 같다! -->
          <!-- 그리고 버튼 눌렷을때 ajax로 쏴서 db에 ex)unchecked->checked 로 update 후 -->
          <!-- detail view 출력 시키는것도 좋을듯 얘기해보자! -->
                
          <!-- Payment History List Start -->
          
          <!--
           
          <div class="col-md-12 col-lg-6 col-xl-9" >
            <div class="container">
              <div class="registration-form purchased--list">

              <c:choose>
                  <c:when test="${empty purchasedProductInfoList}">
                  
                  -->
                  
                  
                    <!-- 구매한 상품 없을때 메시지 -->
                    
                    <!-- 
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
           -->
           
          <!-- Purchased List End -->
          
          <!-- 아래 코드는 일단 환불 창 호출 버튼! -->
          
<button type="button" id="refund--button">환불하기</button>

          
        </div>
      </div>
    </div>
      <!--  Page End -->
      
      <script>
// 환불 js!
	"userPaymentHistoryList 실행 시작!"

    const refundButton = document.getElementById("refund--button");

    refundButton.onclick = function cancelPay() {
	
		console.log("cancelPay btn click!")
	
	    jQuery.ajax({
	      // 예: http://www.myservice.com/payments/cancel
	      "url": "/refund", 
	      "type": "POST",
	      "contentType": "application/json",
	      "data": JSON.stringify({
	        "merchantUid": "kpay_1709427250007", // 이건 구매내역에서 받아 올 예정 현재는 하드코딩!!
	        "refundPrice": 5000, // 이거도 db에서 받아 올 예정!
	        "cancelReason": "테스트 결제 환불" // 환불사유-> input테그 value로 받아 오면 될듯 or 드롭다운으로 li태그 주면 될 듯
	      }),
	      "dataType": "json"
	    });
  	}
</script>
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



                