<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- header -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="container-fluid contact py-5">
    <div class="container py-5">
        <div class="p-5 bg-light rounded">
            <div class="row g-4">
                <!-- Payment Start -->
                <div class="container">
                    <div class="row">
                        <div class="table-responsive">
                            <div>
                                <!--  ************************여기서 부터 작성************************  -->
                                <div class="loginAll">
                                    <a href="/login/kakao" class="loginBtn"> 
                                        <img src="/img/login_kakao.png" alt="Kakao"> 
                                    </a> 
                                    <a href="/login/google" class="loginBtn"> 
                                        <img src="/img/login_google.png" alt="Google">
                                    </a> 
                                    <a href="/login/naver" class="loginBtn"> 
                                        <img src="/img/login_naver.png" alt="Naver"> 
                                    </a>
                                </div>
                                <!-- ************************여기까지 작성************************  -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
