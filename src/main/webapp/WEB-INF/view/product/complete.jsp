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
                      <h2 class="payment--title" style="text-align: center;">구매가 완료되었습니다</h2>
                      <div class="complete--table">
                        
                      <div class="complete--info--div">
                        <h3 class="payment--title">결제 정보</h3>
                        <div class="complete--info"><p><span>상품 번호 : </span>${complete.productId }</p></div>
                        <div class="complete--info"><p><span>결제 번호 : </span>${complete.merchantUid }</p></div>
                        <div class="complete--info"><p><span>결제 일자 : </span>${complete.formatPaymentDate() }</p></div>
                      </div>


                        <h3 class="payment--title">결제 상품</h3>
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
                                  <img src="/images/upload/${complete.productPhoto}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                </div>
                              </th>
                              <td class="py-5">${complete.productTitle }</td>
                              <td class="py-5">${complete.seller }</td>
                              <td class="py-5">${complete.formatProductPrice() }</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4 total--price">Total</h5>
                        <p class="mb-0 pe-4" id="complete--total--price">${complete.formatTotalPrice() }</p>
                      </div>
						
						<a href="/list">
	                      <button class="btn rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 cart--purchase" type="button">
	                      다른 플랜 구경가기
	                      </button>
                        </a>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
