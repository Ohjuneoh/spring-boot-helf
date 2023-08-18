<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Datetime Picker -->
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
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
                    <h1 class="display-4 text-white animated zoomIn">CONSULTATIONLIST</h1>
                    <a href="" class="h5 text-white">상담내역</a>
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
    </div>
    <div class="container-fluid mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container ">
            <div class="section-title text-start position-relative pb-3 mb-5" style="max-width: 600px;">
                <h1 class="fw-bold text-primary text-uppercase">상담신청 목록</h1>
                <h5 class="mb-0">목록을 확인하세요</h5>
            </div>
            <div class="row g-0">
	            <c:forEach var="consultation" items="${consultations}">
	                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
	                    <div class="bg-white rounded shadow position-relative m-2" style="z-index: 1;">
	                        <div class="border-bottom py-4 px-5 mb-4">
	                            <h5 class="text-primary mb-2"></h5>
	                            <h4 class="text-uppercase">${consultation.user.name}</h4>
	                        </div>
	                        <div class="p-5 pt-0">
	                            
	                            <div class="d-flex justify-content-between mb-3"><strong>상태 :</strong><span>${consultation.consultations.consultationStatus}</span><i class="fa fa-bell text-primary pt-1 text-end"></i></div>
	                            <div class="d-flex justify-content-between mb-3"><strong>신청일 :</strong><span><fmt:formatDate value="${consultation.consultations.applicationDate}" pattern="yyyy-MM-dd" /></span><i class="fa fa-calendar text-secondary pt-1 text-end"></i></div>
	                            <div class="d-flex justify-content-between mb-3"><strong>상담 요청일 :</strong><span><fmt:formatDate value="${consultation.consultations.requestDate}" pattern="yyyy-MM-dd" /></span><i class="fa fa-calendar text-primary pt-1 text-end"></i></div>
	                            <div class="d-flex justify-content-between mb-3"><strong>상담 요청시간 :</strong><span>${consultation.consultations.requestTime}</span><i class="fa fa-clock text-primary pt-1 text-end"></i></div>
	                            <div class="d-flex justify-content-center">
	                            <button type="button" class="btn btn-primary py-2 px-4 mt-5" data-bs-toggle="modal" data-bs-target="#myModal"  
	                            		data-username="${consultation.user.name}" data-userid="${consultation.user.id}" data-trainerno="${consultation.consultations.trainer.trainerNo}" data-mymembershipno="${consultation.consultations.myMembership.no}">예약</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>    
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLabel"><span id="modal-userName"></span>님 개인수업</h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input id="modal-userId" type="hidden" name="userId"/>
						<input id="modal-trainerNo" type="hidden" name="trainerNo"/>
						<input id="modal-myMembershipNo" type="hidden" name="myMembershipNo"/>
		        		<div class="row g-1">
								<div class="col-12">
									<h3 class="mb-2 mt-2 text-primary" >수업 내용</h3>	
									<textarea id="abnormalities" class="form-control bg-light border-0" name="abnormalities" style="height: 300px;"></textarea>
								</div>
								<div class="col-3">
							    	<div class="input-group">
							        	<span class="input-group-text bg-light border-0"><i class="bi bi-calendar-check-fill"></i></span>
							        	<input type="text" class="form-control bg-light border-0" name="date" id="date" style="height: 55px;" placeholder="수업일">
							    	</div>
								</div>
						    	<div class="col-3">
							    	<div class="input-group">
							        	<span class="input-group-text bg-light border-0"><i class="bi bi-alarm-fill"></i></span>
							        	<input type="text" class="form-control bg-light border-0" name="time" id="time" style="height: 55px;" placeholder="시간">
							    	</div>
								</div>
								<div class="col-6 text-end mt-2">
								    <button type="button" id="consultation-back" class="btn btn-secondary">이전</button>
								    <button type="button" id="next" class="btn btn-primary ">다음</button>
								</div>    
						</div>
					</form>		
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary">Save changes</button>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
    
<script>

$(document).ready(function() {
    $('#myModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);  
        var username = button.data('username');
        var userid = button.data('userid');
        var trainerno = button.data('trainerno');
        var mymembershipno = button.data('mymembershipno')
        $('#modal-userName').text(username); 
        $('#modal-userId').val(userid); 
        $('#modal-trainerNo').val(trainerno); 
        $('#modal-myMembershipNo').val(mymembershipno);
    });
});

$( function() {
    $("#date").datepicker({
   		dateFormat: 'yy/mm/dd'
    });
});

$( function() {
    $("#time").datetimepicker({
    	  datepicker:false,
    	  format:'H:i'
	});
});
</script>

    
</body>

</html>