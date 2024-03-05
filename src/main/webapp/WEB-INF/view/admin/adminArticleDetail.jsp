<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 관리자 faq,notice 글 상세 view -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">

              </div>
              <div class="col-lg-6">
                  <h4 class="fw-bold mb-3">글제목</h4>
                  <p class="mb-3">Category: qna,faq</p>
                  <p class="fw-bold mb-3">관리자</p>
                  <p class="mb-4">작성시간</p>
              </div>
              
              <div class="col-lg-12">
                  <nav>
                      <div class="nav nav-tabs mb-3">
                          <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                              id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                              aria-controls="nav-about" aria-selected="true">상세내용</button>
                         
                         <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                              id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                              aria-controls="nav-mission" aria-selected="false">댓글 리스트</button>
                      </div>
                  </nav>
                  <div class="tab-content mb-5">
                      <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                          <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.
                              Susp endisse detail view</p>
                          <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic
                              icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                      </div>
                      <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                          <div class="d-flex">
                              <div class="">
                               <p class="mb-2" style="font-size: 14px;">댓글 등록 날짜</p>
                                  <div class="d-flex justify-content-between">
                                      <h5>writer_id</h5>
                                  </div>
                                  <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic
                                      words etc. comment content</p>
                              </div>
                          </div>
                          <div class="d-flex">
                              <div class="">
                                  <p class="mb-2" style="font-size: 14px;">댓글등록날짜</p>
                                    <div class="d-flex justify-content-between">
                                        <h5>writer_id</h5>
                                    </div>
                                    <p class="text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic
                                        words etc. comment content</p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="nav-vision" role="tabpanel">
                            <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                amet diam et eos labore. 3</p>
                            <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                Clita erat ipsum et lorem et sit</p>
                        </div>
                    </div>
                </div>
                <form action="/company/testDetail" method="post" id="insertComment">
                     <h4 class="mb-5 fw-bold">댓글을 남겨주세요</h4>
                     <div class="row g-4">
                         <div class="col-lg-6">
                             <div class="border-bottom rounded">
                                 <input type="text" class="form-control border-0 me-4" placeholder="UserId*">
                             </div>
                         </div>

                         <div class="col-lg-12">
                             <div class="border-bottom rounded my-4">
                                 <textarea name="" id="" class="form-control border-0" cols="30" rows="8" placeholder="댓글내용 *" spellcheck="false"></textarea>
                             </div>
                         </div>
                         <div class="col-lg-12">
                             <div class="d-flex justify-content-between py-3 mb-5">

                                 </div>
                                 <a href="#" class="btn border border-secondary text-primary rounded-pill px-4 py-3" type="submit" value="댓글등록">댓글등록</a>
                             </div>
                         </div>
                     </div>
                   </form>
                </div>
              </div>
<div class="d-flex justify-content-center my-4">
    <a href="/company/testList" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">게시글 목록</a>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>