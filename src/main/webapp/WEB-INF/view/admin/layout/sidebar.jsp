<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="/admin"> <i
					class="bi bi-grid"></i> <span>관리자 main</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>회원</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/userinfolist"> <i class="bi bi-circle"></i><span>회원정보
								리스트</span>
					</a></li>					
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>수익</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/paymentinfolist">
              <i class="bi bi-circle"></i><span>판매 수익</span>
            </a>
          </li>
        </ul>
      </li>


			
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>관리자 게시판 관리</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/company/boardList/QnA"> <i class="bi bi-circle"></i><span>
								관리자 권한 QnA 관리</span>
					</a></li>
					<li><a href="/company/boardList/FAQ"> <i
							class="bi bi-circle"></i><span>관리자 권한 FAQ 관리</span>
					</a></li>
					<li><a href="/company/boardList/Notice"> <i
							class="bi bi-circle"></i><span>관리자 권한 Notice 관리</span>
					</a></li>
					
				</ul></li>
			<!-- End Charts Nav -->
			
			<!-- End F.A.Q Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->