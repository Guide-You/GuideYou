<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

		
        <link rel="stylesheet" href="/company/css/company.css">

        

    <div class="container">
        <div id="carousel-header" class="carousel slide" data-ride="carousel" data-interval="8000">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="/company/img/com-main.jpg" alt="">
                </div>
            </div>
        </div>

        <div id="about" class="content-block content-block-cyan">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <h1>GUIDE YOU</h1>
                        <p>
                            우리는 여행의 모든 순간을 신중하게 계획하고, 현지 문화 체험까지 세심하게 배려합니다. 
                            여행은 단순히 목적지에 가는 것이 아니라, 
                            새로운 세계를 발견하고 삶을 더 풍요롭게 만드는 여정입니다. </p>

						<h5>당신의 꿈을 현실로 만들어 드립니다. 우리와 함께 새로운 여행의 시작을 경험하세요.</h5>
                       
                    </div>
                </div>
            </div>
        </div>


        <div id="projects" class="recent-projects">
            

            <div class="recent-projects-content content-block-gray">
                <div id="owl-example" class="owl-carousel">
                    <div>
                        <img src="/company/img/com-mid1.jpg" alt="" width="228" height="228">
                        <a href="#"></a>
                    </div>
                    <div>
                        <img src="/company/img/recent2.jpg" alt="" width="228" height="228">
                    </div>
                    <div>
                        <img src="/company/img/com-mid3.jpg" alt="" width="228" height="228">
                        
                    </div>
                    <div>
                        <img src="/company/img/com-mid4.jpg" alt="" width="228" height="228">
                    </div>
                    <div>
                        <img src="/company/img/recent5.jpg" alt="" width="228" height="228">
                    </div>
                    <div>
                        <img src="/company/img/com-mid5.jpg" alt="" width="228" height="228">
                    </div>
                    <div>
                        <img src="/company/img/com-mid2.jpg" alt="" width="228" height="228" >
                    </div>
                </div>
            </div>
        </div><!-- /.recent-projects -->

        <div id="blog" class="content-block content-block-gray">
            <div class="container">
                <header class="block-heading cleafix">
                    <h1>최근 인기 여행지</h1>
                </header>
                
                <section class="block-body">
                    <div class="row">
                        <div class="col-sm-4 blog-post">
                        <img src="/company/img/com-bot1.jpg" alt="Design Yout Trip" width="257" height="183">
                            <a href="#"><h2>Design Your Trip</h2></a>
                        </div>
                        <div class="col-sm-4 blog-post">
                            <img src="/company/img/com-bot2.jpg" alt="Spring Is Comming">
                            <a href="#"><h2>Spring Is Comming</h2></a>
                        </div>
                        <div class="col-sm-4 blog-post">
                            <img src="/company/img/road-1000x600.jpg" alt="The travellation" width="257" height="183">
                            <a href="#"><h2>The travellation</h2></a>
                        </div>
                    </div>
                </section>
            </div><!--/container-->
        </div><!-- /.content-block content-blog-gray -->
	</div>
        <script src="js/jquery-2.1.3.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
        <!-- Include js plugin -->
        <script src="owl-carousel/owl.carousel.js"></script>
        <script src="js/main.js"></script>

    </body>



<!-- footer -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>​