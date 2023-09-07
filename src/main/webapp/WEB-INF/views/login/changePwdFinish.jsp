<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
    <!-- Navbar End -->
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">CHANGE PASSWORD</h1>
                    <a href="" class="h5 text-white">비밀번호 변경 완료</a>
                </div>
            </div>
        </div>
    </div>
	<div class="row justify-content-center" style="text-align:center">
		<div class="col-lg-5">
			<h2>비밀번호 변경이 완료되었습니다.</h2>
			<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"  style="display: flex; justify-content: center;">
		 	  	<div doz_type="widget" id="w20190820145dcc26dd4ed">
		 	  		<div class="_widget_data " data-widget-name="가로선" data-widget-type="hr" data-widget-anim="none" data-widget-anim-duration="" data-widget-anim-delay="" data-widget-parent-is-mobile="N">
		 	  			<div class="widget line type01 _hide" id="hr_w20190820145dcc26dd4ed">
							<div class="line_box holder" style="width:100px; ">
								<hr style="border-top-width:1px; border-color:rgba(35, 38, 40, 0.65);">	
							</div>
						</div>
					</div>
				</div>
			</div>
			<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
				<div doz_type="row" doz_grid="4" class="doz_row">
					<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
						<div doz_type="widget" id="w2019081545754e13d8cd3">
							<div class="_widget_data  animated wg_animated fadeInUp" data-widget-name="텍스트" data-widget-type="text" data-widget-anim="fadeInUp" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N" style="opacity: 1; animation-duration: 0.7s; animation-delay: 0s; visibility: visible;">
								<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w2019081545754e13d8cd3">
									<div class="text-table mt-2">
										<div>
											<i class="bi bi-emoji-laughing-fill" style="font-size: 48px;"></i>
											<p><span style="color: rgb(35, 38, 40); font-size: 24px;">비밀번호가 변경되었습니다!</span></p>
										
										</div>
									</div>		
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="4" class="doz_row">
					<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
						<div doz_type="widget" id="w20190820e84e7943d2c5e">
							<div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="14" style="margin-top:px; margin-bottom:px;">
									<div id="padding_w20190820e84e7943d2c5e" style="width:100%; min-height:1px; height:14px; "></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="4" class="doz_row">
					<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
						<div doz_type="widget" id="w20190820d73d6bdbeb75d">
							<div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="14" style="margin-top:px; margin-bottom:px;">
									<div id="padding_w20190820d73d6bdbeb75d" style="width:100%; min-height:1px; height:14px; "></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="4" class="doz_row">
					<div doz_type="grid" doz_grid="4" class="col-dz col-dz-4">
						<div doz_type="widget" id="w201908176065896b508a7">
							<div class="_widget_data  animated wg_animated fadeInUp" data-widget-name="텍스트" data-widget-type="text" data-widget-anim="fadeInUp" data-widget-anim-duration="0.7" data-widget-anim-delay="0.4" data-widget-parent-is-mobile="N" style="opacity: 1; animation-duration: 0.7s; animation-delay: 0.4s; visibility: visible;">
								<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w201908176065896b508a7">
									<div class="text-table ">
										<div>
											<a href="/user/loginform" class="btn btn-primary py-2 px-4 ms-3">로그인하기</a>
											<a href="/" class="btn btn-primary py-2 px-4 ms-3">홈으로가기</a>
										</div>
									</div>		
								</div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
		
		
	</script>
</body>
</html>