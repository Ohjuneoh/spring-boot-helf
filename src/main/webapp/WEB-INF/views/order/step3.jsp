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
			<div class="text-center ">
				<div style="margin-bottom: 150px;">
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
			  	</div>
		  		<form action="kakaopay-ready" method="post">
					<div class="offset-1" style="margin: 0 auto; width:900px;">
						<h4 class="text-start">
							<strong style="color:gray">결제내역</strong>
						</h4>
						<hr style="border: 2px solid gray;"/>
						<div class="d-flex align-items-center justify-content-center" style="margin-top: 50px;">
							<table class="table table-bordered" style="width: 800px; table-layout: fixed;">
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
				   							<fmt:formatNumber value="${form.savePoint }" pattern="###,###"/>P
				   							<br/><br/>
				   							+ <fmt:formatNumber value="${form.surtax }" pattern="###,###"/>P
				   						</td>
				   					</tr>
				   					<tr>
				   						<th>
				   							<p>
				   								포인트 할인
				   								<button style="background-color: transparent; border: none;"
												        data-bs-toggle="tooltip" data-bs-placement="top"
												        data-bs-custom-class="custom-tooltip"
												        data-bs-title="4000P 이상부터 사용이 가능합니다.">
					   								<i class="bi bi-exclamation-circle-fill"></i>
				   								</button>
				   							</p>
				   						</th>
										<td>
				   							<p>
					   							사용 가능 적립금
					   							<strong> <span id="user-point">${user.point }</span>P</strong>
					   							<br/>
				   							</p>
				   							<c:if test="${user.point lt 4000 }">
				   							</c:if>
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
					</div>
					<div style="margin-top:100px;"></div>
					<div class="offset-1" style="margin: 0 auto; width:900px;">
						<h4 class="text-start">
							<strong style="color:gray">시작일 설정</strong>
						</h4>
						<hr style="border: 2px solid gray; margin-bottom: 50px;"/>
					</div>
					<div class="offset-1" style="margin: 0 auto; width:800px;">
						<div class="border border-black border-2 p-3 text-center">
							<div style="margin-bottom: 10px;">
								<span style="float: left;">
									<span style="margin-left: 60px; size: 20px;" class="badge bg-primary">시작일</span>
								</span>
								<span>
									<span class="badge bg-primary" style="size: 20px;">만기일</span>
								</span>
							</div>
							<input name="startDate" type="date" style="width: 300px; height: 35px; " /> 
							<span class="ps-3 pe-3">~</span>
							<input name="endDateText" type="date" style="width: 300px; height: 35px; " disabled class="border-0"/>
							<input type="hidden" type="date" name="endDate">
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-center" style="margin-top: 100px;">
    					<span class="text-start mr-3" style="margin-right: 10px; color:black;">
    						<strong>
	    						카톡 하나로 결제 끝<br/>
	    						<span style=" text-decoration: underline; text-decoration-color: yellow; text-decoration-thickness: 5px;
	    									  text-underline-offset: -3px;">
	    							카카오페이
	    						</span>
    						</strong>
    					</span>
					    <button type="button" id="btn-kakao-pay" class="border-0 bg-white" disabled>
					    	<img src="/resources/img/kakaopay/kakaopay button.png" style="height: 50px;">
					    </button>
					</div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
</body>
<script type="text/javascript">
$(function() {
	
	// 툴팁 활성화
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
	let userPointText = $("#user-point").text();
	let userPoint = parseInt(userPointText);
	if(userPoint < 4000) {
		$("#btn-all").prop("disabled", true);
		$("#btn-apply").prop("disabled", true);
		$("input[name=usePoint]").prop("disabled", true);
		$("#point-return").addClass("disabled");
	}
	
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
		$("#btn-all").removeClass("disabled");
	})
	
	$("#btn-all").click(function () {
		let allPoint = $("#user-point").text();
		$("input[name=usePoint]").val(allPoint);
		$("#user-point").text(0);
		$(this).addClass('disabled');
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
			$(this).val("");
			$("#btn-kakao-pay").prop("disabled", true);
			$("input[name=endDateText]").val("");
			return;
		}
		
		let endDate =  moment(startDate).add(membershipPeriod, 'M').format("YYYY-MM-DD");
		
		$("input[name=endDateText]").val(endDate);
		$("input[name=endDate]").val(endDate);
		
		$("#btn-kakao-pay").removeAttr("disabled");
	})
})
</script>
</html>