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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Datetime Picker -->
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
</head>
<!-- 위에 모든 페이지까지 공통부분 건들 x -->
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp" />
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="수업"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">CONSULTATION</h1>
                    <a href="" class="h5 text-white">상담신청</a>
                    
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
   	<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;" id="trainer-select">
        <div class="container py-5">
		 	<form class="" id="group-lesson-form" >
		    	<div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
	        		<div class="container ">
	            		<div class="row g-1" >
                    		<div class="section-title position-relative pb-3 mb-5">
                        		<h1 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">STEP1</h1>
                        		<h2 class="mb-3" >트레이너를 선택해주세요</h2>
                        		<h6 class="mb-0" >해당 강사에게 무료 PT 상담 요청이 진행되며, 회원님의 담당강사로 배정되어 1:1 상담 및 관리를 해드립니다.</h6>
								<h6 class="mb-0">센터의 사정에 의해 다른 담당강사가 배정될 수 있습니다. 배정된 담당강사가 확인 후 회원님께 연락을 드립니다</h6>
			               	</div>
			               	<c:forEach var="trainer" items="${trainers}">
			               	<div class="col-6" >
	            				<img src="/resources/img/${trainer.trainerFile}"  class="img-fluid"/>
	            			</div>
		           			<div class="col-3"> 
		            			<h1 class="mb-5">${trainer.user.name}<strong style="margin-left: 10px; color: gray;">강사</strong></h1>
		            			<h4 class="mb-3">주요 약력</h4>
		            			<c:forEach var="career" items="${trainer.careers}">
								    <h6 class="text-muted mb-3">
								        <fmt:formatDate value="${career.careerStartDate}" pattern="yyyy-MM" /> ~ <fmt:formatDate value="${career.careerEndDate}" pattern="yyyy-MM" />
								        <span><strong>${career.careerName}</strong></span>
								    </h6>
								</c:forEach>
		            		</div>
		            		<div class="col-3"> 
		            			<button class="btn btn-primary btn-lg" data-trainer-no="${trainer.trainerNo}">선택하기</button>
		            		</div>
		            		<hr width="90%" color="gray"></hr>
		            		</c:forEach>
				    	</div>
				 	</div>
				</div>
		 	</form>
        </div>
    </div>
    <div class="container-fluid py-0"  style="margin-top: 1px; display:none;" id="registration-form">
    	<div class="container py-5">
			<div class="container-fluid d-flex justify-content-center" data-wow-delay="0.1s" >
	        	<div class="container ">
	            	<div class="row g-1" >
                    	<div class="section-title position-relative pb-3 mb-5">
                        	<h1 class="fw-bold text-primary text-uppercase" >STEP2</h1>
                        	<h5 class="mb-0" >상담 내용을 입력해주세요</h5>
						</div>
				    </div>
				</div>
			</div>
		 	<form>
		 		<input type="hidden" id="trainerNumber" name="trainerNumber">
					<div class="row g-1">
				    	<div class="col-12">
				    		<h3 class="mb-2 text-primary" >PT 목표</h3>
				        		<input id="goal" type="text" class="form-control bg-light border-0" name="goal" placeholder="PT를 통해 궁극적으로 이루고자하는 구체적인 목표나 기대가 있으시면 기재 바랍니다." style="height: 55px;">
				    	</div>
						<div class="col-12">
							<h3 class="mb-2 mt-2 text-primary" >신체 이상유무</h3>	
							<textarea id="abnormalities" class="form-control bg-light border-0" name="abnormalities" style="height: 300px;" placeholder="육체적, 정신적(골절, 고혈압, 당뇨 등) 병력 및 신체 이상 사항이 있으신 경우 자세히 기재 바랍니다."></textarea>
						</div>
						<div class="col-3">
					    	<div class="input-group">
					        	<span class="input-group-text bg-light border-0"><i class="bi bi-calendar-check-fill"></i></span>
					        	<input type="text" class="form-control bg-light border-0" name="date" id="date" style="height: 55px;" placeholder="희망 상담일">
					    	</div>
						</div>
				    	<div class="col-3">
					    	<div class="input-group">
					        	<span class="input-group-text bg-light border-0"><i class="bi bi-alarm-fill"></i></span>
					        	<input type="text" class="form-control bg-light border-0" name="time" id="time" style="height: 55px;" placeholder="희망 상담시간">
					    	</div>
						</div>
						<div class="col-6 text-end mt-2">
						    <button type="button" id="consultation-back" class="btn btn-secondary">이전</button>
						    <button type="button" id="next" class="btn btn-primary ">다음</button>
						</div>    
					</div>
		 	</form>
        </div>
    </div>
     <div class="container-fluid py-5" id="membership-list" style="display:none;">
        <div class="container py-5">
            <div class="section-title position-relative pb-3 mb-5">
        			<h1 class="fw-bold text-primary text-uppercase" >STEP3</h1>
        			<h5 class="mb-0" >사용하실 회원권을 선택해주세요</h5>
			</div>
			<form method="post" action="/personal-lesson/consultation" id="mainForm">
				<input type="hidden" name="trainerNumber" id="final-trainerNumber">
			    <input type="hidden" name="goal" id="final-goal">
			    <input type="hidden" name="abnormalities" id="final-abnormalities">
			    <input type="hidden" name="date" id="final-date">
			    <input type="hidden" name="time" id="final-time">
	            <div class="row g-5">
	           		<c:choose>
	           			<c:when test="${not empty memberships}">
			            	<c:forEach var="mymembership" items="${memberships}">
				                <div class="col-lg-4 col-md-6 " >
				                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
				                        <div class="service-icon">
				                            <i class="fa fa-user-tie text-white"></i>
				                        </div>
				                        <h4 class="mb-3">${mymembership.membership.name}</h4>
				                        <div class="w-100 text-start px-1"> 
				            				<p class="m-0">
				               					<span class="label-text"><strong>멤버십 구매일 :</strong></span> 
				               					<span class="date-text">${mymembership.myMembership.startDate}</span>
				            				</p>
				            				<p class="m-0">
				               					<span class="label-text"><strong>멤버십 만료일 :</strong></span> 
				               					<span class="date-text">${mymembership.myMembership.endDate}</span>
				            				</p>
				            				<p class="m-0">
				               					<span class="label-text"><strong>남은 횟수 : </strong></span> 
				               					<span class="date-text">${mymembership.myMembership.remainderCnt}</span>
				            				</p>
				       					</div>
				                        <button type="button" class="selectBtn btn btn-primary btn-sm"  data-membership-no="${mymembership.myMembership.no}">선택</button>
				                    </div>
				                </div>
			                </c:forEach>
			        	</c:when>
			        	<c:otherwise>
	                        <div class="col-12">
	                            <strong>보유중인 회원권이 없습니다.</strong>
	                        </div>
                    	</c:otherwise>     
		        	</c:choose>        
		        	<div class="col-12 text-end mt-2">
						    <button type="button" id="membership-back" class="btn btn-secondary">이전</button>
					</div> 
	            </div>
            </form>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
    
<script>
//데이트피커
$( function() {
    $("#date").datepicker({
   		dateFormat: 'yy/mm/dd'
    });
});
$( function() {
    $("#time").datetimepicker({
    	  datepicker:false,
    	  format:'H:i'
	});
});

$(document).ready(function() {
    // trainer-select 내의 신청하기 버튼에 클릭 이벤트 리스너 추가
    $('#trainer-select').on('click', '.btn-primary', function(event) {
        event.preventDefault();
        var trainerNo = $(this).data('trainer-no');

        $('#trainer-select').hide();
        $('#registration-form').show();

        $('#registration-form input[name="trainerNumber"]').val(trainerNo);
    });

    //상담페이지 이전 버튼에 클릭 이벤트 리스너 추가
    $('#consultation-back').click(function(event) {
        event.preventDefault();
        $('#trainer-select').show();
        $('#registration-form').hide();
    });

    //상담페이지 다음 버튼에 클릭 이벤트 리스너 추가
    $('#next').click(function(event) {
        event.preventDefault();
        $('#final-trainerNumber').val($('#trainerNumber').val());
        $('#final-goal').val($('#goal').val());
        $('#final-abnormalities').val($('#abnormalities').val());
        $('#final-date').val($('#date').val());
        $('#final-time').val($('#time').val());
        $('#registration-form').hide();
        $('#membership-list').show();
    });
    //회원권 선택 페이지 이전 버튼에 클릭 이벤트 리스너 추가
    $('#membership-back').click(function(event) {
        event.preventDefault();
        $('#registration-form').show();
        $('#membership-list').hide();
    });

    // registration-form의 제출 이벤트에 리스너 추가
    $('#registration-form').submit(function(event) {
        // 알림을 띄운다.
        alert('신청이 완료되었습니다.');
    });
});
//membershipNo를 input 박스로 전달
$(document).ready(function(){
    $(".selectBtn").click(function(){
        var membershipNoValue = $(this).data("membership-no");
        
        var inputField = $("<input>").attr({
            type: "hidden",
            name: "membershipNo",
            value: membershipNoValue
        });

        $("#mainForm").append(inputField).submit();
    });
});
</script>
    
    
</body>

</html>
