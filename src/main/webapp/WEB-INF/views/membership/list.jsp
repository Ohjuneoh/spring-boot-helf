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
                    <h1 class="display-4 text-white animated zoomIn">MY MEMBERSHIP</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="searchModal" tabindex="-1">
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
				<h5 class="fw-bold text-primary text-uppercase">Your Membership List</h5>
				<h1 class="mb-0">나의 이용권을 확인하세요</h1>
			</div>
		</div>
		<div class="offset-2 col-lg-8 col-md-6 wow zoomIn row g-5 align-items-center justify-content-center text-center">
			<c:if test="${param.error eq 'no-authority' }">
				<div class="alert alert-danger" style="height: 50px; width: 600px;">
					<strong>[잘못된 접근]</strong> 권한이 없습니다.
				</div>
			</c:if>
			<c:if test="${param.error eq 'no-refund' }">
				<div class="alert alert-danger" style="height: 50px; width: 600px;">
					<strong>[잘못된 접근]</strong> 해당 이용권은 취소기간이 지났기 때문에 환불이 불가합니다.
				</div>
			</c:if>
			<c:if test="${empty list }">
				<div class="d-grid gap-2 col-6 mx-auto align-items-center justify-content-center text-center">
					<div>
						<h4 style="color:gray"><strong>구매하신 이용권이 없습니다.</strong></h4>
					</div>
				</div>
			</c:if>
		</div>
		
		<c:forEach var="myMembership" items="${list }">
			<div class="d-grid gap-2 col-6 mx-auto align-items-center justify-content-center text-center"
				 data-bs-toggle="modal" data-bs-target="#detail-modal-${myMembership.no }">
				<button id="btn-my-membership-${myMembership.no }" type="button" class="btn btn-outline-info d-inline-block" 
						style="margin: 30px; height: 200px; width: 600px;">
					<div class="service-item rounded d-flex flex-column align-items-center justify-content-center text-center "
     					 style="height: 100px;">
						<div class="service-icon">
							<i class="bi bi-trophy-fill text-white"></i>
						</div>
					</div>
					${myMembership.name }
				</button>
			</div>
			
			<!-- 상세정보 모달 -->
			<div class="modal" id="detail-modal-${myMembership.no }" tabindex="-1" aria-labelledby="exampleModalLabel" 
				 aria-hidden="true">
		  		<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">상세정보</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="card" >
								<div class="card-header bg-primary" style="color: #ffffff">
									<strong style="color:white">${myMembership.name }</strong>
								</div>
								<div class="card-body align-items-center justify-content-center text-center">
									<table class="table">
			                    		<tbody>
			                        		<tr>
			                            		<th>기간</th>
			                            		<td>${myMembership.startDate } ~ ${myMembership.endDate }</td>
			                        		</tr>
			                       			<c:if test="${myMembership.type eq '횟수' }">
				                       			<tr>
				                           			<th>횟수</th>
				                           			<td>${myMembership.remainderCnt }회</td>
				                       			</tr>
				                        	</c:if>
				                          	<tr>
				                            	<th class="${empty myMembership.myOptionJoins ? 'border-bottom-0' : '' }" >상태</th>
				                            	<td class="${empty myMembership.myOptionJoins ? 'border-bottom-0' : '' }" >
				                            		${myMembership.state }
				                            	</td>
				                           	</tr>
				                           	<c:if test="${not empty myMembership.myOptionJoins }">
				                     			<tr>
				                            		<th class="align-middle border-bottom-0" >옵션</th>
				                            		<td class="border-bottom-0" >
				                            			<c:forEach var="myOption" items="${myMembership.myOptionJoins }">
					                            			<div>
																${myOption.name }
					                            			</div>
														</c:forEach>
				                            		</td>
				                            	</tr>
				                            </c:if>
				                        </tbody>
		                    		</table>
		                    	</div>
		                    </div>
						</div>
						<div class="align-items-end justify-content-end text-end" style="margin: 15px;">
							<button id="btn-refund-${myMembership.no }" class="btn btn-danger" 
									data-membership-no="${myMembership.no }">환불하기</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 삭제확인 모달 -->
		<div class="modal" id="deleted-check-Modal" tabindex="-1" aria-labelledby="deletedCheckModalLabel" 
   			 aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5>삭제확인</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <strong>해당 이용권을 정말 환불하시겠습니까?</strong>
		            </div>
		            <div class="modal-footer">
		                <button id="btn-cancell" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		                <form action="wait-refund" method="post">
		                    <button type="submit" class="btn btn-danger">확인</button>
		                    <input type="hidden" name="no">
		                </form>
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
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://momentjs.com/downloads/moment.min.js"></script>
    <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
    

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
</body>
<script type="text/javascript">
let myModal = new bootstrap.Modal(document.getElementById("deleted-check-Modal"));

$(function () {
	$("[id^=btn-refund]").on('click', function () {
		let myMembershipNo = $(this).attr('data-membership-no');
		$("input[name=no]").val(myMembershipNo);
		
		$("[id^=detail-modal]")
			.removeClass("show")
			.removeClass("fade")
			.removeAttr("aria-modal")
			.removeAttr("role")
			.attr("aria-hidden", "true")
			.hide();	
		
		myModal.show();
	});
	
	$("#btn-cancell").on('click', function () {			
		 location.reload()
	})
})
</script>
</html>