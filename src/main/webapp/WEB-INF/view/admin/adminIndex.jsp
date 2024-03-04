<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>가유 Guide You 관리자 페이지</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="admin/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="admin/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="admin/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="/admin" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">Guide You</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <span
						class="d-none d-md-block dropdown-toggle ps-2">관리자계정</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						

						<li><a class="dropdown-item d-flex align-items-center"
							href="#"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

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
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>회원정보
								리스트</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>카테고리
								별 검색 기능</span>
					</a></li>
					<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>신고
								관리</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>관리자
						광고관리</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>광고
								중인 업체 리스트 페이지</span>
					</a></li>
					<li><a href="tables-data.html"> <i class="bi bi-circle"></i><span>광고
								상세 페이지</span>
					</a></li>
					<li><a href="charts-echarts.html"> <i class="bi bi-circle"></i><span>광고
								등록 수정 삭제 페이지</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>관리자 QnA 관리</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="charts-chartjs.html"> <i class="bi bi-circle"></i><span>QnA
								관리자 댓글 등록</span>
					</a></li>
					<li><a href="charts-apexcharts.html"> <i
							class="bi bi-circle"></i><span>관리자 권한 댓글 삭제</span>
					</a></li>

				</ul></li>
			<!-- End Charts Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>관리자
						Notice page</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>관리자
						FAQ</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<!-- hidden_input -->
		<input type="hidden" id="dateType" name="dateType" value="1">

		<div class="pagetitle">
			<h1>가유 관리자 main</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">오늘</a></li>
										<li><a class="dropdown-item" href="#">이번달</a></li>
										<li><a class="dropdown-item" href="#">올해</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										판매 <span>| 오늘</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>${selectPayment.paymentCount}개</h6>


										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">오늘</a></li>
										<li><a class="dropdown-item" href="#">이번 달</a></li>
										<li><a class="dropdown-item" href="#">올해</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										수익 <span>| 이번 달</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>${selectTotalPrice.totalPrice}원</h6>


										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">오늘</a></li>
										<li><a class="dropdown-item" href="#">이번 달</a></li>
										<li><a class="dropdown-item" href="#">올해</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										가입자 <span>| 올해</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>${selectTotalUser.userCount}명</h6>


										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">오늘</a></li>
										<li><a class="dropdown-item" href="#">이번 달</a></li>
										<li><a class="dropdown-item" href="#">올해</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Reports <span>/오늘</span>
									</h5>

									<!-- Line Chart -->
									<div id="reportsChart"></div>

									<script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: '판매',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: '수익',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: '가입자',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">


								<div class="card-body">
									<h5 class="card-title">최근 게시물</h5>
									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">판매자</th>
												<th scope="col">상품명</th>
												<th scope="col">가격</th>
												<th scope="col">상품 등록일</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${findInfo}" var="info">
												<tr>
													<td>${info.nickName}</td>
													<td><a href="#" class="text-primary">${info.title}</a></td>
													<td>${info.price}</td>
													<td><span class="badge bg-success">${info.createdAt}</span></td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<div class="col-12">
							<div class="card top-selling overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>
										<li class="filterText" onclick="updateTitle('1')"><a
											class="dropdown-item" href="#">오늘</a></li>
										<li class="filterText" onclick="updateTitle('2')"><a
											class="dropdown-item" href="#">이번 달</a></li>
										<li class="filterText" onclick="updateTitle('3')"><a
											class="dropdown-item" href="#">올해</a></li>
									</ul>
								</div>

								<div class="card-body pb-0">
									<h5 class="card-title">
										인기상품 <span>| 오늘</span>
									</h5>
									<style>
									.datatable-input {
										display: none;
									}
									</style>
									<table class="table table-borderless datatable"
										id="productTable tbody">
										<thead>
											<tr>
												<th scope="col">Preview</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Sold</th>
												<th scope="col">Revenue</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${selectDateType}" var="productInfo">
												<tr>
													<th scope="row">
													<a href="#"><img src="/images/upload/${productInfo.uploadFileName}" alt=""></a>
													</th>
													<td><a href="#" class="text-primary fw-bold">${productInfo.introContent}</a>
													</td>
													<td>${productInfo.price}원</td>
													<td class="fw-bold">${productInfo.soldCount}</td>
													<td>${productInfo.revenue}원</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">



					<!-- Website Traffic -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Filter</h6>
								</li>

								<li><a class="dropdown-item" href="#">오늘</a></li>
								<li><a class="dropdown-item" href="#">이번 달</a></li>
								<li><a class="dropdown-item" href="#">올해</a></li>
							</ul>
						</div>

						<div class="card-body pb-0">
							<h5 class="card-title">
								Website Traffic <span>| 오늘</span>
							</h5>

							<div id="trafficChart" style="min-height: 400px;" class="echart"></div>

							<script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                        value: 1048,
                        name: 'Search Engine'
                      },
                      {
                        value: 735,
                        name: 'Direct'
                      },
                      {
                        value: 580,
                        name: 'Email'
                      },
                      {
                        value: 484,
                        name: 'Union Ads'
                      },
                      {
                        value: 300,
                        name: 'Video Ads'
                      }
                      ]
                    }]
                  });
                });
              </script>

						</div>
					</div>
					<!-- End Website Traffic -->

					<!-- News & Updates Traffic -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Filter</h6>
								</li>
								<li><a class="dropdown-item" href="#">오늘</a></li>
								<li><a class="dropdown-item" href="#">이번 달</a></li>
								<li><a class="dropdown-item" href="#">올해</a></li>
							</ul>
						</div>
						<div class="card-body pb-0">
							<h5 class="card-title">
								News <span>| 오늘</span>
							</h5>
							<div class="table-responsive">
								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">Type</th>
											<th scope="col">Title</th>
											<th scope="col">Content</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${selectBoardList}" var="board">
											<tr>
												<td>${board.type}</td>
												<td>${board.title}</td>
												<td>${board.content}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- End table responsive -->
						</div>
					</div>
					<!-- End News & Updates -->

				</div>
				<!-- End Right side columns -->

			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Guide You</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="admin/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="admin/vendor/chart.js/chart.umd.js"></script>
	<script src="admin/vendor/echarts/echarts.min.js"></script>
	<script src="admin/vendor/quill/quill.min.js"></script>
	<script src="admin/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="admin/vendor/tinymce/tinymce.min.js"></script>
	<script src="admin/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="admin/js/main.js"></script>
	
	<script>


	

	const updateTitle = (dateType) => {
		$('#dateType').val(dateType);
		
		$.ajax({
			type:"GET",
			url:"/admin",
			data: { dateType: dateType }, // 이 부분을 확인해야 합니다.
			success: function(data) {
				updateTable(data);
			},
			error: function() {
				alert("실패");
			}
		});
	}
	

function updateTable(data) {
    // 테이블의 tbody 선택
    var tbody = $('#productTable tbody');
    
    // tbody 초기화
    tbody.empty();
    
    // 받은 데이터를 이용하여 테이블에 새로운 행 추가
    $.each(data, function(index, findProductInfo) {
        var row = $('<tr>');
        row.append('<th scope="row"><a href="#"><img src="/images/upload/' + findProductInfo.uploadFileName + '" alt=""></a></th>');
        row.append('<td><a href="#" class="text-primary fw-bold">' + findProductInfo.intro_content + '</a></td>');
        row.append('<td>' + findProductInfo.price + '원</td>');
        row.append('<td class="fw-bold">' + findProductInfo.soldCount + '</td>');
        row.append('<td>' + findProductInfo.revenue + '원</td>');
        tbody.append(row);
    });
}

</script>
</body>

</html>