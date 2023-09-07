<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>

</style>

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
                    <h1 class="display-4 text-white animated zoomIn">MY PAGE</h1>
                    <a href="" class="h5 text-white">내 정보 조회</a>
                </div>
            </div>
        </div>
    </div>
    <div class="p-3" style="max-width: 900px; margin: 0 auto;">
		<form action="/user/findPwd" method="post">
	        <div class="row g-3">
	            <div class="col-xl-12">
	            	<a style="display: flex; justify-content: center;">
	               		<strong style="font-size: 30px;">내정보 수정하기</strong>
	             	</a>
				</div>
	            <div class="border p-3 bg-light">
					<div class="row g-3">
						<div class="mb-4"></div>
						<div class="row">
							<h5>아이디</h5>
							<div class="col-sm-6 input-wrapper">
								<input id="trainer-id" name="id" style="height: 55px; width: 620px;" placeholder="4-12자, 영어소문자를 입력하세요." type="text" class="form-control bg-light border-0" value="">
								<div class="check_font" id="trainer-id_check"></div>
								<div class="id_input_re_1" style="color: green; display: none;">사용 가능한 아이디입니다.</div>
								<div class="id_input_re_2" style="color: red; display: none;">아이디가 이미 존재합니다.</div>
							</div>
						</div>
				    	<div class="col-12">
					    	<h5>비밀번호</h5>
					        <input id="trainer-password" name="password" style="height: 55px;" placeholder="4-12자, 영문+숫자+특수문자를 꼭 포함하여 입력하세요." type="password" class="form-control bg-light border-0" value="">
					   		<div class="check_font" id="trainer-password_check"></div>
					    </div>
					    <div class="col-12">
							<h5>이메일</h5> 
						    <div class="row">
								<div class="col-md-6">
							        <input id="trainer-email" name="email1" style="height: 55px;" placeholder="특수문자를 제외하고 입력하세요." type="text" class="form-control bg-light border-0" value="">
							    	<div class="check_font" id="trainer-email-check"></div>
								</div>
								<div class="col-md-6">
									<select id="trainer-email-2" name="email2" style="height: 55px; width: 200px;" class="form-select bg-light border-0">
							            <option selected="" value="@naver.com">@naver.com</option>
							            <option value="@gamil.com">@gamil.com</option>
									    <option value="@kakao.com">@kakao.com</option>
									    <option value="@hanmail.net">@hanmail.net</option>
									    <option value="@nate.com">@nate.com</option>
									    <option value="@outlook.com">@outlook.com</option>
									    <option value="@yahoo.com">@yahoo.com</option>
								    </select>
							    </div>
						    </div>
					    </div>
					    <div class="col-12">
					    	<h5>이름</h5>
					    	<div class="row">
					    		<div class="col-md-6">
						        	<input id="trainer-name" name="name" style="height: 55px;" placeholder="홍길동 (한글만 입력하세요.)" type="text" class="form-control bg-light border-0" value="">
						    		<div class="check_font" id="trainer-name_check"></div>
					    		</div>
							    <div class="col-md-3">
							        <select id="trainer-gender" name="gender" style="height: 55px; width: 100px;" class="form-select bg-light border-0">
							            <option selected="" disabled="">성별</option>
							            <option value="MAN">남자</option>
							            <option value="WOMAN">여자</option>
							        </select>
					    		</div>
					    	</div>  
					    </div>
					    <div class="col-12">
					    	<h5>전화번호</h5>
					    	<div class="row">
					    		<div class="col-md-6">
						        	<input id="trainer-tel" name="tel" style="height: 55px;" placeholder="010-1111-1234 (특수문자는 '-'만 입력가능합니다. )" type="text" class="form-control bg-light border-0" value="">
					    			<div class="check_font" id="trainer-tel_check"></div>
					    		</div>
							    <div class="col-md-6">
								    <select id="trainer-mobileCarrier" name="mobileCarrier" style="height: 55px; width: 100px;" class="form-select bg-light border-0">
							            <option selected="" disabled="">통신사</option>
							            <option value="SK">SK</option>
							            <option value="LG">LG</option>
									    <option value="KT">KT</option>
									    <option value="MVNO">알뜰폰</option>
								    </select>
							    </div>
					    	</div>  
					    </div>
					</div>
				</div>
			</div>
          	<div class="col-12 mt-3">
				<button type="submit" class="btn btn-dark w-100 py-3" id="changePwd-button" >회원정보 수정</button>
			</div>
		</form>
	</div>                    
	
    <!-- Lesson Register Form End  -->

	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
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