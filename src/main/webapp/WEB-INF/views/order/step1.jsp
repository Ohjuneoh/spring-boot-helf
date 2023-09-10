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
   	<jsp:include page="../common/topnavbar.jsp" />
    <!-- Topnavbar End -->

    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="../common/navbar.jsp">
			<jsp:param name="menu" value="이용권"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">ORDER</h1>
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
	<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
				<h5 class="fw-bold text-primary text-uppercase">Order</h5>
				<h1 class="mb-0">구매를 진행하세요</h1>
			</div>
			<div class="text-center">
				<div style="margin-bottom: 150px;">
					<span class="border border-primary rounded-circle d-inline-block bg-primary" style="height:125px; width:125px; 
						  padding-top:46px; padding-left:1px;">
						<strong style="color:white">이용약관</strong>
					</span>
			  		<c:if test="${membershipJoinCat.getCatName() ne '하루운동'}">
				  		<span class="mx-4"><i class="bi bi-chevron-double-right"></i></span>
				  		<span class="border border-4 rounded-circle d-inline-block" style="height:125px; width:125px; 
				  			  padding-top:46px; padding-left:1px;">
				  			<strong>
					  			세부설정
				  			</strong>
				  		</span>
					</c:if>
		  			<span class="mx-4"><i class="bi bi-chevron-double-right"></i></span>
			  		<span class="border border-4 rounded-circle d-inline-block" style="height:125px; width:125px; 
			  			  padding-top:46px; padding-left:-2px;">
			  			<strong>
					  		결제
			  			</strong>
			  		</span>
				</div>
				<div class="offset-1" style="margin: 0 auto; width:900px;">
					<h4 class="text-start">
						<strong style="color:gray;" >센터 이용정책</strong>
					</h4>
					<hr style="border: 2px solid gray; width: 900px;"/>
				</div>		  		
				<div class="text-start" style="margin: 0 auto; width:850px;">
					<div class="card card-body bg-light border-0" 
						 style="height:300px; width:850px; overflow: auto; border: 1px solid #ccc; padding: 10px; margin-top: 50px;">
						<strong>
							1. 회원 등록 및 개인정보보호
						</strong>
						1-1 헬스장 이용은 회원 등록 후에 가능합니다. 회원 등록 시 제출한 개인정보는 개인정보보호정책에 따라 철저히 보호되며, 무단으로 타인과 공유되지 않습니다.
						<br/>1-2 회원은 개인정보의 정확성을 유지해야 하며, 변경 시 즉시 헬스장에 통보해야 합니다.
						<strong style="margin-top: 10px;">
							2. 시설 안전 및 규칙
						</strong>
						2-1 헬스장 내의 시설과 장비를 안전하게 이용하기 위해 회원은 규칙과 지침을 준수해야 합니다.
						<br/>2-2 회원은 운동 전에 충분한 워밍업을 하고, 체력과 능력에 맞는 강도 및 무게로 운동을 진행해야 합니다.
						<br/>2-3 시설 내 안전을 위해 금속 물품 및 위험한 물질의 사용은 제한될 수 있습니다.
						<br/>2-4 헬스장은 회원의 안전을 위해 감독 및 보조 지침을 제공할 수 있습니다. 회원은 이를 지켜야 합니다.
						<strong style="margin-top: 10px;">
							3. 시설 이용시간 및 예약
						</strong>
						3-1 헬스장 운영시간은 매일 일정한 시간대에 한정됩니다. 휴무일 및 휴무기간에 관한 정보는 사이트나 공지판에서 확인하실 수 있습니다.
						<br/>3-2 일부 시설이나 프로그램은 사전 예약이 요구될 수 있습니다. 예약 시간을 지켜 이용해주시기 바랍니다.
					</div>
					<label style="margin-top: 30px;">
						<input id="condition-check1" type="checkbox" class="normal">
						<strong class="text-start" style="color: red;">[필수]</strong> 이용약관에 동의합니다.
					</label> 
				</div>
				<div style="margin-top: 100px;"></div>
				<div class="offset-1" style="margin: 0 auto; width:900px;">
					<h4 class="text-start">
						<strong style="color:gray;" >환불정책</strong>
					</h4>
					<hr style="border: 2px solid gray; width: 900px;"/>
				</div>					
				<div class="text-start" style="margin: 0 auto; width:850px;">
					<div class="card card-body bg-light border-0" 
						 style="height:300px; width:850px; overflow: auto; border: 1px solid #ccc; padding: 10px; margin-top: 50px;">
						<strong>
							1. 환불 가능 기간 및 조건
						</strong>
						1-1 이용권 구매 후 환불을 원하실 경우, 구매 후 일정 기간 내에 환불 요청을 하셔야 합니다. 각 이용권 상품마다 환불 가능 기간이 다를 수 있습니다.
						<strong style="margin-top: 10px;">
							2. 본인 확인 및 환불 수수료
						</strong>
						2-1 환불 요청 시에는 회원 본인임을 확인하기 위한 절차가 진행될 수 있습니다.
						<br/>2-2 환불 시에는 환불 수수료가 부과될 수 있습니다. 환불 수수료는 환불 금액에서 공제되며, 환불 수수료의 정확한 금액은 이용약관에 명시됩니다.
						<strong style="margin-top: 10px;">
							3. 부분 환불
						</strong>
						3-1 이용권 중 일부만 사용하고 남은 부분을 환불하고자 할 경우, 사용한 일 수에 따라 일부 금액이 차감되어 환불될 수 있습니다.
						<br/> 3-2 구매 시에 적립되었던 포인트는 환불 시에 회수됩니다. 환불 시에 회원님의 현재 포인트가 회수해야할 포인트보다 적은 경우 환불금액에서 차감됩니다.
						<strong style="margin-top: 10px;">
							4. 환불 처리 기간
						</strong>
						4-1 환불 요청이 접수된 후 환불 처리는 일반적으로 5-10일 정도 소요될 수 있습니다.
					</div>
					<label style="margin-top: 30px;">
						<input id="condition-check2" type="checkbox" class="normal">
						<strong style="color: red;">[필수]</strong> 이용약관에 동의합니다.
					</label> 
				</div>
			</div>
			<div style="display: flex; margin-left:950px; margin-top: 95px;">
				<span style="margin-right: 10px;">
					<a href="list" class="btn btn-danger">취소</a>
				</span>
				<form action="period" method="post">
					<span>
						<button id="btn-next" type="submit" class="btn btn-primary disabled">다음</button>
					</span>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
</body>
<script type="text/javascript">
$(function() {
	
	$("#condition-check1, #condition-check2").change(function() {
		let check1 = $("#condition-check1").prop("checked");
		let check2 = $("#condition-check2").prop("checked");
		
		if (check1 && check2) {
			$("#btn-next").removeClass('disabled');
		} else {
			$("#btn-next").addClass('disabled');
		}
	});
})
</script>
</html>