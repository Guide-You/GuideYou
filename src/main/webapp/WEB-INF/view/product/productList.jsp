<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

  <body >

    <!-- Search Start -->
    <section class="sc-a37b6b4d-0 iVnkhP" >
      <div class="sc-a37b6b4d-1 bBhtyX">
        <input
          maxlength="20"
          class="sc-a37b6b4d-2 cpWeqo"
          value=""
          placeholder="🔍 어느 도시로 떠나시나요?"
        />
      </div>
    </section>
    <!-- Search End -->

    <!-- City Photo Start -->
    <div class="container-fluid mb-5">
      <div class="container py-5">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              class="d-block w-100"
              src="img/banner1.png"
              alt="First slide"
            />
          </div>
        </div>
      </div>
    </div>
    <!-- City Photo End -->

    <!-- Featurs Section Start -->
    <div class="">
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

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite">
      <div class="container">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>부산 가유</h1>
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
                            부산
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>부산 1박2일</h4>
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
                      <div class="col-12">
                        <div
                          class="pagination d-flex justify-content-center mt-5"
                        >
                          <a href="#" class="rounded">&laquo;</a>
                          <a href="#" class="active rounded">1</a>
                          <a href="#" class="rounded">2</a>
                          <a href="#" class="rounded">3</a>
                          <a href="#" class="rounded">4</a>
                          <a href="#" class="rounded">5</a>
                          <a href="#" class="rounded">6</a>
                          <a href="#" class="rounded">&raquo;</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  
	
<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
