<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
	<c:set var="menu" value="홈"/>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topbar End -->


    <!-- Navbar & Carousel Start -->
    <div class="container-fluid position-relative p-0">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/resources/img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                        	<form action="/user/login" method="post">
	                            <div class="row g-3">
	                            	<div class="col-xl-12">
	                            		<a><strong style="font-size: 40px;">LOGIN</strong></a>
	                            	</div>
	                            	<c:if test="${param.error eq 'fail'}">
	                            	<div class="alert alert-danger" style="height: 50px; width: 1000px;">
										<strong>[잘못된 접근]</strong> ${loginErrorMessage }
									</div>
	                            	</c:if>
	                                <div class="col-xl-12">
	                                    <input type="text" class="form-control bg-light border-0" placeholder="ID" style="height: 55px;" name="id">
	                                </div>
	                                <div class="col-12">
	                                    <input type="password" class="form-control bg-light border-0" placeholder="PASSWORD" style="height: 55px;" name="password">
	                                </div>
	                                <div class="col-12">
	                                    <button class="btn btn-dark w-100 py-3" type="submit">로그인</button>
	                                </div>
	                                <div class="col-12 mb-3">
	                                	<a href="/user/findIdform"  class="btn" >아이디 찾기</a>
	                                	<span>│</span>
	                                	<a href="/user/findPwd"  class="btn" >비밀번호 찾기</a>
	                                	<span>│</span>
	                                	<a href="/user/registerform"  class="btn" >회원가입</a>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
									<div class="col-12">
										<div class="d-grid gap-2">
											<a href="/oauth2/authorization/kakao" onclick="kakao_login_call()">
											    <img src="https://atimg.sonyunara.com/attrangs/banner/kakao-pc.jpg" style="width: 700px;">
											</a>
										</div>
									</div>
								</div>
                        	</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


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