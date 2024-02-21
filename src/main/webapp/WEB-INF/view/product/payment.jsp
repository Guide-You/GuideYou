<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

    <div class="container-fluid contact py-5">
      <div class="container py-5">
        <div class="p-5 bg-light rounded">
          <div class="row g-4">
              <!-- Payment Start -->
              <div class="container">
                <div class="row">
                  <div class="table-responsive">
                    <form action="">
                      <h4 class="payment--title">구매 상품</h4>
                      <table class="table payment--table">
                        <thead>
                          <tr>
                            <th scope="col">plan photo</th>
                            <th scope="col">title</th>
                            <th scope="col">seller</th>
                            <th scope="col">price</th>
                          </tr>
                        </thead>
                        <tbody class="payment--tbody">
                          <tr>
                            <th scope="row">
                              <div class="d-flex align-items-center mt-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                              </div>
                            </th>
                            <td class="py-5">${order.productTitle}</td>
                            <td class="py-5">${order.productSeller }</td>
                            <td class="py-5">${order.productPrice }</td>
                          </tr>
                        </tbody>
                      </table>
                      <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4 total--price">Total</h5>
                        <p class="mb-0 pe-4">${order.productPrice }</p>
                      </div>
                      <div >
                        <h5 class="payment--title">결제 방법</h5>
                          <div class="row payment--button">
                            <div class="col-md-12 col-lg-4">
                                <div class="form-item w-100">
                                  <button class="payment--payby">계좌이체</button>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="form-item w-100">
                                  <button class="payment--payby" id="kakaopay--btn" type="button" > <img src="/img/kakao-pay.png" alt=""></button>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="form-item w-100">
                                  <button class="payment--payby"> <img src="/img/toss-pay.png" alt=""></button>
                                </div>
                            </div>
                          </div>
                      </div>
                      
                      	<!-- Request Info to paymentAPI -->
						<form id="send--payment--form">
							<input type="text" name ="orderId" id="order--id" value="${order.productId}">
								<!-- 추후 photo 정보 받아오기 -->
							<input type="text" name ="orderTitle" id="order--title" value="${order.productTitle}">
								<!-- 추후 user nickname으로 변경 -->
							<input type="text" name ="orderSeller" id="order--seller" value="${order.productSeller }">
							<input type="text" name ="orderPrice" id="order--price" value="${order.productPrice }">
						</form>
	

                      <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 cart--purchase" type="button">
                      구매하기
                      </button>
                    </form>
                  </div>
                </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>

    <!--  payment End -->
    
    
    
    <script type="text/javascript">
    
	// payment -> paymentAPI
	const orderId = document.getElementById('order--id').value;
	const orderTitle = document.getElementById('order--title').value;
	const orderSeller = document.getElementById('order--seller').value;
	const orderPrice = document.getElementById('order--price').value;

		

	
    
    
	</script>
  
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

