<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		   	<form:form action="/user/register/user" id="registerform-user" style="display: none" method="post" modelAttribute="addUserForm" >
				<div class="row g-3">
				<div>
					<h3>회원 회원가입</h3>
				</div>
				
				    <div class="col-12">
				         <form:input type="text" class="form-control bg-light border-0" id="id" path="id" placeholder="아이디" style="height: 55px;" />
				         <input type="button" value="중복체크" onClick="idCheck()" />
				         <form:errors path="id" class="text-danger"></form:errors>
				    </div>
				    <div class="col-12">
				        <form:input type="password" class="form-control bg-light border-0" id="password" path="password" placeholder="비밀번호" style="height: 55px;"/>
				   		<form:errors path="password" class="text-danger"></form:errors>
				    </div>
				    <div class="col-12">
				        <form:input type="text" class="form-control bg-light border-0" id="email" path="email" placeholder="이메일" style="height: 55px;"/>
				    	<form:errors path="email" class="text-danger"></form:errors>
				    </div>
				    
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="name"  path="name" placeholder="이름" style="height: 55px;" />
				    			<form:errors path="name" class="text-danger"></form:errors>
				    		</div>
	
						    <div class="col-md-3">
						        <form:select class="form-select bg-light border-0" id="gender" path="gender" style="height: 55px; width: 100px;">
						            <option selected disabled>성별</option>
						            <option value="MAN">남자</option>
						            <option value="WOMAN">여자</option>
						        </form:select>
				    		</div>
				    	</div>  
				    </div>
				    
				    <div class="col-12">
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="tel" path="tel" placeholder="전화번호" style="height: 55px;" />
				    			<form:errors path="tel" class="text-danger"></form:errors>
				    		</div>
						    <div class="col-md-6">
							    <form:select class="form-select bg-light border-0" id="mobileCarrier" path="mobileCarrier" style="height: 55px; width: 100px;">
						            <option selected disabled>통신사</option>
						            <option value="SK">SK</option>
						            <option value="LG">LG</option>
								    <option value="KT">KT</option>
								    <option value="MVNO">알뜰폰</option>
							    </form:select>
						    </div>
				    	</div>  
				    </div>
				    <!-- 이용약관 -->
					<p>
					  <a class="form-select bg-light border-0" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					    <strong style="color: red;">[필수]</strong> 이용약관
					  </a>
					</p>
						<div class="collapse" id="collapseExample">
							<label>
							    <input type="checkbox" id="agreeCheckbox-1" class="normal" name="agree1"/>
							    <strong style="color: red;">[필수]</strong> HELF 이용약관
							    <div id="list-example" class="list-group">
  <a class="list-group-item list-group-item-action" href="#list-item-1">여러분을 환영합니다.</a>
  <a class="list-group-item list-group-item-action" href="#list-item-2">회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.</a>
  <a class="list-group-item list-group-item-action" href="#list-item-3">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</a>
  <a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
</div>
<div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="scrollspy-example" tabindex="0">
  <h4 id="list-item-1">여러분을 환영합니다.</h4>
  <p>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</p>
  <h4 id="list-item-2">회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.</h4>
  <p>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.

네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.

단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.</p>
  <h4 id="list-item-3">Item 3</h4>
  <p>...</p>
  <h4 id="list-item-4">Item 4</h4>
  <p>...</p>
</div>
							</label>
							
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
						  	
							<label>
							    <input type="checkbox" id="agreeCheckbox-2" class="normal" name="agree2"/>
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							<label>
							    <input type="checkbox" id="agreeCheckbox-3" class="normal" name="agree3"/>
							    <strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
							</label>
						  	<div class="card card-body bg-light border-0">
						   		내용넣어주세요
						  	</div>
							  <input type="checkbox" id="check_all" />
		 					  <label for="check_all">전체 동의합니다.</label>
						</div>				    
				    <div class="col-12">
				        <button class="btn btn-dark w-100 py-3" type="submit">가입하기</button>
				    </div>
				</div>
		 	</form:form>
		 	
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
   
		// 회원가입 폼 선택(회원/트레이너)
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
	    
	    // 이용약관 체크박스 
		$("#collapseExample :checkbox.normal").change(function() {
			let allChecked = true;

			$("#collapseExample :checkbox.normal").each(function(index, checkbox) { 
				allChecked = allChecked && $(checkbox).prop("checked");
			});
			
			$("#check_all").prop("checked", allChecked);
		});
		
		$("#check_all").change(function() {
			$("#collapseExample :checkbox.normal").prop("checked", $(this).prop("checked"))
		});
	

	</script>
</body>
</html>