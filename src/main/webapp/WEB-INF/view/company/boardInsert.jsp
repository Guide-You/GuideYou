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
                    <form action="/company/boardInsert" method="post" id="insert">
                    <select name="type" class="w-100 form-control border-0 py-3 mb-4">
							<option value="QnA" ${board.type == 'QnA' ? 'selected' : ''}>QnA</option>
							<option value="FAQ" ${board.type == 'FAQ' ? 'selected' : ''}>FAQ</option>
							<option value="Notice"
								${board.type == 'Notice' ? 'selected' : ''}>Notice</option>
						</select>
                        <input type="text" name="title" class="w-100 form-control border-0 py-3 mb-4" placeholder="제목을 입력해주세요">
                        <textarea class="w-100 form-control border-0 mb-4" name="content" rows="5" cols="10" placeholder="내용을 입력해주세요"></textarea>
                        <div class="row justify-content-end">
                            <div class="col-lg-4">
                                <div class="d-flex">
                                    <button class="btn form-control border-secondary py-3 bg-white text-primary me-3" type="submit">취소</button>
                                    <button class="btn form-control border-secondary py-3 bg-white text-primary" type="submit" value="등록">등록하기</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
