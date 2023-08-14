<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
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
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<!-- 위에 모든 페이지까지 공통부분 건들 x -->
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp" />
    <!-- Topnavbar End -->



    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="수업"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">REGISTER</h1>
                    <a href="" class="h5 text-white">수업 등록</a>
                </div>
            </div>
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
    <!-- Lesson Category Start  -->
    </div>
    <div class="container-fluid py-1 wow fadeInUp " data-wow-delay="0.1s">
        <div class="container py-5">
        	<div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
	        	<div class="container ">
	            	<div class="row g-1" >
					</div>
				</div>
			</div>
        </div>
    </div>
    <!-- Lesson Category End -->
    <!-- Lesson Register Form Start  -->
    <div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
        <div class="container py-5">
		 	<form class="" id="group-lesson-form" method="post" action="/group-lesson/registration">
		    	<div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
	        		<div class="container ">
	            		<div class="row g-1" >
                    		<div class="section-title position-relative pb-3 mb-5">
                        		<h5 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">수업개설</h5>
                        		<h1 class="mb-0" style="font-size: 15px;" >내용을 입력해주세요</h1>
			               	</div>
				    	</div>
				 	</div>
				</div>
				<div class="row g-1">
				    <div class="col-6">
				        <input type="text" class="form-control bg-light border-0" name="name" placeholder="수업명" style="height: 55px;">
				    </div>
					<div class="col-6">
						<input type="text" class="form-control bg-light border-0" name="quota" placeholder="총 인원" style="height: 55px;">
					</div>
				    <div class="col-6">
				    	<input type="text" class="form-control bg-light border-0"  id="date" name="date" style="height: 55px;" placeholder="수업날짜">
				    </div>
					<div class="col-6">
					    <select  class="form-select bg-light border-0" name="time" style="height: 55px;">
					      <option value=""  >시간</option>
							<option value="10~12" class="form-control bg-light border-0" >10:00 ~ 12:00</option>
							<option value="13~15" class="form-control bg-light border-0" >13:00 ~ 15:00</option>
							<option value="15~17" class="form-control bg-light border-0" >15:00 ~ 17:00</option>
							<option value="17~19" class="form-control bg-light border-0" >17:00 ~ 19:00</option>
							<option value="20~22" class="form-control bg-light border-0" >20:00 ~ 22:00</option>
					    </select>
					</div>
					<div class="col-12">
					  <textarea class="form-control bg-light border-0" name="description" style="height: 300px;" placeholder="내용"></textarea>
					</div>
				</div>
				<div>
					<button type="button" id="btn-cancel" class=" btn btn-danger mt-1 float-end" style="margin-left: 5px;">취소</button>
					<button type="submit" class=" btn btn-primary mt-1 float-end">등록</button>
				</div>
			</form>
        </div>
    </div>
    <!-- Lesson Register Form End  -->
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
    
<script>
$( function() {
    $("#date").datepicker({
   		dateFormat: 'yy/mm/dd'
    });
	$("#btn-cancel").click(function(event){
		location.href = "/group-lesson/list";
	});
});


	

</script>
    
    
</body>

</html>