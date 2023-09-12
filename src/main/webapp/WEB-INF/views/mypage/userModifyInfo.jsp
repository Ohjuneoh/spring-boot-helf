<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>
   .border {
       box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 이 부분에서 그림자 효과를 조절할 수 있습니다 */
   }
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
    <div class=" p-3" style="max-width: 900px; margin: 0 auto;">
	    	<form action="/user/userInfoChange" method="post" enctype="multipart/form-data">
		        <div class="row g-3">
		            <div class="row" >
						<div class="col-12 section-title text-start position-relative pb-3 mb-1 mt-4" style="max-width: 600px;">
			                <h1 class="fw-bold text-primary text-uppercase" >수정하기</h1>
			            </div>
					</div>
		        <div class="p-3">
			        	<div class="row g-3">
							<div class="mb-4"></div>
						
						<div class="row">
							<div class="col-sm-6">
							    <img src="/resources/img/photo/유저사진.png" class="img-fluid border" />
							    <div class="col-sm-6 input-wrapper">
							        <input type="file" name="photofile" style="display: none;" id="fileInput" />
							    </div>
							</div>
						    <div class="col-sm-6 input-wrapper">
						    	<h5 class="text-primary">이름</h5>
						    		<div class="col-m-6">
							        	<input id="user-name" name="name" style="height: 50px;"  type="text" class="form-control bg-light border-0" value="${userInfo.name }" readonly="readonly" disabled="disabled">
					    				<div class="check_font" id="user-name_check"></div>
						    		</div>
								<h5 class="text-primary mt-2">아이디</h5>
						         <input id="user-id" name="id" style="height: 50px; width: 620px;" type="text" 
						         		class="form-control bg-light border-0" value="${userInfo.id }" readonly="readonly" disabled="disabled">
						   		<h5 class="text-primary mt-2">이메일</h5> 
							    <div class="row">
								    <div class="col-md-8">
								        <input id="user-email" name="email1" style="height: 50px;" 
								        	   type="text" class="form-control bg-light border-0">
								    	<div class="check_font " id="user-email-check"></div>
									</div>
									<div class="col-md-3">
									    <select id="user-email-2" name="email2" style="height: 50px; width: 150px;" class="form-select bg-light border-0">
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
						</div>
					    <div class="col-12">
						    <h5 class="text-primary mt-2">비밀번호</h5>
						        <input id="user-password" name="password" 
						        	   type="password" class="form-control bg-light border-0"  placeholder="4-12자, 영문+숫자+특수문자를 꼭 포함하여 입력하세요.">
						   		<div class="check_font" id="user-password_check"></div>
					    </div>
					    <div class="col-12">
					    	<div class="row">
					    
					    	</div>  
					    </div>
					    <div class="col-12">
					    <h5 class="text-primary">전화번호</h5>
					    	<div class="row">
					    		<div class="col-md-6">
						        	<input id="user-tel" name="tel" value="${userInfo.tel }" type="text" class="form-control bg-light border-0" >

					    			<div class="check_font" id="user-tel_check"></div>
					    		</div>
							    <div class="col-md-6">
								    <select id="user-mobileCarrier" name="mobileCarrier" style="width: 100px;" class="form-select bg-light border-0">
							            <option selected="" disabled="">통신사</option>
							            <option value="SK">SK</option>
							            <option value="LG">LG</option>
									    <option value="KT">KT</option>
									    <option value="MVNO">알뜰폰</option>
								    </select>
							    </div>
					    	</div>  
					    </div>
					    <hr>
					    <div>
					    	
					    </div>
                  	</div>
              	</div>
          	</div>
          	<div>
          	</div>
			<div class="col-12 mt-3">
				<button type="submit" class="btn btn-dark w-100 py-3" id="changePwd-button" disabled>회원정보 수정</button>
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
$(document).ready(function(){
    // 비밀번호 입력 필드에서 포커스가 벗어났을 때 새 div 추가
    $("#user-password").blur(function(){
        if(!$("#password_confirmation").length) {
            $(this).after('<div id="password_confirmation"><input type="password" class="form-control bg-light border-0 mt-3" placeholder="비밀번호를 한 번 더 입력해주세요"></div>');
            addPasswordMatchCheck();
        }
    });

    $(".service-item").click(function() {
        faqModal.show();
    });

    // 프로필 사진 업로드 트리거 함수
    function triggerFileInput() {
        document.getElementById('fileInput').click();
    }


function addPasswordMatchCheck() {
    $("#password_confirmation input").on('input', function() {
        checkPasswordMatch();
    });

    $("#user-password").on('input', function() {
        checkPasswordMatch();
    });
}

function checkPasswordMatch() {
    var password = $("#user-password").val();
    var confirmPassword = $("#password_confirmation input").val();

    if(confirmPassword.length > 0) {
        if(password !== confirmPassword) {
            if(!$("#password_error").length) {
                $("#password_confirmation").after('<div class="mt-1" id="password_error" style="color: red;"><strong>비밀번호가 일치하지 않습니다</strong></div>');
            }
            $("#password_success").remove();
        } else {
            $("#password_error").remove();
            if(!$("#password_success").length) {
                $("#password_confirmation").after('<div class="mt-1" id="password_success" style="color: green;"><strong>비밀번호가 일치합니다</strong></div>');
            }
        }
    }
}

 
	//이메일 유효성 검사
	$("#user-email").on('input', function() {
	    var email = $(this).val();
	    var mailJ = /^[a-zA-Z0-9]/;
	    if (mailJ.test(email)) {
	        $("#user-email-check").text("");
	    } else {
	        $("#user-email-check").text("이메일 형식에 맞게 입력하세요.");
	    }
	    checkFormValidity(); // 폼 유효성 검사 함수 호출
	});
	
	// 비밀번호 유효성 검사
	$("#user-password").on('input', function() {
	    var password = $(this).val();
	    var pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{4,12}$/;
	    if (pwJ.test(password)) {
	        $("#user-password_check").text("");
	    } else {
	        $("#user-password_check").text("비밀번호 형식에 맞게 입력하세요.");
	    }
	    checkFormValidity(); // 폼 유효성 검사 함수 호출
	});
	
	// 휴대폰 번호 유효성 검사
	$("#user-tel").on('input', function() {
	    var phone = $(this).val();
	    var phoneJ = /^01([0|1|6|7|8|9]?)?-?([0-9]{3,4})?-?([0-9]{4})$/;
	    if (phoneJ.test(phone)) {
	        $("#user-tel_check").text("");
	    } else {
	        $("#user-tel_check").text("휴대폰 번호 형식에 맞게 입력하세요.");
	    }
	    checkFormValidity(); // 폼 유효성 검사 함수 호출
	});
	
	// 폼 유효성 검사 함수
	function checkFormValidity() {
	    var emailValid = $("#user-email-check").text() === "";
	    var passwordValid = $("#user-password_check").text() === "";
	    var telValid = $("#user-tel_check").text() === "";
	
	    // 모든 조건을 만족하면 수정 버튼 활성화
	    if (emailValid && passwordValid && telValid) {
	        $("#changePwd-button").prop("disabled", false);
	    } else {
	        $("#changePwd-button").prop("disabled", true);
	    }
	}

	
	// 회원정보 수정 버튼 클릭 이벤트 처리
    $("#changePwd-button").click(function(event) {
        // 이메일 체크
        var email = $("#user-email").val();
        if (email.trim() === "") {
            alert("이메일을 입력하세요.");
            event.preventDefault(); // 이벤트 중단
            return;
        }

        // 비밀번호 체크
        var password = $("#user-password").val();
        if (password.trim() === "") {
            alert("비밀번호를 입력하세요.");
            event.preventDefault();
            return;
        }

        // 통신사 체크
        var mobileCarrier = $("#user-mobileCarrier").val();
        if (mobileCarrier === null) {
            alert("통신사를 선택하세요.");
            event.preventDefault();
            return;
        }

        // 전화번호 체크
        var tel = $("#user-tel").val();
        if (tel.trim() === "") {
            alert("전화번호를 입력하세요.");
            event.preventDefault();
            return;
        }
    });

});
    
</script>


    
</body>

</html>