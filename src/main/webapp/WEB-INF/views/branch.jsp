<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <title>오시는길</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

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


    <!-- Topbar Start -->
    <jsp:include page="common/topnavbar.jsp"/>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0">
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">오시는길</h1>
                    <a href="/home" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">오시는길</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Full Screen Search Start -->
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
    <!-- Full Screen Search End -->

	<!-- 지도 api, 지점소개 start -->
	<div class="row">
		<div class="col-lg-7" id="map" style="width: 1000px; height: 500px;" ></div>
		
		 <div class="col-lg-5"  style="text-align:center" >
		 	  <h2>찾아오시는 길</h2>
		 	  
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
										<p><span style="color: rgb(35, 38, 40);"><strong>주소</strong></span></p>
										<p><span>서울특별시 종로구 율곡로10길 105 디아망 4F</span></p>
										<p><span>Tel. 02-2695-1121 | Fax. 02-2697-1121&nbsp;</span></p>
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
					<div doz_type="widget" id="w2019081748f6c6e1b57b9">
						<div class="_widget_data  animated wg_animated fadeInUp" data-widget-name="텍스트" data-widget-type="text" data-widget-anim="fadeInUp" data-widget-anim-duration="0.7" data-widget-anim-delay="0.2" data-widget-parent-is-mobile="N" style="opacity: 1; animation-duration: 0.7s; animation-delay: 0.2s; visibility: visible;">
							<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w2019081748f6c6e1b57b9">
								<div class="text-table ">
									<div>
										<p><span style="color: rgb(35, 38, 40);"><strong>운영시간</strong></span></p>
										<p>월-금 06:00 ~ 23:00</p><p>토-일, 공휴일 08:00 ~ 20:00</p>
									</div>
								</div>		
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
												<p><span style="color: rgb(35, 38, 40);"><strong>교통편</strong></span></p>
												<p>지하철역 | 2/5호선 까치산역 4번 출구 앞</p>
												<p>버스 | 
													<span style="background-color: rgb(54, 5, 198); color: rgb(255, 255, 255);">간선</span> 652, 653, N65, 
													<span style="background-color: rgb(39, 195, 0); color: rgb(255, 255, 255);">지선</span> 5712, 6514, 6628, 6630, 6657
												</p>
												<p>자가용 | 디아망 주차장 이용 가능</p>
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

	<!-- 지도 api, 지점소개 end -->

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
    
    <!-- 트레이너 이미지를 클릭했을 때 모달페이지 -->
    <script type="text/javascript">
    let teacherModal = new bootstrap.Modal("#modal-teacher");

    $("#box-trainer img").click(function() {

       teacherModal.show();
    });
    </script>
    
    <!-- 지도 api생성  -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	e7906e0911476858c75ab0600aedd7ae"></script>
	<script type="text/javascript">
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	</script>
    
 
    
    
    
</body>

</html>