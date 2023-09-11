<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="kr">
<style>
body {
  position: relative;
}
</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta charset="utf-8">
    <title>HELF</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
    
    <!-- 데이트피커 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-3 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">REGISTER</h1>
                    <a href="" class="h5 text-white">회원가입</a>
                </div>
            </div>
        </div>
    </div>
	<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
		<div class="container">
			<form method="post" enctype="multipart/form-data" action="trainer2">
				<div class="row" >
					<div class="section-title text-start position-relative pb-3 mb-1" style="max-width: 600px;">
		                <h1 class="fw-bold text-primary text-uppercase">트레이너 회원가입</h1>
		            </div>
				</div>
				<div>
			        <div class="row mt-4">
			            <div>
						    <div class="col-sm-6 m-1">
								<h3 class="text-primary" style="display: inline-block;">경력</h3>
							</div>
						</div>
			            <div class="col-sm-6 input-wrapper">
			                <input type="text" class="form-control bg-light border-0" id="trainer-career" name="careerNames" placeholder="경력 이름을 입력하세요." style="height: 55px; width: 620px;" />
			            </div>
			            <div class="col-sm-6">
			                <div class="d-flex">
			                    <input type="text" class="form-control bg-light border-0 mr-2" id="datepicker1" name="careerStartDates" placeholder="경력 시작일" style="height: 55px; width: 250px;" />
			                    <strong style="margin-left: 15px; margin-right: 20px; margin-top: 15px; font-size: 20px;">~</strong>
			                    <input type="text" class="form-control bg-light border-0" id="datepicker2" name="careerEndDates" placeholder="경력 종료일" style="height: 55px; width: 250px;" />
			                </div>
			            </div>
			        </div>
			        <div id="career-box">
			            <!-- 추가된 경력 정보가 여기 표시됨. -->
			        </div>
			        <div>
			            <button class="btn btn-primary m-3 btn-sm" type="button" id="btn-add-field">경력 추가</button>
			        </div>
			    </div>
				<hr>
				<div class="row mt-4" >
					<div>
					    <div class="col-sm-6 m-1">
							<h3 class="text-primary" style="display: inline-block;">자기소개</h3>
							<input type='file' id="photofile" name="photofile" style="display: none;"/>
							 <button style="margin-left: 30px;" class="btn btn-primary text-white mb-3 btn-sm" type="button" id="customFileButton" class="your-custom-styles">프로필사진 업로드</button>
						</div>
					</div>
					    <div class="col-sm-6 input-wrapper">
					         <input type="text" class="form-control bg-light border-0" id=""  placeholder="자기소개를 입력하세요." style="height: 300px; width: 1280px;" />
					    	 <div class="check_font" id="user-id_check"></div>
					    </div>
				</div>
				
			    <div class="col-13 mt-4" >
			        <button id="user-button-register" class="btn btn-dark w-100 py-3" type="submit">가입하기</button>
			    </div>
			</form>   
		</div>
	</div>


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
    
    
   
    
    <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-8 col-md-6">
                    <div class="row gx-5">
                        <div class="col-lg-4 col-md-12 pt-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Get In Touch</h3>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-geo-alt text-primary me-2"></i>
                                <p class="mb-0">123 Street, New York, USA</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-envelope-open text-primary me-2"></i>
                                <p class="mb-0">info@example.com</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-telephone text-primary me-2"></i>
                                <p class="mb-0">+012 345 67890</p>
                            </div>
                            <div class="d-flex mt-4">
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Quick Links</h3>
                            </div>
                            <div class="link-animated d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Popular Links</h3>
                            </div>
                            <div class="link-animated d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid text-white" style="background: #061429;">
        <div class="container text-center">
            <div class="row justify-content-end">
                <div class="col-lg-8 col-md-6">
                    <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                        <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. 
						
						<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
  
   
<script>
	
	// 경력 데이트피커 (시작일)
      $(function(){
         $('#datepicker1').datepicker();
      })
      
	// 경력 데이트피커 (종료일)
      $(function(){
          $('#datepicker2').datepicker();
      })
       
   	// 데이트피커 한글적용
    $(document).ready(function(){               
	    $.datepicker.setDefaults({
	   	dateFormat: "yy-mm-dd",
	    closeText: "닫기",
	    currentText: "오늘",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    weekHeader: "주",
	    yearSuffix: '년'
	    });    
	 });
	
	/* 경력 추가 js  */
$(function() {
    let careerCounter = 0;

    // 경력 추가 버튼에 이벤트 핸들러 등록하기
    $('#btn-add-field').click(function () {
        // 추가할 HTML 컨텐츠를 정의한다.
        let content = 
            `<div class="row mt-4">
                <div class="col-sm-6 input-wrapper">
                    <input type="text" class="form-control bg-light border-0" name="careerNames${careerCounter}" placeholder="경력 이름을 입력하세요." style="height: 55px; width: 620px;" />
                </div>
                <div class="col-sm-6">
                    <div class="d-flex">
                        <input type="text" class="form-control bg-light border-0 mr-2 datepicker-start" name="careerStartDates${careerCounter}" placeholder="경력 시작일" style="height: 55px; width: 250px;" />
                        <strong style="margin-left: 15px; margin-right: 20px; margin-top: 15px; font-size: 20px;">~</strong>
                        <input type="text" class="form-control bg-light border-0 datepicker-end" name="careerEndDates${careerCounter}" placeholder="경력 종료일" style="height: 55px; width: 250px;" />
                        <button class="btn btn-danger btn-sm ml-2" type="button" onclick="$(this).closest('.row').remove()" style="width: 30px; width: 80px;">삭제</button>
                    </div>
                </div>
            </div>`;
        // html 컨텐츠가 추가될 부모 엘리먼트를 검색한다.
        $('#career-box').append(content);

        // 추가된 입력 필드에 datepicker 적용
        $(`.datepicker-start[name="careerStartDates${careerCounter}"]`).datepicker();
        $(`.datepicker-end[name="careerEndDates${careerCounter}"]`).datepicker();

        // Career counter 증가
        careerCounter++;
    });

    // 사진 업로드 버튼 이벤트 핸들러
    $('#customFileButton').click(function () {
        $('#photofile').click();
    });

    $('#photofile').change(function() {
        var fileName = $(this).val().split('\\').pop();
        $('#customFileButton').text(fileName ? fileName : '파일 추가');
    });

    // form 제출 시 유효성 검사
    $('form').submit(function(event) {
        let isValid = true;

        // 자기소개, 프로필 사진 업로드 항목 검사 
        if ($('#selfIntroduction').val() === '') {
            alert('자기소개를 입력해주세요.');
            isValid = false;
        }

        if ($('#photofile').val() === '') {
            alert('프로필 사진을 업로드해주세요.');
            isValid = false;
        }

        // 경력 항목 검사
        $('.row.mt-4').each(function() {
            const careerNames = $(this).find('input[name^="careerNames"]').val();
            const careerStartDates = $(this).find('input[name^="careerStartDates"]').val();
            const careerEndDates = $(this).find('input[name^="careerEndDates"]').val();

            if (careerNames === '' || careerStartDates === '' || careerEndDates === '') {
                alert('모든 경력 항목을 입력해주세요.');
                isValid = false;
            }
        });

        // 유효성 검사 실패 시 form 제출 방지
        if (!isValid) {
            event.preventDefault();
        }
    });
});      

	
	
</script>
	
</body>
</html>