<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 관리자 faq,notice 글 상세 view -->
<!-- <div class="container-fluid py-5 mt-5"> -->
<!--     <div class="container py-5"> -->
        <div class="row g-4 mb-5">
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">

              </div>
              <div class="col-lg-6">
                  <h4 class="fw-bold mb-3">${board.title}</h4>
                  <p class="mb-3">${board.type}</p>  <!-- 관리자'만' 글을 써서 글쓴이는 필요없다 -->
                  <p class="mb-4"> 
                 	<fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd hh:mm:ss"/>
                  </p>
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
                          <p>${board.content}</p>
                      </div>
                      <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                          <div class="d-flex">
                              <div class="">
                               <p class="mb-2" style="font-size: 14px;">
                               <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd hh:mm:ss"/>
                               </p>
                                  <div class="d-flex justify-content-between">
                                      <h5>${comment.id}</h5>
                                  </div>
                                  <p>${comment.content}</p>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <form action="/admin/adminArticleDetail" method="post" id="insertComment">
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