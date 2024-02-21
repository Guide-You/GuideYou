<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
                
          <!-- Profile Start -->
          <div class="col-md-12 col-lg-6 col-xl-9">
            <div class="container profile--main">
              <div class="registration-form profile--form">
                <form>
                    <div class="form-icon">
                        <span><i class="icon icon-user"></i></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control item" id="username" placeholder="이름">
                    </div>
                    <hr>
                    <h4>소개</h4>
                    <div class="form-group">
                      <input type="text" class="form-control item" id="profile--intro" placeholder="소개글">
                  </div>
                </form>
                <div class="social-media">

                  <div class="form-group">
                    <button type="button" class="btn btn-block create--account">수정</button>
                </div>
                </div>
            </div>
            </div>
          </div>
          <!-- Profile End -->
        </div>
      </div>
    </div>
      <!--  Page End -->
      
      
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
  </body>

	

