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
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">REGISTER</h1>
                    <a href="" class="h5 text-white">회원가입</a>
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
    
    <!-- 회원가입 카테고리 -->
    <div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" style="padding-bottom: 0px;">
    
        <div class="container py-5 ">
            <div class="row g-5" style="margin-bottom: 1px;">
                <div class="col-lg-7" > 
                    <div class="section-title position-relative pb-3 mb-5" id="register-form">
                        <h5 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">HELF FRIEND 회원가입</h5>
                        <h1 class="mb-0" style="font-size: 15px;">회원가입 유형을 선택해주세요. </h1>
                        <h1 class="mb-0" style="font-size: 15px;">회원정보는 동의 없이 공개 및 유출되지 않으며 개인정보 보호정책에 의해 보호 받고 있습니다.</h1>
                    </div>
                </div>
            </div>
 			<div class="row g-5">
        		<div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s" id="user-img">
            		<div class="team-item bg-light rounded overflow-hidden">
               		 	<div class="team-img position-relative overflow-hidden">
                    		<img class="img-fluid w-100" src="/resources/img/회원.jpg" alt="">
                		</div>
                		<div class="text-center py-4">
                    		<h4 class="text-primary" style="font-size:40px;">회원</h4>
                		</div>
            		</div>
        		</div>
       			 <div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s" id="trainer-img">
            		<div class="team-item bg-light rounded overflow-hidden">
                		<div class="team-img position-relative overflow-hidden">
                   			<img class="img-fluid w-100" src="/resources/img/트레이너.jpg" alt="">
                		</div>
               	 		<div class="text-center py-4">
                    		<h4 class="text-primary" style="font-size:40px;">트레이너</h4>
                		</div>
            		</div>
        		</div>
    		</div>
        </div>
    </div>
   
     
 
    <!-- 회원가입 폼  -->        
    <div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
        <div class="container py-5">
        	<!-- 회원 폼 -->
		   	<form action="/user/register/user" id="registerform-user" style="display: none" method="post">
				<div class="row g-3">
				<div>
					<h3>회원 회원가입</h3>
				</div>
				
				    <div class="col-12">
				         <input type="text" class="form-control bg-light border-0" id="id" name="id" placeholder="아이디" style="height: 55px;">
				    </div>
				    <div class="col-12">
				        <input type="password" class="form-control bg-light border-0" id="password" name="password" placeholder="비밀번호" style="height: 55px;">
				    </div>
				    <div class="col-12">
				        <input type="text" class="form-control bg-light border-0" id="email" name="email" placeholder="이메일" style="height: 55px;">
				    </div>
				    
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<input type="text" class="form-control bg-light border-0" id="name"  name="name" placeholder="이름" style="height: 55px;">
				    		</div>
	
						    <div class="col-md-3">
						        <select class="form-select bg-light border-0" id="gender" name="gender" style="height: 55px; width: 100px;">
						            <option selected disabled>성별</option>
						            <option value="MAN">남자</option>
						            <option value="WOMAN">여자</option>
						        </select>
				    		</div>
				    	</div>  
				    </div>
				    
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<input type="text" class="form-control bg-light border-0" id="tel" name="tel" placeholder="전화번호" style="height: 55px;">
				    		</div>
						    <div class="col-md-6">
							    <select class="form-select bg-light border-0" id="mobileCarrier" name="mobileCarrier" style="height: 55px; width: 100px;">
						            <option selected disabled>통신사</option>
						            <option value="SK">SK</option>
						            <option value="LG">LG</option>
								    <option value="KT">KT</option>
								    <option value="MVNO">알뜰폰</option>
							    </select>
						    </div>
				    	</div>  
				    </div>
					<p>
					  <a class="form-select bg-light border-0" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					    <strong style="color: red;">[필수]</strong> 이용약관
					  </a>
					</p>
						<div class="collapse" id="collapseExample">
							<label>
							    <input type="checkbox" id="agreeCheckbox-1" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
							
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
						  	
							<label>
							    <input type="checkbox" id="agreeCheckbox-2" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							<label>
							    <input type="checkbox" id="agreeCheckbox-3" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							  <input type="checkbox" id="check_all" >
		 						  <label for="check_all">전체 동의합니다.</label>
						</div>				    
				    <div class="col-12">
				        <button class="btn btn-dark w-100 py-3" type="submit">가입하기</button>
				    </div>
				</div>
		 	</form>
		 	
            <!-- 트레이너 폼 -->
		 	<form action="/user/register/trainer" id="registerform-trainer" style="display: none" method="post">
				<div class="row g-3">
				<div>
					<h3>트레이너 회원가입</h3>
				</div>
				    <div class="col-12">
				        <input type="text" class="form-control bg-light border-0" id="id" name="id" placeholder="아이디" style="height: 55px;">
				    </div>
				    <div class="col-12">
				        <input type="password" class="form-control bg-light border-0" id="password" name="password" placeholder="비밀번호" style="height: 55px;">
				    </div>
				    
				    <div class="col-12">
				        <input type="text" class="form-control bg-light border-0" id="email" name="email" placeholder="이메일" style="height: 55px;">
				    </div>
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<input type="text" class="form-control bg-light border-0" id="name" name="name" placeholder="이름" style="height: 55px;">
				    		</div>

						    <div class="col-md-3">
						        <select class="form-select bg-light border-0" id="gender" name="gender" style="height: 55px; width: 100px;">
						            <option selected disabled>성별</option>
						            <option value="MAN">남자</option>
						            <option value="WOMAN">여자</option>
						        </select>
				    		</div>
				    	</div>  
				    </div>
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<input type="text" class="form-control bg-light border-0" id="tel" name="tel" placeholder="전화번호" style="height: 55px;">
				    		</div>
						    <div class="col-md-6">
							    <select class="form-select bg-light border-0" id="mobileCarrier" name="mobileCarrier" style="height: 55px; width: 100px;">
						            <option selected disabled>통신사</option>
						            <option value="SK">SK</option>
						            <option value="LG">LG</option>
								    <option value="KT">KT</option>
								    <option value="MVNO">알뜰폰</option>
							    </select>
						    </div>
				    	</div>  
				    </div>
				    			    
					<p>
					  <a class="form-select bg-light border-0" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					    <strong style="color: red;">[필수]</strong> 이용약관
					  </a>
					</p>
						<div class="collapse" id="collapseExample">
							<label>
							    <input type="checkbox" id="agreeCheckbox-1" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							<label>
							    <input type="checkbox" id="agreeCheckbox-2" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							<label>
							    <input type="checkbox" id="agreeCheckbox-3" class="normal">
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							  <input type="checkbox" id="check_all" >
	  						  <label for="check_all">전체 동의합니다.</label>
						</div>				    
				    <div class="col-12">
				        <button class="btn btn-dark w-100 py-3" type="submit">가입하기</button>
				    </div>
				</div>
		 	</form>
		 	
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
   
   <script type="text/javascript"></script>
   
   <script>
	// 체크박스 전체 선택/해제 처리하는 제이쿼리
	   $(".collapse").on("click", "#check_all", function () {
	     var checked = $(this).is(":checked");
	
	     if(checked){
	     	$(this).parents(".collapse").find('input').prop("checked", true);
	     } else {
	     	$(this).parents(".collapse").find('input').prop("checked", false);
	     }
	   });
	
	// 체크박스 전체선택 한 상태에서 다른 체크박스 선택시 전체동의 체크박스 해제된다.
	   $(".collapse").on("click", ".normal", function() {
	     var checked = $(this).is(":checked"); 
	
	     if (!checked) {
	     	$("#check_all").prop("checked", false); 
	     }
	   });
	
	// 체크박스를 개별로 각각 선택하면 전체동의가 체크된다.
	   $(".collapse").on("click", ".normal", function() {
	       var is_checked = true;
	       
	       $(".collapse .normal").each(function(){
	           is_checked = is_checked && $(this).is(":checked");
	       });
	       
	       $("#check_all").prop("checked", is_checked);
	   });
	
	
	// 회원가입 폼 선택
	   $(document).ready(function() {
	   $('#user-img').on('click', function() {
	   		$('#trainer-img').hide();
	   		$('#registerform-trainer').hide();
	   		$('#register-form').hide();
	   		$('#registerform-user').show();
	   		$(this).hide();
	   	});

	    $('#trainer-img').on('click', function() {
	   	$('#user-img').hide();
	   	$('#registerform-user').hide();
	   	$('#register-form').hide();
	   	$('#registerform-trainer').show();
	   	$(this).hide();
	   	});
	    
	 });
;
	</script>
</body>
</html>