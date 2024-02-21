<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
                  <strong >�ڰ��� ��</strong>
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                  <li><a class="dropdown-item profile--logout" href="#">�α׾ƿ�</a></li>
                </ul>
              </div>

              <hr>
              <ul class="nav nav-pills flex-column mb-auto aside--mypage">���� ������
                <li class="nav-item"> 
                  <a href="#" class="nav-link active" aria-current="page">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg><i class="bi bi-person-circle"></i>
                    ������ ����
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg><i class="bi bi-bell-fill"></i>
                    �˸�
                  </a>
                </li>
              </ul>
              <ul class="nav nav-pills flex-column mb-auto aside--mypage">���� ���� ����
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg><i class="bi bi-map"></i>
                    ���� ���� ��
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg><i class="bi bi-geo-alt"></i>
                    ������ ���� ����
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg><i class="bi bi-heart"></i>
                    ����
                  </a>
                </li>
              </ul>
              <hr>
              <button class="aside--Withdrawal">ȸ��Ż��</button>
            </div>
          </div>
          <!-- aside End -->