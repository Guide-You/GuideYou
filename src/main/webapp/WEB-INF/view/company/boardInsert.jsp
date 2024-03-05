<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;">
                                <h1 class="text-primary">글쓰기</h1>
                                <p class="mb-4"></a></p>
                            </div>
                        </div>
                       
                        <div class="col-lg-12">
                            <form action="/company/testInsert" method="post" id="insert">
                                <input type="text" name="writerId" class="w-100 form-control border-0 py-3 mb-4" placeholder="작성자">
                                <input type="text" name="type" class="w-100 form-control border-0 py-3 mb-4" placeholder="QnA">
                                <input type="text" name="title" class="w-100 form-control border-0 py-3 mb-4" placeholder="제목을 입력해주세요">
                                <textarea class="w-100 form-control border-0 mb-4" name="content" rows="5" cols="10" placeholder="내용을 입력해주세요"></textarea>

                                <div class="col-lg-2 row-sm-1">
                                <div>
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit">  취소</button>
                               
                                </div>    
                                  
                                <div class="col-lg-2 row-sm-1">
                                
                                
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" value="등록">등록하기</button>
                                
                                
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