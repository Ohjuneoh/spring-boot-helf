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
                    <a href="" class="h5 text-white">이용권 구매</a>
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
				<h5 class="fw-bold text-primary text-uppercase">Your Order</h5>
				<h1 class="mb-0">구매를 진행하세요</h1>
			</div>
			<br/>
			<br/>
			<br/>
			<div class="text-center ">
				<span class="border border-4 rounded-circle d-inline-block" style="height:125px; width:125px; 
					  padding-top:46px; padding-left:1px;">
					<strong>이용약관</strong>
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
		  		<span class="border border-primary rounded-circle d-inline-block bg-primary" style="height:125px; width:125px; 
		  			  padding-top:46px; padding-left:-2px;">
		  			<strong style="color:white">
				  		결제
		  			</strong>
		  		</span>
		  		<form action="kakaopay-ready" method="post">
					<div class="offset-1" style="margin: 100px;">
						<h4 class="text-start">
							<strong style="color:gray">결제내역</strong>
						</h4>
						<hr style="border: 2px solid gray;"/>
						<table class="table table-bordered" style="margin: 50px; width: 900px;">
			   				<thead>
			   					<tr class="table-primary" style="width: 1200px;">
			   						<th>상품명</th>
			   						<th>기간/횟수</th>
			   						<th>상품가</th>
			   					</tr>
			   					<tr>
			   						<th>
			   							${form.membershipName }
				   						<c:if test="${form.lockerPrice ne 0 }">
						   						<br/><br/>${form.lockerName }
				   						</c:if>
				   						<c:if test="${form.wearPrice ne 0 }">
					   						<br/><br/>${form.wearName }
				   						</c:if>
			   						</th>
				   					<td>
				   						<c:if test="${form.remainderCnt eq null }">
					   						${form.periodDuration }개월
				   						</c:if>
				   						<c:if test="${form.remainderCnt ne null }">
				   							${form.remainderCnt }회
				   						</c:if>
				   						<input type="hidden" name="membership-period" value="${form.periodDuration }">
				   						<c:if test="${form.lockerPrice ne 0 }">
						   					<br/><br/>
						   					<span>${form.periodDuration }</span>개월
				   						</c:if>
				   						<c:if test="${form.wearPrice ne 0 }">
					   						<br/><br/>
					   						<span>${form.periodDuration }</span>개월
				   						</c:if>
				   					</td>
				   					<td>
				   						<fmt:formatNumber value="${form.membershipPrice }" pattern="###,###"/>원
				   						<c:if test="${form.lockerPrice ne 0 }">
						   					<br/><br/>
						   					<fmt:formatNumber value="${form.lockerPrice }" pattern="###,###"/>원
				   						</c:if>
				   						<c:if test="${form.wearPrice ne 0 }">
						   					<br/><br/>
						   					<fmt:formatNumber value="${form.wearPrice }" pattern="###,###"/>원
				   						</c:if>
				   					</td>
			   					</tr>
			   					<tr>
			   						<th>
			   							상품 합계 금액<br/><br/>
			   							적립 포인트<br/><br/>
			   							부가세
			   						</th>
			   						<td></td>
			   						<td>
			   							<fmt:formatNumber value="${form.membershipOptionPrice }" pattern="###,###"/>원
			   							<br/><br/>
			   							${form.savePoint }P
			   							<br/><br/>
			   							+ <fmt:formatNumber value="${form.surtax }" pattern="###,###"/>P
			   						</td>
			   					</tr>
			   					<tr>
			   						<th>
			   							포인트 할인
			   							<br/><br/>
			   						</th>
									<td>
			   							사용 가능 적립금<strong> <span id="user-point">${user.point }</span>P</strong>
			   							<br/><br/>
			   						</td>
			   						<td>
			   							<input name="usePoint" type="number" min="0" style="width: 100px;" value="0">
			   							<a href="list" id="point-return" class="bi bi-arrow-clockwise"></a>
			   							<div style="margin: 3px; margin-left: -15px;">
				   							<button type="button" id="btn-all" class="btn btn-primary btn-sm" >전체</button>
				   							<button type="button"  id="btn-apply" class="btn btn-success btn-sm" >적용</button>
			   							</div>
			   						</td>
			   					</tr>
			   					<tr>
			   						<th>
			   							<strong>총 결제 금액</strong>
			   						</th>
			   						<td></td>
			   						<td>
			   							<strong style="font-size: 20px; color:red">
			   								<span id="total-price-text">
			   									<fmt:formatNumber value="${form.totalPrice }" pattern="###,###"/>
			   								</span>원
			   							</strong>
			   							<input type="hidden" name="totalPrice" value="${form.totalPrice }">
			   						</td>
			   					</tr>
			   				</thead>
						</table>
					</div>
					<div class="offset-1" style="margin: 100px;">
						<h4 class="text-start">
							<strong style="color:gray">시작일</strong>
						</h4>
						<hr style="border: 2px solid gray;"/>
						<div class="border border-black border-2 p-3 text-center" >
							<input name="startDate" type="date" style="width: 300px; height: 35px; " /> 
							<span class="ps-3 pe-3">~</span>
							<input name="endDateText" type="date" style="width: 300px; height: 35px; " disabled class="border-0"/>
							<input type="hidden" type="date" name="endDate">
						</div>
					</div>
<!-- 				<div class="offset-10">
						<a href="list" class="btn btn-danger">취소</a>
						<button type="submit" id="btn-order" class="btn btn-primary disabled">결제</button>
					</div>	 -->
					<button type="button" class="btn btn-warning" id="btn-kakao-pay" style="width: 400px; height: 50px; ">
						카카오페이로 결제하기
					</button>
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
    <script src="https://momentjs.com/downloads/moment.min.js"></script>
    <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
</body>
<script type="text/javascript">
$(function() {
	
	$("#btn-kakao-pay").click(function() {
		let usePoint = $("input[name=usePoint]").val();
		let totalPrice = $("input[name=totalPrice]").val();
		let startDate = $("input[name=startDate]").val();
		let endDate = $("input[name=endDate]").val();
		
		let data = {
			usePoint:usePoint,
			totalPrice:totalPrice,
			startDate:startDate,
			endDate:endDate
		}
		
		$.post("kakaopay-ready", data, function(response) {
			location.href= response.next_redirect_pc_url;
		}, 'json')
	})
	
	moment.locale("ko");
	
	let prevUserPoint = $("#user-point").text();
	let prevPrice = $("input[name=totalPrice]").val();
	
	$("#point-return").click(function (event) {
		event.preventDefault();
		
		$("#user-point").text(prevUserPoint);
		
		$("input[name=totalPrice]").val(prevPrice);
		
		let returnPriceText = new Number(prevPrice).toLocaleString();
		$("#total-price-text").text(returnPriceText);
		
		$("input[name=usePoint]").val(0);
		$("#btn-apply").removeClass("disabled");
	})
	
	$("#btn-all").click(function () {
		let allPoint = $("#user-point").text();
		$("input[name=usePoint]").val(allPoint);
		$("#user-point").text(0);
	});
	
	$("#btn-apply").click(function () {
		$(this).addClass("disabled")
		let totalPrice = $("input[name=totalPrice]").val();
		let usePoint = $("input[name=usePoint]").val();
		let userPoint = $("#user-point").text();
		
		if(usePoint > prevUserPoint) {
			alert("포인트가 부족합니다.");
			$(this).removeClass("disabled");
			return;
		}
		
		if(userPoint != 0) {
			userPoint = userPoint - usePoint;
			$("#user-point").text(userPoint);
		}
		
		totalPrice = totalPrice - usePoint;
		$("input[name=totalPrice]").val(totalPrice);
		
		let totalPriceText = new Number(totalPrice).toLocaleString();
		$("#total-price-text").text(totalPriceText);
	});
	
	$("input[name=startDate]").change(function () {
		let startDate = $(this).val();
		let today = moment().format("YYYY-MM-DD");
				
		let membershipPeriod = $("input[name=membership-period]").val();
		
		if(startDate < today) {
			alert("시작일은 " + today + "이후부터 가능합니다.");
			$(this).val();
			return;
		}
		
		let endDate =  moment(startDate).add(membershipPeriod, 'M').format("YYYY-MM-DD");
		
		$("input[name=endDateText]").val(endDate);
		$("input[name=endDate]").val(endDate);
		
		$("#btn-order").removeClass("disabled");
	})
})
</script>
</html>