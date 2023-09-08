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
                        
                        	<form action="/user/findPwd" method="post">
	                            <div class="row g-3">
	                            	<div class="col-xl-12">
	                            		<a><strong style="font-size: 40px;">비밀번호 찾기</strong></a>
	                            	</div>
	                            	
	                            	<div class="border p-3 bg-light">
		                              
		                               <!-- 이메일 인증  -->
		                               <div id="div_email" class="box_inn selected  text-start"> 
											<input type="radio" id="r_pn2" class="input_rd" name="certification" value="email" >
											<label for="r_pn2" class="label_rd" style="font-size: 18px; font-weight: bold;">본인확인 이메일 인증</label>
												<p class="dsc" style="padding-left: 20px;">기존 HELF헬스장에 가입한 이메일 주소로 인증번호가 발송됩니다.</p>	
											<div class="box-inn-sub-email d-none" >
												<dl>
													<dt><label for="emailNm" class="label_txt">아이디</label></dt>
														<dd><input type="text" id="findPwd-id" name="findPwd-id" maxlength="40" class="input_txt" style="width:217px"></dd>
															<dt class="col-sm-6 button-wrapper">
							        							<input id="findPwd-id-check-duplicate" type="button" value="확인" class="btn btn-primary " style="width:80px" />
							    							</dt>
								    							<dd><label type="text" id="result-pwd-id-1" name="result-pwd-id-1"  class="input-txt-1" style="color: green; display: none;">인증번호가 전송되었습니다.</label></dd>
																<dd><label type="text" id="result-pwd-id-2" name="result-pwd-id-2"  class="input-txt-2" style="color: red; display: none;">인증번호 전송에 실패하였습니다.(아이디를 다시 입력해주세요.)</label></dd>
														<dt><label for="emailNm" class="label_txt">인증번호 (6자리)</label></dt>
														<dd><input type="text" id="findPwd-auth" name="findPwd-auth" maxlength="40" class="input_txt" style="width:217px"></dd>
															<dt class="col-sm-6 button-wrapper">
							        							<input id="findPwd-auth-check-duplicate" type="button" value="확인" class="btn btn-primary " style="width:80px" disabled />
															</dt>
							        							<dd><label type="text" id="result-pwd-auth-1" name="result-pwd-auth-1"  class="input-txt-1" style="color: green; display: none;">인증번호가 일치합니다.</label></dd>
																<dd><label type="text" id="result-pwd-auth-2" name="result-pwd-auth-2"  class="input-txt-2" style="color: red; display: none;">인증번호가 일치하지 않습니다.</label></dd>
												</dl>
											</div>		
										</div>
	                            	</div>
	                            </div>
                        	</form>
	                              	<div class="col-12 mt-3">
								    	<button type="submit" class="btn btn-dark w-100 py-3" id="changePwd-button" disabled>비밀번호 변경하러가기</button>
									</div>
	                                <div class="col-12">
	                                	<a href="/user/findIdform" class="btn" >아이디 찾기</a>
	                                </div>
                        	
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
    <script type="text/javascript">
    	$(function() {
    		$(":radio[name=certification]").change(function() {
    			let value=$(this).val();
    			if(value =='tel'){
    				$(".box-inn-sub-email").addClass('d-none')
    				$(".box-inn-sub-tel").removeClass('d-none')
    			} else if (value == 'email'){
    				$(".box-inn-sub-tel").addClass('d-none')
    				$(".box-inn-sub-email").removeClass('d-none')
    			}
    		});
    		
    		/* 비밀번호 찾기 - 인증번호 전송 ajax */
    		$("#findPwd-id-check-duplicate").click(function() {
	    		$.ajax({
					type : "get",
					url : "findPwdByAuth",
					data : {id:$("input[name=findPwd-id]").val() },
					success : function(result) {
						console.log("result------------------> ", result)
						if (result != 'fail') {
							$("#result-pwd-id-1").css("display", "inline-block");
							$("#result-pwd-id-2").css("display", "none");
							$("#findPwd-auth-check-duplicate").prop("disabled", false);
							$('#changePwd-button').prop("disabled", false);
						} else {
							 $('#result-pwd-id-2').css("display", "inline-block");
			                 $('#result-pwd-id-1').css("display", "none");
							 $('#changePwd-button').prop("disabled", true);
						}
					}
	    		
				});
    		})
    		
    		/* 비밀번호 찾기 - 인증번호 확인 ajax */
    		$("#findPwd-auth-check-duplicate").click(function() {
	    		$.ajax({
					type : "get",
					url : "findPwdAuthChk",
					data : {id:$("input[name=findPwd-id]").val(), auth:$("input[name=findPwd-auth]").val() },
					success : function(result) {
						console.log("result------------------> ", result)
						if (result != 'fail') {
							$("#result-pwd-auth-1").css("display", "inline-block");
							$("#result-pwd-auth-2").css("display", "none");
			                $('#changePwd-button').prop("disabled", false);
						} else {
							 $('#result-pwd-auth-2').css("display", "inline-block");
			                 $('#result-pwd-auth-1').css("display", "none");
			                 $('#changePwd-button').prop("disabled", true);
						}
					}
	    		
				});
    		})
    		

 	$(document).ready(function() {
	    $("#changePwd-button").click(function() {
	    	let id = $("#findPwd-id").val();
	        // 버튼 클릭 시 이동할 링크
	        var link = "/user/changePwdForm?id=" + id; 
	        
	        // 링크로 이동
	        window.location.href = link;
	    })
	 })
  
  
   })
    	
    </script>
</body>

</html>