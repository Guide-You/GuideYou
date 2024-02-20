<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


  <body >


    <!-- Hero Start -->
    <div class="container-fluid mb-5 hero-header">
      <div class="container py-5">
        <div
          id="carouselExampleSlidesOnly"
          class="carousel slide"
          data-ride="carousel"
          data-interval="2000"
        >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                class="d-block w-100"
                src="img/banner1.png"
                alt="First slide"
              />
            </div>
            <div class="carousel-item">
              <img
                class="d-block w-100"
                src="img/banner2.png"
                alt="Second slide"
              />
            </div>
            <div class="carousel-item">
              <img
                class="d-block w-100"
                src="img/banner3.png"
                alt="Third slide"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Hero End -->
    <section class="sc-a37b6b4d-0 iVnkhP">
      <div class="sc-a37b6b4d-1 bBhtyX">
        <input
          maxlength="20"
          class="sc-a37b6b4d-2 cpWeqo"
          value=""
          placeholder="🔍 어느 도시로 떠나시나요?"
        />
      </div>
    </section>
    <!-- Featurs Section Start -->
    <div class="container-fluid featurs py-5">
      <div class="container py-5">
        <div class="col-lg-4 text-start">
          <h1>어디가유?</h1>
        </div>
        <div>
          <button class="city-button">
            <img src="img/main-seoul.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">서울</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-busan.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">부산</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-incheon.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">인천</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-daegu.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">대구</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-daejeon.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">대전</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-gwangju.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">광주</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-gyeonggi-do.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">경기도</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-chungcheong-do.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">충청도</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-jeolla-do.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">전라도</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-gyeongsang-do.jpeg" class="city-image" />
            <div class="city-info">
              <p class="city-name">경상도</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-gangwon-do.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">강원도</p>
            </div>
          </button>
          <button class="city-button">
            <img src="img/main-jeju.jpg" class="city-image" />
            <div class="city-info">
              <p class="city-name">제주도</p>
            </div>
          </button>
        </div>
      </div>
    </div>

    <!-- Featurs Section End -->

    <!-- Vesitable Shop Start-->
    <div class="container-fluid vesitable py-5">
      <div class="container py-5">
        <h1 class="mb-0">최근 인기 여행지</h1>
        <div class="owl-carousel vegetable-carousel justify-content-center">
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-busan.jpg"
                class="img-fluid w-100 rounded-top top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              부산
            </div>
          </div>
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-seoul.jpg"
                class="img-fluid w-100 rounded-top top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              서울
            </div>
          </div>
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-jeju.jpg"
                class="img-fluid w-100 rounded-top bg-light top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              제주도
            </div>
          </div>
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-incheon.jpg"
                class="img-fluid w-100 rounded-top top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              인천
            </div>
          </div>
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-gyeonggi-do.jpg"
                class="img-fluid w-100 rounded-top top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              경기도
            </div>
          </div>
          <div
            class="border border-primary rounded position-relative vesitable-item"
          >
            <div class="vesitable-img">
              <img
                src="img/main-gangwon-do.jpg"
                class="img-fluid w-100 rounded-top top-city"
                alt=""
              />
            </div>
            <div
              class="text-white bg-primary px-3 py-1 rounded position-absolute"
              style="top: 10px; right: 10px"
            >
              강원도
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Vesitable Shop End -->

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite">
      <div class="container">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>인기 플랜</h1>
            </div>

            <div class="tab-content">
              <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                  <div class="col-lg-12">
                    <div class="row g-4">
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            서울
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i>
                                주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            제주도
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i>
                                주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            화성
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i
                                >주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            강릉
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i
                                >주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            강원도
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i
                                >주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            부산
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i>
                                주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            부산
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">
                                $4.99 / kg
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i>
                                주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/main-seoul.jpg"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            서울
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>서울 당일치기</h4>
                            <p>
                              Lorem ipsum dolor sit amet consectetur adipisicing
                              elit sed do eiusmod te incididunt
                            </p>
                            <div
                              class="d-flex justify-content-between flex-lg-wrap"
                            >
                              <p class="text-dark fs-5 fw-bold mb-0">8,000원</p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i
                                >주문하기</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Banner Section Start-->
            <div
              class="container-fluid banner bg-secondary my-5 banner-promotion"
            >
              <div class="row g-4">
                <img src="img/banner-promotion.png" />
              </div>
            </div>
            <!-- Banner Section End -->

            <!-- Fact Start -->
            <div class="container-fluid py-5">
              <div class="container">
                <div class="bg-light p-5 rounded">
                  <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-6 col-xl-3">
                      <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>여행 플랜 수</h4>
                        <h1>1,963개</h1>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-3">
                      <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>이용자 수</h4>
                        <h1>123명</h1>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-3">
                      <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>리뷰 만족도</h4>
                        <h1>87%</h1>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-3">
                      <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>총 후기 수</h4>
                        <h1>1,003개</h1>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Fact Start -->

            <!-- Tastimonial Start -->
            <div class="container-fluid testimonial py-5">
              <div class="container py-5">
                <div class="testimonial-header text-center">
                  <h1 class="display-5 mb-5 text-dark">공지사항</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                  <div
                    class="testimonial-item img-border-radius bg-light rounded p-4"
                  >
                    <div class="position-relative">
                      <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">
                          [이벤트] KTX 서울-부산 반값으로 가자!
                        </p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="testimonial-item img-border-radius bg-light rounded p-4"
                  >
                    <div class="position-relative">
                      <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">
                          [이벤트] KTX 서울-부산 반값으로 가자!
                        </p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="testimonial-item img-border-radius bg-light rounded p-4"
                  >
                    <div class="position-relative">
                      <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">
                          [멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중
                        </p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="testimonial-item img-border-radius bg-light rounded p-4"
                  >
                    <div class="position-relative">
                      <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">
                          [멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중
                        </p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="testimonial-item img-border-radius bg-light rounded p-4"
                  >
                    <div class="position-relative">
                      <div class="mb-4 pb-4 border-bottom border-secondary">
                        <p class="mb-0">
                          [멤버쉽] 프리미엄 멤버쉽 10% 할인 진행중
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Tastimonial End -->
          </div>
        </div>
      </div>
    </div>
  </body>
  
  	
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
  
  
  
