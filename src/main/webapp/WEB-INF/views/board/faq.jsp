<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1 class="display-4 text-white animated zoomIn">F&Q</h1>
                    <a href="" class="h5 text-white">자주 묻는 질문</a>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 자주묻는 질문 -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                <h5 class="fw-bold text-primary text-uppercase">자주 묻는 질문</h5>
                <h1 class="mb-0">HELF 고객님들이 자주묻는 질문들을 참고하세요.</h1>
            </div>
            
           
            
            <!-- 도움말 -->
			<div class="container mt-3">
				<h4>자주 찾는 도움말</h4><br>
				
				  <!-- 도움말 내용 -->
				  <div class="tab-content">
				  
				    <div id="all" class="container tab-pane active"><br>
					      <p>
							<div class="row g-5">
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.3s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-search"></i>
				                        </div>
				                        <h4 class="mb-3">블로그 아이디 변경 유의사항</h4>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.6s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-search"></i>
				                        </div>
				                        <h4 class="mb-3">Data Analytics</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-search"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-search"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                           <i class="bi bi-arrow-right"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                           <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                           <i class="bi bi-arrow-right"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-arrow-right"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				                <div class="col-lg-3 col-md-6 wow zoomIn" data-wow-delay="0.9s">
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="bi bi-arrow-right"></i>
				                        </div>
				                        <h4 class="mb-3">Web Development</h4>
				                        <p class="m-0">Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed</p>
				                        <a class="btn btn-lg btn-primary rounded" href="">
				                            <i class="bi bi-arrow-right"></i>
				                        </a>
				                    </div>
				                </div>
				            </div>
				    </div>
				    
				    <div id="menu1" class="container tab-pane fade"><br>
				      <h3>Menu 1</h3>
				      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				    </div>
				    
				    
				    <div id="menu2" class="container tab-pane fade"><br>
				      <h3>Menu 2</h3>
				      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				    </div>
				  </div>
			</div>
			
        </div>
    </div>
    <!-- Service End -->
	
	
	<!-- 자주묻는질문 모달창  -->
	<div class="modal fade" id="modal-faq" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" style="font-size: 19px; font-weight:bold; color:green" >
	        Q. 블로그 아이디 변경 유의사항(리다이렉트 기간 안내)
	      </div>
	      <div class="modal-footer">
	      <div class="boarder">
	      	A. 외부에 공유한 이전 주소 링크는 변경 시점으로부터 3개월간 리다이렉트됩니다.
	      </div>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
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


	<script type="text/javascript">
	let faqModal = new bootstrap.Modal("#modal-faq");
	
	$(".service-item").click(function() {
	
		faqModal.show();
	});


</script>


    
</body>

</html>