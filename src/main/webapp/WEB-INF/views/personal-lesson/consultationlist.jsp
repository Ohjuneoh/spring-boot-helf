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
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Datetime Picker -->
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
</head>

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
                    <h1 class="display-4 text-white animated zoomIn">CONSULTATIONLIST</h1>
                    <a href="" class="h5 text-white">상담내역</a>
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
    <div class="container-fluid mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container ">
            <div class="section-title text-start position-relative pb-3 mb-5" style="max-width: 600px;">
                <h1 class="fw-bold text-primary text-uppercase">상담신청 목록</h1>
                <h5 class="mb-0">목록을 확인하세요</h5>
            </div>
            <c:choose>
	            <c:when test="${empty consultations}">
	        		<div><strong>조회된 회원이 없습니다.</strong></div>
	    		</c:when>
	    		<c:otherwise>
		            <div class="row g-0">
			            <c:forEach var="consultation" items="${consultations}">
			                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
			                    <div class="bg-white rounded shadow position-relative m-2" style="z-index: 1;">
			                        <div class="border-bottom py-4 px-5 mb-4">
			                            <h5 class="text-primary mb-2"></h5>
			                            <c:choose>
										    <c:when test="${consultation.consultations.consultationStatus eq '대기중'}">
										        <div class="text-success"><strong>신규회원</strong></div>
										    </c:when>
										    <c:when test="${consultation.consultations.consultationStatus eq '수강중'}">
										        <div class="text-primary"><strong>예약회원</strong></div>
										    </c:when>
										</c:choose>
			                            <h4 class="text-uppercase">${consultation.user.name} 회원님</h4>
			                        </div>
			                        <div class="p-5 pt-0">
			                            
			                            <c:choose>
										    <c:when test="${consultation.consultations.consultationStatus eq '상담완료'}">
										        <div class="d-flex justify-content-between mb-3"><strong>상태 :</strong><span class="text-primary"><strong>${consultation.consultations.consultationStatus}</strong></span><i class="fa fa-bell text-primary pt-1 text-end"></i></div>
										    </c:when>
										    <c:otherwise>
										        <div class="d-flex justify-content-between mb-3"><strong>상태 :</strong><span>${consultation.consultations.consultationStatus}</span><i class="fa fa-bell text-primary pt-1 text-end"></i></div>
										    </c:otherwise>
										</c:choose>
			                            <div type="date" class="d-flex justify-content-between mb-3"><strong>신청일 :</strong><span><fmt:formatDate value="${consultation.consultations.applicationDate}" pattern="yyyy-MM-dd" /></span><i class="fa fa-calendar text-secondary pt-1 text-end"></i></div>
			                            <div class="d-flex justify-content-between mb-3"><strong>상담 요청일 :</strong><span><fmt:formatDate value="${consultation.consultations.requestDate}" pattern="yyyy-MM-dd" /></span><i class="fa fa-calendar text-primary pt-1 text-end"></i></div>
			                            <div class="d-flex justify-content-between mb-3"><strong>상담 요청시간 :</strong><span>${consultation.consultations.requestTime}</span><i class="fa fa-clock text-primary pt-1 text-end"></i></div>
			                            <div class="d-flex justify-content-center">
										<button type="button" class="btn btn-primary py-2 px-4 mt-5" data-bs-toggle="modal" data-bs-target="#myModal"  
										    data-username="${consultation.user.name}님 1:1수업" data-userid="${consultation.user.id}" data-trainerno="${consultation.consultations.trainer.trainerNo}" 
										    data-mymembershipno="${consultation.consultations.myMembership.no}" data-consultationno="${consultation.consultations.consultationNo}"
										    data-consultation-goal="${consultation.consultations.goal}" data-consultation-abnormalities="${consultation.consultations.abnormalities}">예약</button>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </c:forEach>
		            </div>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
				<div class="modal-header bg-primary">
				  <h5 class="modal-title text-light" id="exampleModalLabel"><span id="modal-userName"></span></h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="lessonSubmitForm" method="post" action="/personal-lesson/list">
						<input id="modal-userId" type="hidden" name="userId"/>
						<input id="modal-trainerNo" type="hidden" name="trainerNo"/>
						<input id="modal-myMembershipNo" type="hidden" name="myMembershipNo"/>
						<input id="modal-consultationNo" type="hidden" name="consultationNo"/>
						<div id="modal-1" class="row g-1">
		        			<div class="col-12">
								<h5 class="mb-2 mt-2 text-primary" > 회원님의 PT목표</h5>	
								<input id="modal-consultationGoal" name="goal" class="form-control bg-light border-0" style="height: 55px; font-weight: bold;" readonly></input>
							</div>
							<div class="col-12">
								<h5 class="mb-2 mt-2 text-primary" > 회원님의 상담내용</h5>	
								<input  id="modal-consultationAbnormalities" name="abnormalities" class="form-control bg-light border-0"  style="height: 300px; font-weight: bold;" readonly></input>
							</div>
						</div>
						<div id="next-button" class="modal-footer">
						  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  >닫기</button>
						  <button type="button" class="btn btn-primary next-button" >다음</button>
						</div>
						<div id="modal-2" class="row g-1" style="display :none" >
						    <div class="col-12">
						        <h3 class="mb-2 mt-2 text-primary">수업명</h3>
						        <input id="lessonName" type="text" class="form-control bg-light border-0" name="lessonName" style="height: 55px;">
						    </div>
						    <div class="col-12">
						        <h3 class="mb-2 mt-2 text-primary">수업 내용</h3>
						        <textarea id="content" class="form-control bg-light border-0" name="content" style="height: 300px;"></textarea>
						    </div>
						    <div class="col-12">
						        <div class="row g-1">
						            <div class="col-6">
						                <div class="input-group">
						                    <span class="input-group-text bg-light border-0"><i class="bi bi-calendar-check-fill"></i></span>
						                    <input type="text" class="form-control bg-light border-0" name="date" id="date" style="height: 55px;" placeholder="수업일">
						                </div>
						            </div>
						            <div class="col-6">
						                <div class="input-group">
						                    <span class="input-group-text bg-light border-0"><i class="bi bi-alarm-fill"></i></span>
						                    <input type="text" class="form-control bg-light border-0" name="time" id="time" style="height: 55px;" placeholder="시간">
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
						<div id="submit-button" class="modal-footer"  style="display :none">
						  <button type="button" class="btn btn-success back-button" >이전</button>
						  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  >닫기</button>
						  <button type="submit" class="btn btn-primary" >개설</button>
						</div>
					</form>		
				</div>
    		</div>
	  	</div>
	</div>
    <!-- Lesson Register Form End  -->

    <!-- Footer End -->
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
    
<script>
$(document).ready(function() {
    $('#myModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);  
        var username = button.data('username');
        var userid = button.data('userid');
        var trainerno = button.data('trainerno');
        var mymembershipno = button.data('mymembershipno');
        var consultationno = button.data('consultationno');
        var abnormalities = button.data('consultation-abnormalities');
        var goal = button.data('consultation-goal');
        $('#modal-userName').text(username); 
        $('#modal-userId').val(userid); 
        $('#modal-trainerNo').val(trainerno); 
        $('#modal-myMembershipNo').val(mymembershipno);
        $('#modal-consultationNo').val(consultationno);
        $('#modal-consultationAbnormalities').val(abnormalities);
        $('#modal-consultationGoal').val(goal);
    });
});

$( function() {
    $("#date").datepicker({
   		dateFormat: 'yy-mm-dd'
    });
});

$( function() {
    $("#time").datetimepicker({
    	  datepicker:false,
    	  format:'H:i'
	});
});

$(document).ready(function() {
	
	var timePattern = /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/;
	
    $('#lessonSubmitForm').on('submit', function(e) {
        // 폼의 기본 제출 기능을 방지
        e.preventDefault();

        // 유효성 검사
        if ($('#lessonName').val().trim() === "") {
            alert("수업명을 입력하세요.");
            $('#lessonName').focus();
            return;
        }
        
        if ($('#content').val().trim() === "") {
            alert("수업 내용을 입력하세요.");
            $('#content').focus();
            return;
        }

        var datePattern = /^\d{4}-\d{2}-\d{2}$/; 
        if(!datePattern.test($('#date').val().trim())) {
            alert('올바른 날짜 형식을 입력하세요.');
            $('#date').focus();
            return;
        }

        if ($('#time').val().trim() === "") {
            alert("수업 시간을 입력하세요.");
            $('#time').focus();
            return;
        }
        
        if (!$.trim($("#time").val()) || !timePattern.test($("#time").val().trim())) {
            alert("올바른 희망 상담시간을 입력해주세요 (예: 16:00, 17:00).");
            $("#time").focus();
            return;
        }

        // 폼 데이터 수집
        var formData = $(this).serialize();

        // 데이터를 서버에 POST 방식으로 제출
        $.ajax({
            type: 'POST',
            url: '/personal-lesson/list', // 폼의 action 속성 값
            data: formData, // 수집한 폼 데이터
            success: function(response) {
                // 서버에서 성공적인 응답을 받았을 때
                alert('개설이 완료되었습니다.');
                window.location.href = "/personal-lesson/list"; 
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // 에러 발생 시 처리
                console.error("Error:", errorThrown);
                alert('개설 중 오류가 발생했습니다.');
            }
        });
    });
});

$(document).ready(function(){
    $(".next-button").click(function(){
      $("#next-button").css("display", "none");
      $("#modal-1").css("display", "none");
      $("#modal-2").css("display", "block");
      $("#submit-button").css("display", "block");
    });

    $(".back-button").click(function(){
      $("#next-button").css("display", "block");
      $("#modal-1").css("display", "block");
      $("#modal-2").css("display", "none");
      $("#submit-button").css("display", "none");
    });
  });

</script>

    
</body>

</html>