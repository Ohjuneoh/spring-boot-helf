<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="text-center" >
				<div style="margin-bottom: 150px;">
					<span class="border border-4 rounded-circle d-inline-block" style="height:125px; width:125px; 
						  padding-top:46px; padding-left:1px;">
						<strong>이용약관</strong>
					</span>
			  		<span class="mx-4"><i class="bi bi-chevron-double-right"></i></span>
			  		<span class="border border-primary rounded-circle d-inline-block bg-primary" style="height:125px; width:125px; 
			  			  padding-top:46px; padding-left:1px;">
			  			<strong style="color:white"
				  			>세부설정
			  			</strong>
			  		</span>
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
						<strong style="color:gray">기간/횟수</strong>
					</h4>
					<hr style="border: 2px solid gray; "/>
				</div>
				<div class="text-center" style="margin-top: 50px;">
					<c:forEach var="period" items="${periods }">
						<button	data-period-no="${period.no }" 
							id="btn-period-${period.no }" class="btn btn-outline-primary btn-lg" 
								style="width: 180px; height: 180px; margin: 20px;">
							${period.property }${period.type eq "기간" ? "개월" : "회"}
							<br/>
							<br/>
							+ <fmt:formatNumber value="${period.addPrice }" />
						</button>
					</c:forEach>
				</div>
				
				<c:forEach var="option" items="${options }">
					<div style="margin-top: 100px;"></div>
			  		<div class="text-start offset-1" style="width:900px; margin:0 auto;">
						<h4>
							<strong style="color:gray">${option.name }</strong>
						</h4>
						<hr style="border: 2px solid gray; " />
			  		</div>
					<div style="margin-top: 50px;">
						<c:forEach var="optionJoinDetail" items="${optionJoinDetails }">
							<c:if test="${option.name eq optionJoinDetail.name }">
								<button id="btn-option-${optionJoinDetail.no }" data-option-no="${optionJoinDetail.no }" 
										data-option-name="${option.name }" type="button" class="btn btn-outline-primary btn-lg" 
										style="width: 250px; height: 180px; margin: 20px;">
									${optionJoinDetail.type }
								</button>
							</c:if>
					  	</c:forEach>
					</div>
				</c:forEach>
				
				<div style="margin-top: 100px; margin-left: 800px;">
					<form id="form-xxx" method="post" action="check">
						<input type="hidden" name="periodNo" />
						<input type="hidden" name="lockerNo" />
						<input type="hidden" name="wearNo" />
						<a href="list" class="btn btn-danger">취소</a>
						<button type="submit" id="btn-next" class="btn btn-primary disabled">다음</button>
					</form>
				</div>
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
	
	let clickedPeriod = false;
	let clickedLocker = false;
	let clickedWear = false;
	
	function check() {
		if (clickedPeriod && clickedLocker && clickedWear) {
			$("#btn-next").removeClass('disabled');			
		} 
	}

	$('[id^="btn-period"]').on('click', function() {
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		
		let no = $(this).attr("data-period-no");
		$("#form-xxx :input[name=periodNo]").val(no);
		
		clickedPeriod = true;
		check();
	});
	
	$('[id^="btn-option"]').on('click', function() {
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		
		let option = $(this).attr("data-option-name");
		let no = $(this).attr("data-option-no");

		if (option == "락커") {
			$("#form-xxx :input[name=lockerNo]").val(no);	
			clickedLocker = true;
			
		} else if (option == "운동복") {
			$("#form-xxx :input[name=wearNo]").val(no);
			clickedWear = true;
		}
		
		check();
	});
})
</script>
</html>