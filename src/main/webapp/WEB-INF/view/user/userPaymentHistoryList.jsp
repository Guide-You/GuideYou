<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp 내장객체, 날짜 형식 변경  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>
                
                
<!-- Cart List Start -->
<div class="col-md-12 col-lg-6 col-xl-9">
	<div class="table-responsive">
		<c:choose>
			<c:when test="${empty PaymentHistoryList}">
				<!-- 결제 내역 없을때 메시지 -->
				<div class="text-center">
					<p>결제 내역이 없습니다.</p>
				</div>
			</c:when>
		<c:otherwise>
					<table class="table cart--table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">구매 번호</th>
								<th scope="col">상품명</th>
								<th scope="col">판매자</th>
								<th scope="col">결제 금액</th>
								<th scope="col">결제 시각</th>
								<th scope="col">상태</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="history"
								items="${PaymentHistoryList}">
								<tr>
									<td class="py-5">1</td>
									<td class="py-5">${history.merchantUid }</td>
									<td class="py-5">${history.title }</td>
									<td class="py-5">박카스</td>
									<td class="py-5">30000</td>
									<td class="py-5">20240305</td>
									<td class="py-5">
										<button type="button" id="refund--button">환불하기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
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

	</div>
</div>
<!-- Cart List End -->
          
          <!-- 아래 코드는 일단 환불 창 호출 버튼! -->
          

          
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



                