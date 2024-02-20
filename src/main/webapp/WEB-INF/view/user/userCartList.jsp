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
          <div class="d-flex flex-column flex-shrink-0 p-3 aside--template " style="width: 280px;">
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
                        <tr>
                          <th scope="row">
                            <div class="form-check my-3">
                                <input class="form-check-input" type="checkbox" id="cart--checkbox">
                                <label class="form-check-label" for="cart--checkbox"></label>
                            </div>
                          </th>
                          
                          <td scope="row">
                              <div class="d-flex align-items-center mt-2">
                                  <img src="img/vegetable-item-2.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                              </div>
                          </td>
                          <td class="py-5">[부산] 현지인이 추천하는 맛도리 여행지</td>
                          <td class="py-5">박경진</td>
                          <td class="py-5">￦ 3,000</td>
                        </tr>
                        <tr>
                          <th scope="row">
                            <div class="form-check my-3">
                                <input class="form-check-input" type="checkbox" id="cart--checkbox">
                                <label class="form-check-label" for="cart--checkbox"></label>
                            </div>
                          </th>
                          
                          <td scope="row">
                              <div class="d-flex align-items-center mt-2">
                                  <img src="img/vegetable-item-2.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
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
  </body>

<!-- footer -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
  