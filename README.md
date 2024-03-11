<div align=center>

  ![가유 로고](로고 자리)

</div>

<h1> GUIDE_YOU</h1><br>
여행 플랜 판매 웹사이트


<br>
<h1> ⏱ 프로젝트 기간</h1><br>
24.02.13~24.03.07(15일)


<br>
<h1>💶 프로젝트 소개</h1><br>
여행 플랜을 짜기 힘든 사람들과<br>
여행 플랜을 공유하고 싶은 사람들을 위한<br>
여행 판매 플랫폼

<br>
<h1>👫 멤버소개</h1><br>

|이름|직책|역할|
|:------|:------|:------|
|박경진|팀장|요구사항 정의, 와이어 프레임 및 스토리보드 작성, 발표 PPT 제작,<br> 화면 구현, 결제 API 이용 결제·환불 기능 구현, 리뷰 등록, 발표|
|최장호|팀원|데이터베이스 설계, GIT 관리,  OAUTH2 API 로그인, 카카오 MAP API 구현, MYPAGE-프로필 수정, MYPAGE-상품 관련 목록, 찜 기능 구현|
|장명근|팀원|개발 보고서 작성, 관리자 페이지 화면 구현, 메인 랜딩 페이지 기능 구현 ,상품(플랜) 기능 구현, 관리자 대시보드, 관리자 회원 및 전체 상품 리스트, 전체 목록 페이징|
|김수현|팀원|스토리보드 작성, 개발 보고서 작성, 관리자 페이지 화면 구현, CS관련 게시판, 관리자 cs 관련 게시판 , 약관안내|
<br>
<h1>🌟프로젝트 메인 페이지 소개</h1><br>

![가유 메인 화면](메인 랜딩 페이지 사진)

<br>
<h1> 🎱프로젝트 결과</h1><br>

-[GUIDE_YOU_결과보고서](결과 보고서 pdf파일): 개발한 서비스의 결과 보고서 입니다.<br>
-[GUIDE_YOU_발표PPT](발표 PPT 파일): 개발한 서비스의 발표 PPT 입니다.

<br>
<h1> 🌝프로젝트 주요 개발 기능</h1><br>

**1. 유저**<br>
- OAUTH2 API 이용 회원가입
- MYPAGE
1) 프로필 수정
2) 결제 내역
2-1) 환불
3) 상품 UPLOAD 리스트
3-1) 상품 수정, 삭제
4) 구매한 상품 리스트
4-1) 리뷰 등록
5) 찜 목록
<br>
**2. 플랜**<br>
- 검색
- 플랜 리스트
- 찜 하기
- 플랜 등록
1) 사진 업로드
1-1) 단일 사진 업로드
1-2) 다중 사진 업로드
- 카카오 MAP API
1) MAP API 호출
2) MAP 검색
2-1) 검색 정보 출력
2-2) 검색 정보 클릭시 해당 좌표로 이동
3) MAP 마커
3-1) 마커 등록
3-2) 마커 삭제
<br>
**3. 고객센터**<br>
- QNA
- FAQ
- 공지사항
<br>
**4. 관리자**<br>
- 대시보드 
1)년/월/일 필터
2)판매 실적 통계
3)가입자 현황 및 관리
4)상품 및 현황
- 전체 회원 리스트 현황
- 판매 수익 현황
- 관리자 게시판
1)QNA
1) 관리자 댓글 기능
2)FAQ
3)공지사항
<br>
<h1> 🖥개발 환경</h1><br>


|구분|서비스 배포 환경|
|:------|:------|
|OS|Window10|
|Browser|Chrome 121.0.6167.161|
|WAS|Apache Tomcat 10|
|Framewoke|Spring Boot 3.1.8|
|Language|Java17 Javascript jsp|
|Tool|Spring tool Suite4<br> Git<br> GitHub<br> Figma<br> Bootstrap4|
|Library|Gson 2.8.6<br> json-simple 1.1.1 <br> jkarta.servlet.jsp.jstl 2.0.0<br> spring-boot-starter-data-jdbc <br>spring-boot-starter-web <br> mybatis-spring-boot-starter 3.0.3<br> lombok<br> mysql-connector-java|
|DBMS|MySQL 8.0.26<br> MyBatis 3.0.3|
|Communication|Slack|
<br>

------

🏗정보구조(IA : Information Architecture)<br>
![image](IA 정보구조 경로)
----
