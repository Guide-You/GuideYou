<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>
                
          <!-- Purchased List Start -->
          <div class="col-md-12 col-lg-6 col-xl-9" >
            <div class="container">
              <div class="registration-form purchased--list">

                <div class="card mb-3 purchsed--list--section" >
                  <div class="row g-0">
                    <div class="col-md-4 purchased--list--img--section">
                      <img src="http://via.placeholder.com/500" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body purchased--info">
                        <h3 class="card-title">제목 !!</h3>
                        <hr>
                        <p>[부산(지역)] 가유</p>
                        <p class="card-text purchase-date"><small class="text-body-secondary">2023-11-23(구매일자)</small></p>
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

                <div class="card mb-3" style="max-width: 540px;">
                  <div class="row g-0">
                    <div class="col-md-4">
                      <img src="http://via.placeholder.com/500" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h3 class="card-title">제목 !!</h3>
                        <hr>
                        <p>[부산(지역)] 가유</p>
                        <p class="card-text purchase-date"><small class="text-body-secondary">2023-11-23(구매일자)</small></p>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card mb-3" style="max-width: 540px;">
                  <div class="row g-0">
                    <div class="col-md-4">
                      <img src="http://via.placeholder.com/500" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h3 class="card-title">제목 !!</h3>
                        <hr>
                        <p>[부산(지역)] 가유</p>
                        <p class="card-text purchase-date"><small class="text-body-secondary">2023-11-23(구매일자)</small></p>
                      </div>
                    </div>
                  </div>
                </div>

                
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
                