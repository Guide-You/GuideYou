<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- aside -->
<%@ include file="/WEB-INF/view/layout/userAside.jsp"%>
                
          <!-- Cart List Start -->
          <div class="col-md-12 col-lg-6 col-xl-9">
            <div class="table-responsive">
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
                    
                        <tr>
                          <th scope="row">
                            <div class="form-check my-3">
                                <input class="form-check-input" type="checkbox" id="cart--checkbox">
                                <label class="form-check-label" for="cart--checkbox"></label>
                            </div>
                          </th>
                          <td scope="row">
                              <div class="d-flex align-items-center mt-2">
                                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                              </div>
                          </td>
                          <td class="py-5">[부산] 현지인이 추천하는 맛도리 여행지</td>
                          <td class="py-5">박경진</td>
                          <td class="py-5">￦ 3,000</td>
                        </tr>
                        
                        
                    </tbody>
                    
                </table>
              </form>
              <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                <h5 class="mb-0 ps-4 me-4 total--price">Total</h5>
                <p class="mb-0 pe-4">￦ 3,000</p>
              </div>
              <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 cart--purchase" type="button">
              구매하기
              </button>
            </div>
          </div>
          <!-- Cart List End -->
        </div>
      </div>
    </div>
    <!--  Page End -->
    
    
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>