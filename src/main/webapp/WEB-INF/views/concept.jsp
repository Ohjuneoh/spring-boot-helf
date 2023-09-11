<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">
<style>

</style>
<head>
    <meta charset="utf-8">
    <title>HELF 소개</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <jsp:include page="common/topnavbar.jsp"/>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0">
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">HELF 소개</h1>
                    <a href="/home" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">Concept</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


    <!-- Concept - 소개1 Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="section-title position-relative pb-3 mb-5">
                        <h5 class="fw-bold text-primary text-uppercase">HELF 소개</h5>
                        <h1 class="mb-0">24시간 연중무휴 전지점 통합회원권</h1>
                    </div>
                    <p class="mb-4">
                    	HELF 헬스장은 다른 헬스장과는 다릅니다. 자유롭고 안전한 헬스장 HELF를 이용해보세요!
					</p>
                    <div class="row g-0 mb-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>24시간 365일 연중무휴로 <br> &nbsp; &nbsp; &nbsp; 원하는 시간에 언제든지</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>전지점 프리패스 통합 회원권으로<br> &nbsp; &nbsp; &nbsp; &nbsp;원하는 지역 어디든지</h5>
                        </div>
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>합리적인 회원권 금액으로<br> &nbsp; &nbsp; &nbsp; &nbsp; 최상의 혜택 제공</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>야간에도 안전한 보안경비 시스템</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="/resources/img/소개1.jpg" style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Concept - 소개1 End -->
    
    <!-- Concept - 소개2 Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-7 order-lg-2">
                    <div class="section-title position-relative pb-3 mb-5">
                        <h5 class="fw-bold text-primary text-uppercase">HELF 소개</h5>
                        <h1 class="mb-0">트렌디한 인테리어</h1>
                    </div>
                    <p class="mb-4">
                    	고급스러운 헬스장 HELF, 남녀노소가 만족할 수 있는 환경을 갖추었습니다.
					</p>
                    <div class="row g-0 mb-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>운동에 집중할 수 있도록<br> &nbsp; &nbsp; &nbsp; 낮은 조도의 조명 설치</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>운동을 즐길 수 있도록<br> &nbsp; &nbsp; &nbsp; 고급스럽고 세련된 공간 연출</h5>
                        </div>
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>최고급 음향 시설, 트렌디한 인테리어</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>항상 청결한 기구와 시설</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 order-lg-1" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="/resources/img/소개2.jpg" style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Concept - 소개2 End -->
    
    <!-- Concept - 소개3 Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="section-title position-relative pb-3 mb-5">
                        <h5 class="fw-bold text-primary text-uppercase">HELF 소개</h5>
                        <h1 class="mb-0">5성급 호텔 운동머신</h1>
                    </div>
                    <p class="mb-4">
                    	국내 최초, 미국에서 최신&최고의 기구들을 가져왔습니다. HELF 헬스장에서는 퀄리티 높은 운동을 할 수 있습니다. 
					</p>
                    <div class="row g-0 mb-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>최신 트레이닝 장비들로<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 운동 퀄리티 상승</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>전문성을 갖춘 체계화된 운동 가능</h5>
                        </div>
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>Matrix, Lifefitness, Hammer <br>&nbsp; &nbsp; &nbsp; &nbsp; strength, Technogym.</h5>
                            <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>전세계 최고급 장비 세팅</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="/resources/img/소개3.jpg" style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Concept - 소개3 End -->
    
    <!-- Concept - 소개4 Start -->
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-7 order-lg-2">
                <div class="section-title position-relative pb-3 mb-5">
                    <h5 class="fw-bold text-primary text-uppercase">HELF 소개</h5>
                    <h1 class="mb-0">무료 Group P.T</h1>
                </div>
                <p class="mb-4">
                    별도의 비용없이 GX프로그램 무료로 사용가능한 착한 헬스장 HEFL입니다.
                </p>
                <div class="row g-0 mb-3">
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                        <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>월 100회 이상의 다양한 <br> &nbsp; &nbsp; &nbsp; 수업 컨텐츠 제공</h5>
                        <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>초보자도 운동에 쉽게<br> &nbsp; &nbsp; &nbsp; 참여할 수 있는 컨텐츠 제공</h5>
                    </div>
                    <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                        <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>반복적인 학습 시스템으로<br> &nbsp; &nbsp; &nbsp; 효과적인 운동</h5>
                        <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>혼자 하는 운동이 아닌 함께<br> &nbsp; &nbsp; &nbsp; 즐기는 그룹 운동</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 order-lg-1" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="/resources/img/소개4.jpg" style="object-fit: cover;">
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Concept - 소개4 End -->

	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
</body>

</html>