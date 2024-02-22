<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>


    <!-- Search Start -->
      <section class="sc-a37b6b4d-0 iVnkhP">
        <div class="sc-a37b6b4d-1 bBhtyX">
          <input
            maxlength="20"
            class="sc-a37b6b4d-2 cpWeqo"
            value=""
            placeholder="🔍 다른 플랜 검색"
          />
        </div>
      </section>
  
    <!-- Search End -->

    <!-- Detail Title Start -->
    <!-- Title Image 확인 후 사이즈 변경 필요-->
    <div class="container py-5 product--title">
      <div id="carouselExample" class="carousel slide">
	        <div class="carousel-inner">
	          <div class="carousel-item active">
	            <img src="/images/upload/${photos.uploadFileName}" class="d-block w-100"/>
	          </div>          
	        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExample"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExample"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <div class="container title--title">
        <div class="col-lg-12">
          <h1 class="mb-0">${product.title}</h1>
        </div>

        <div class="col-lg-12 detail--title--info">
          <span id="title--writer">작성자</span>
          <span id="title--siren"
            ><img src="/img/Siren.png" alt="siren"
          /></span>
          <span id="title--like"><img src="/img/like.png" alt="like" /> </span>
        </div>
        <div class="title--rate--price">
          <span class="title--rate"></span>
          <span class="title--price">${product.price}</span>
        </div>
      </div>
    </div>
    <!-- Detail Title End -->

    <!-- Purchase detail Start -->
    <div class="purchase">
      <h6>
        👨‍👩‍👧‍👦 <span class="purchase--count"> 0 </span>명의 여행자가 선택했어요 👨‍👩‍👧‍👦
      </h6>
    </div>
    <!-- Purchase detail End -->


	<!-- Request Info to Server -->
	<form id="send--detail--form">
		<input type="hidden" name ="productId" id="product--id" value="${product.id}">
			<!-- 추후 photo 정보 받아오기 -->
		<input type="hidden" name ="productTitle" id="product--title" value="${product.title}">
			<!-- 추후 user nickname으로 변경 -->
		<input type="hidden" name ="productSeller" id="product--seller" value="${product.userId}">
		<input type="hidden" name ="productPrice" id="product--price" value="${product.price}">
	</form>
	
	
    <!-- Plan Selling Button Start -->
    <div class="container plan--selling--button">
      <button type="button" id="order--button" >일정 구매하러 가유 😘</button>
    </div>
    <!-- Plan Selling Button End -->

    <div class="container" style="margin-top: 4%">
      <hr />
    </div>

    <!-- Detail Content Start -->
    <div class="container">
      <div class="card content--card">
        <div class="card-body">
          <h5 class="card-title">❣️ 이런 상품이에요!</h5>
          <p class="card-text">
            ${product.content}
          </p>
          <div class="space"></div>
          <h6 class="card-subtitle mb-2 text-body-secondary content--email">
            문의 이메일 : <span>email@email.com</span>
          </h6>
        </div>
      </div>
    </div>
    <!-- Detail Content End -->

    <!-- Map Section Start -->
    <div class="">
      <div class="container py-5">
        <div class="col-lg-12">
          <div class="h-100 rounded">
            <iframe
              class="rounded w-100"
              style="height: 400px"
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387191.33750346623!2d-73.97968099999999!3d40.6974881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1694259649153!5m2!1sen!2sbd"
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>
      </div>
    </div>
    <!-- Map Section End -->

    <!-- Detail Image Start -->
    <div class="container">
      <div class="col-lg-12">
      </div>
    </div>
    <!-- Detail Image End -->
    
    <!-- Detail Image Start -->
	    <div class="container">
	      <div class="card content--card">
	        <img src="/images/upload/${photo.uploadFileName}"/>
	      </div>       
	    </div>
    <div class="d-flex">
			<form action="/delete/${product.id}" method="post">
				<button class="btn btn-danger">삭제</button>
			</form>
			<form action="/update/${product.id}" method="get">
				<button class="btn btn-warning updateBtn">수정</button>
				<input type="hidden" name="productId" value="${product.id}">
			</form>
		</div>
    <!-- Detail Image End -->

    <div class="container" style="margin-top: 4%">
      <hr />
    </div>

    <!-- review Section Start -->
    <div class="container">
    <section>
      <div class="row d-flex justify-content-center">
        <div class="col-md-10 col-xl-8 text-center">
          <h3 class="mb-4">Review</h3>
        </div>
      </div>

      <div class="row text-center">
        <div class="col-md-4 mb-5 mb-md-0">
          <div class="d-flex justify-content-center mb-4">
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(1).webp"
              class="rounded-circle shadow-1-strong"
              width="150"
              height="150"
            />
          </div>
                             
          <h5 class="mb-3">Maria Smantha</h5>
          <h6 class="text-primary mb-3">11h ago</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>Lorem ipsum dolor sit amet,
            consectetur adipisicing elit. Quod eos id officiis hic tenetur quae
            quaerat ad velit ab hic tenetur.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star-half-alt fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
        <div class="col-md-4 mb-5 mb-md-0">
          <div class="d-flex justify-content-center mb-4">
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(2).webp"
              class="rounded-circle shadow-1-strong"
              width="150"
              height="150"
            />
          </div>
          <h5 class="mb-3">Lisa Cudrow</h5>
          <h6 class="text-primary mb-3">2023-12-22</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>Ut enim ad minima veniam, quis
            nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut
            aliquid commodi.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
        <div class="col-md-4 mb-0">
          <div class="d-flex justify-content-center mb-4">
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(9).webp"
              class="rounded-circle shadow-1-strong"
              width="150"
              height="150"
            />
          </div>
          <h5 class="mb-3">John Smith</h5>
          <h6 class="text-primary mb-3">2023-10-11</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>At vero eos et accusamus et
            iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
            deleniti atque corrupti.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="far fa-star fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
      </div>
    </section>
  </div>
    <!-- review Section End -->
<script>
$(document).ready(function(){
	$('.carousel-item').bxSlider({
		auto: true,
		speed: 500,
		pause: 4000,
		mode:'fade',
		autoControls: true,
		pager:true,
	});
});



</script>
	    
	<!-- footer -->
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
        
        
        
        
        
  