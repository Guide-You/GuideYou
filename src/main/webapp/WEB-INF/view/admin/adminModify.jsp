<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!--  관리자 글 수정-->
 <div class="container-fluid contact py-5">
     <div class="container py-5">
         <div class="p-5 bg-light rounded">
             <div class="row g-4">
                 <div class="col-12">
                     <div class="text-center mx-auto" style="max-width: 700px;">
                         <h1 class="text-primary">관리자 글수정</h1>
                         <p class="mb-4"></a></p>
                     </div>
                 </div>
                       
                        <div class="col-lg-12">
                            <form action="/admin/adminModify/${board.id}" method="post" id="updateById">
                                <input type="text" name="type" class="w-100 form-control border-0 py-3 mb-4" placeholder="${board.type}">
                                <input type="text" name="title" class="w-100 form-control border-0 py-3 mb-4" placeholder="${board.title}">
                                <textarea class="w-100 form-control border-0 mb-4" name="content" rows="5" cols="10" placeholder="내용을 입력해주세요">${board.content}</textarea>

                                <div class="col-lg-2 row-sm-1">
                                <div>
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit">취소</button>
                               
                                </div>    
                                  
                                <div class="col-lg-2 row-sm-1">
                                
                                
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" value="수정">수정하기</button>
                                
                                
                                <div class="col-lg-2 row-sm-1">
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="button" value="삭제">삭제하기</button>
                                </div>  <!-- a tag로 페이지 이동 -->
                        	</div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>