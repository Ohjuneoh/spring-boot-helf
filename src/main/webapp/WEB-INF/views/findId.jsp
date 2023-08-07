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
   	<jsp:include page="common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topbar End -->


    <!-- Navbar & Carousel Start -->
    <div class="container-fluid position-relative p-0">
		<jsp:include page="common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/resources/img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                        
                        	<form action="/user/find-id" method="post">
	                            <div class="row g-3">
	                            	<div class="col-xl-12">
	                            		<a><strong style="font-size: 40px;">아이디 찾기</strong></a>
	                            	</div>
	                            	
	                            	<div class="border p-3 bg-light">
		                               <!-- 전화번호 인증  -->
		                            	<div id="div_tel" class="box_inn selected  text-start mb-3 mt-2"> <!-- [D] 선택시 selected 클래스 추가 -->
											<input type="radio" id="r_pn1" class="input_rd" name="certification" value="tel">
											<label for="r_pn2" class="label_rd" style="font-size: 18px; font-weight: bold;">휴대전화 인증(가입된 휴대전화)</label>
												<p class="dsc" style="padding-left: 20px;">기존에 HELF 헬스장에 가입되어 있는 정보를 비교하여 아이디를 찾을 수 있습니다.</p>	
											<div class="box-inn-sub-tel d-none">
												<dl>
												<dt><label for="telNm" class="label_txt">이름</label></dt>
												<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px"></dd>
												<dt><label for="tel" class="label_txt">전화번호</label></dt>
												<dd>
													<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px">
												</dd>
												</dl>
											</div>		
										</div>
										
										
		                               <!-- 이메일 인증  -->
		                               <div id="div_email" class="box_inn selected  text-start"> <!-- [D] 선택시 selected 클래스 추가 -->
											<input type="radio" id="r_pn2" class="input_rd" name="certification" value="email" >
											<label for="r_pn2" class="label_rd " style="font-size: 18px; font-weight: bold;">본인확인 이메일 인증</label>
												<p class="dsc" style="padding-left: 20px;">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>	
											<div class="box-inn-sub-email d-none" >
												<dl>
												<dt><label for="emailNm" class="label_txt">이름</label></dt>
												<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px"></dd>
												<dt><label for="email" class="label_txt">이메일 주소</label></dt>
												<dd>
													<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px">
													<a href="#" id="btnEmailAuthNo" name="btnEmailAuthNo" onclick="sendAuthNoForEmailAuth();clickcr(this,'eml.code','','',event);" class="btn_ct">
														<span class="blind">인증번호 받기</span>
													</a>
												</dd>
												<dt><label for="t_ct1" class="blind">인증번호 입력</label></dt>
												<dd class="ct">
													<span class="input_box2">
														<span id="span_emailAuthNo" class="phold" style="display: block;">인증번호 6자리 숫자 입력</span>
														<input type="text" id="emailAuthNo" name="emailAuthNo" maxlength="6" onkeydown="check_num('emailAuthNo', '1')" onclick="hiddenObj('span_emailAuthNo')" class="input_txt" style="width:217px" disabled="">
													</span>
													<div>인증번호가 오지 않나요? <a href="javascript:showHelp('emailHelpTxt');" onclick="clickcr(this,'eml.help','','',event);" class="ico_help2">
													<span class="blind">도움말</span></a>
														<!-- [D]툴팁 활성화시 display:block , 비활성화시 display:none  -->
														<div id="emailHelpTxt" class="help_tooltip2" style="display:none">
															<p>네이버가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 <br>확인해 주세요. 스팸 메일함에도 메일이 없다면,<br>다시 한 번 '인증번호 받기'를 눌러주세요.</p>
																<span class="edge"></span>
														</div>
													</div>									
												</dd>	
												</dl>
											</div>		
										</div>
		                               
	                            	</div>
	                            	
	                               
	                                <div class="col-12">
	                                    <button class="btn btn-dark w-100 py-3" type="submit">찾기</button>
	                                </div>
	                                <div class="col-12">
	                                	<a href="/user/findPwd"  class="btn" >비밀번호 찾기</a>
	                                </div>
	                            </div>
                        	</form>
                        	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



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
    	$(function(){
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
    	})
    </script>
</body>

</html>