<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

  <body >
    <!-- mypage Start -->
    <div class="container">
      <div class="row g-5">
        <div class="col-md-12 col-lg-6 col-xl-3">
          <!-- aside Start -->
          <div class="d-flex flex-column flex-shrink-0 p-3 aside--template" style="width: 280px;">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
              <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
              <span class="fs-4 mypage--title">My Page</span>
            </a>
                    
              <div class="dropdown ">
                <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle profile--myinfo" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp" alt="" width="32" height="32" class="rounded-circle me-2">
                  <strong >박경진 님</strong>
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                  <li><a class="dropdown-item profile--logout" href="#">로그아웃</a></li>
                </ul>
              </div>

              <hr>
              <ul class="nav nav-pills flex-column mb-auto aside--mypage">마이 페이지
                <li class="nav-item"> 
                  <a href="#" class="nav-link active" aria-current="page">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg><i class="bi bi-person-circle"></i>
                    프로필 수정
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg><i class="bi bi-bell-fill"></i>
                    알림
                  </a>
                </li>
              </ul>
              <ul class="nav nav-pills flex-column mb-auto aside--mypage">나의 여행 일정
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg><i class="bi bi-map"></i>
                    나의 여행 맵
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg><i class="bi bi-geo-alt"></i>
                    구매한 일정 내역
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg><i class="bi bi-heart"></i>
                    찜목록
                  </a>
                </li>
              </ul>
              <hr>
              <button class="aside--Withdrawal">회원탈퇴</button>
            </div>
          </div>
          <!-- aside End -->
                          
                
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
  </body>

 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

