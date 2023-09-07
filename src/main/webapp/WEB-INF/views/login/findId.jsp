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
                        
                        	<form action="/user/findId" method="post" name="findId">
	                            <div class="row g-3">
	                            	<div class="col-xl-12">
	                            		<a><strong style="font-size: 40px;">아이디 찾기</strong></a>
	                            	</div>
	                            	
	                            	<div class="border p-3 bg-light">
		                               <!-- 전화번호 인증  -->
		                            	<div id="div_tel" class="box_inn selected  text-start mb-3 mt-2">
											<input type="radio" id="r_pn1" class="input_rd" name="certification" value="tel">
											<label for="r_pn2" class="label_rd" style="font-size: 18px; font-weight: bold;">휴대전화 인증(가입된 휴대전화)</label>
												<p class="dsc" style="padding-left: 20px;">기존에 HELF 헬스장에 가입되어 있는 정보를 비교하여 아이디를 찾을 수 있습니다.</p>	
											<div class="box-inn-sub-tel d-none">
												<dl>
													<dt><label for="telNm" class="label_txt">이름</label></dt>
													<dd><input type="text" id="name" name="name" maxlength="40" class="input_txt" placeholder = "한글 입력" style="width:217px"></dd>
													<dt><label for="tel" class="label_txt">전화번호</label></dt>
												
													<dd><input type="text" id="tel" name="tel" class = "btn-phone" placeholder = "'-'포함하여 입력"></dd>
													<dd><label type="text" id="result-id-1" name="result-id-1"  class="input-txt-1" style="color: green; display: none;">고객님의 아이디는 <span id="find-user-id"></span>입니다.</label></dd>
													<dd><label type="text" id="result-id-2" name="result-id-2"  class="input-txt-2" style="color: red; display: none;">정보가 존재하지 않습니다.</label></dd>
												</dl>
											</div>		
										</div>
	                            	</div>
	                            	
	                                <div class="col-12">
	                                    <button class="btn btn-dark w-100 py-3" type="button" id="search">찾기</button>
	                                </div>
	                                <div class="col-12">
	                                	<a href="/user/findPwd" class="btn">비밀번호 찾기</a>
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
    <script type="text/javascript">
    	
    	$(function(){
    		$(":radio[name=certification]").change(function() {
    			let value=$(this).val();
    			if(value =='tel'){
    				$(".box-inn-sub-tel").removeClass('d-none')
    			} 
    		});
    	
	    	$("#search").click(function() {
		        var username = $("#name").val();
		        var usertel = $("#tel").val();
		        var data = {name: username, tel:usertel };
	    	
	    	$.ajax({
				type : "get",
				url : "findId",
				data : data,
				success : function(results) {
					console.log("result------------------> ", results)
					if (results.length > 0) {
						$("#result-id-1").css("display", "inline-block");
						let text = results.join(",")
						 $("#find-user-id").text(text)
						$("#result-id-2").css("display", "none");
					} else {
						 $('#result-id-2').css("display", "inline-block");
		                 $('#result-id-1').css("display", "none");
					}
				}
			});
    	});
    });
    </script>
</body>

</html>