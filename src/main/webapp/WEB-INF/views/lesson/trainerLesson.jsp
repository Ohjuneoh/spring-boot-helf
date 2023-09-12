<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <h1 class="display-4 text-white animated zoomIn">LESSONLIST</h1>
                <a href="" class="h5 text-white">수업 목록</a>
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
<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
    <div class="container py-5">
        <div class="row mb-3">
            <div class="col-12">
            	<div>
				    <button id="personal-lesson-button" class="btn btn-outline-primary mb-1 active" type="button" >개인수업</button>
				    <button id="group-lesson-button" class="btn btn-outline-primary mb-1" type="button">그룹수업</button>
				</div>
                <div class="card" >
                    <div class="card-header bg-dark" style="color: #ffffff">
                        <strong>수업 목록</strong>
                    </div>
                    <!-- GroupLesson start -->
                    <div id="group-lesson-list" class="card-body" style="display: none;">
                        <table class="table" id="table-lessons">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 15%">레슨 번호</th>
                                <th class="text-center" style="width: 20%">수업명</th>
                                <th class="text-center" style="width: 20%">신청인원/총 인원</th>
                                <th class="text-center" style="width: 20%">레슨시간</th>
                                <th class="text-center" style="width: 25%">출석체크</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="lesson" items="${createList }">
                                <tr>
                                    <td class="text-center" >${lesson.no }</td>
                                    <td class="text-center" >${lesson.name }</td>
                                    <td class="text-center" >${lesson.reqCnt }/${lesson.quota }</td>
                                    <td class="text-center" ><fmt:formatDate value="${lesson.date }" pattern="yyyy년 M월 d일" /> ${lesson.time }시</td>
                                    <td class="text-center" ><button type="button" data-lesson-no="${lesson.no}" data-bs-toggle="modal" data-bs-target="#insert" class="btn btn-primary btn-sm">출석</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 트레이너가 출석버튼 클릭시 뜨는 모달 창 -->
                        <div class="modal fade" id="insert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">출석</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">
                                        <input type="hidden" id="current-lesson-no" />
                                        <table class="table" id="table-users" >
                                            <thead>
                                            <tr>
                                                <th style="width:35%">수강생 명</th>
                                                <th style="width:30%">출석상태</th>
                                                <th style="width:35%">출석체크</th>
                                            </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>

                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- GroupLesson end -->
                    <!-- PersonalLesson start  -->
              		<div id="personal-lesson-list" class="card-body">
                        <table class="table" id="table-personal-users">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 10%">번호</th>
                                <th class="text-center" style="width: 25%">고객명</th>
                                <th class="text-center" style="width: 20%">시작날짜</th>
                                <th class="text-center" style="width: 20%">남은 회원권</th>
                                <th class="text-center" style="width: 25%">출석체크</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="consultation" items="${consultationList }">
                                <tr>
                                    <td class="text-center">${consultation.consultationNo } </td>
                                    <td class="text-center">${consultation.user.name } </td>
                                    <td class="text-center"><fmt:formatDate value="${consultation.applicationDate }" pattern="yyyy년 M월 d일" /></td>
                                    <td class="text-center">${consultation.myMembership.remainderCnt } 회 </td>
                                    <td class="text-center">
                                    	<button type="button" class="btn btn-primary attendance-btn btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
									        data-membership-no="${consultation.myMembership.no}" 
									        data-trainer-no="${consultation.trainer.trainerNo}" 
									        data-user-id="${consultation.user.id}"
									        data-user-name="${consultation.user.name}">
									        출석
									    </button>
									</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 트레이너가 출석버튼 클릭시 뜨는 모달 창 -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"> 
						    <div class="modal-content">
						      <div class="modal-header bg-light">
						        <h5 class="modal-title text-primary" id="staticBackdropLabel"></h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
									<input id="modal-membershipNo" name="membershipNo" type="hidden"  />
									<input id="modal-trainerNo" name="trainerNo" type="hidden"/>
									<input id="modal-userId" name="userId" type="hidden"/>
						      	<table class="table" id="table-personal-lessons" >
	                                <thead>
	                                 <tr class="text-center">
	                                     <th style="width:10%">번호</th>
	                                     <th style="width:30%">수업날짜</th>
	                                     <th style="width:20%">수업시간</th>
	                                     <th style="width:20%">상태</th>
	                                     <th style="width:20%">출석</th>
	                                 </tr>
	                                </thead>
	                                <tbody></tbody>
                              	</table>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                    <!-- Personal Lesson end  -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/lib/wow/wow.min.js"></script>
<script src="/resources/lib/easing/easing.min.js"></script>
<script src="/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/lib/counterup/counterup.min.js"></script>
<script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/js/main.js"></script>

<script>
	//display
	$(document).ready(function(){
	    $("#personal-lesson-button").click(function(){
	        $(this).addClass('active');
	        $("#group-lesson-button").removeClass('active');
	        $("#group-lesson-list").hide();
	        $("#personal-lesson-list").show();
	    });
	
	    $("#group-lesson-button").click(function(){
	        $(this).addClass('active');
	        $("#personal-lesson-button").removeClass('active');
	        $("#personal-lesson-list").hide();
	        $("#group-lesson-list").show();
	    });
	});
    // 트레이너가 개설한 그룹수업에 대해서 수강생 조회
    $(function() {
        $("#table-lessons tbody button").click(function() {

            let $tbody = $('#table-users tbody').empty();

            let lessonNo = $(this).attr('data-lesson-no');
            $("#current-lesson-no").val(lessonNo);
            $.getJSON("trainer-user-apply", {lessonNo:lessonNo}, function(LessonApplies) {

                if (LessonApplies.length === 0) {
                        let tr = `
                         <tr>
                                <td colspan="3">신청한 수강생이 존재하지 않습니다.</td>
                            </tr>
                    `
                        $tbody.append(tr);
                } else {
                    LessonApplies.forEach(function(apply, index) {
                        console.log(apply);
                        let tr = `

                            <tr>
                                <td>\${apply.user.name }</td>
                                <td>\${apply.attendanceStatus }</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-select="\${apply.user.id }">출석</button>
                                    <button type="button" class="btn btn-danger btn-sm" data-select="\${apply.user.id }">결석</button>
                                </td>
                            </tr>
                        `;
                        $tbody.append(tr);
                    })

                }
            })
        });
        // 모달창에 출석버튼 클릭 시
        $("#table-users tbody").on('click', '.btn-primary', function(){
            alert("출석처리가 완료되었습니다.");
            let $button1 = $(this);
            let $button2 = $(this).next();
            let lessonNo = $('#current-lesson-no').val();
            let userId = $button1[0].dataset.select;
            $.getJSON("trainer-user-attendance", {lessonNo:lessonNo,status:'Y', userId:userId}, function() {
                $button1.addClass('disabled');
                $button2.removeClass('disabled');
            })
        })
        // 모달창에 결석버튼 클릭 시
        $("#table-users tbody").on('click', '.btn-danger', function() {
            alert("결석처리가 완료되었습니다.");
            let $button1 = $(this).next;
            let $button2 = $(this);
            let lessonNo = $('#current-lesson-no').val();
            let userId = $button2[0].dataset.select;
            $.getJSON("trainer-user-attendance", {lessonNo:lessonNo,status:'N', userId:userId}, function() {
                $button1.removeClass('disabled');
                $button2.addClass('disabled');
            })
        })
    })
    //개인수업 모달로 데이터 전송
	$(document).ready(function() {
	    $('.attendance-btn').click(function() {
	        var membershipNo = $(this).data('membership-no');
	        var trainerNo = $(this).data('trainer-no');
	        var userId = $(this).data('user-id');
	        var userName = $(this).data('user-name');
	        
	        $("#modal-userName").val(userName);
	        $('#modal-membershipNo').val(membershipNo);
	        $('#modal-trainerNo').val(trainerNo);
	        $('#modal-userId').val(userId);
	    });
	});
    //트레이너에게 신청한 유저의 수업 조회
    $(function() {
    $("#table-personal-users tbody button").click(function() {

        let $tbody = $('#table-personal-lessons tbody').empty();

        let membershipNo = $(this).attr('data-membership-no');
        let trainerNo = $(this).attr('data-trainer-no');
        let userId = $(this).attr('data-user-id');
        $("#modal-membershipNo").val(membershipNo);
        $("#modal-trainerNo").val(trainerNo);
        $("#modal-userId").val(userId);
        $.getJSON("trainer-user-consultation", {membershipNo:membershipNo, trainerNo:trainerNo, userId:userId}, function(Consultation) {
        	Consultation.forEach(function(lessonList, index) {
        	    console.log(lessonList);
        	    var date = new Date(lessonList.date);
        	    var formattedDate = date.toLocaleDateString();
        	    let statusText;
        	    
        	    if (lessonList.status === 'Y') {
        	        statusText = '출석';
        	    } else if (lessonList.status === 'N') {
        	        statusText = '결석';
        	    } else if (lessonList.status === 'W') {
        	        statusText = '대기중';
        	    } else {
        	        statusText = '알 수 없는 상태'; // 만약 미리 정의되지 않은 상태 값이 있으면
        	    }

        	    let tr = `
        	    <tr>
        	        <td class="text-center">\${lessonList.no }</td>
        	        <td class="text-center">\${formattedDate }</td>
        	        <td class="text-center">\${lessonList.time }</td>
        	        <td class="text-center"  id="status-\${lessonList.no }">\${statusText }</td>
        	        <td class="text-center">
        	            <button type="button" class="btn btn-primary btn-sm" data-select="\${lessonList.no }">출석</button>
        	            <button type="button" class="btn btn-danger btn-sm" data-select="\${lessonList.no }">결석</button>
        	        </td>
        	    </tr>
        	    `;
        	    $tbody.append(tr);
        	});
        });
    });
});
    //유저의 이름 표시
    $(document).ready(function(){
	    $(".attendance-btn").click(function(){
	        var userName = $(this).data('user-name');
	        $("#staticBackdropLabel").text(userName + '님 수업목록');
	    });
	});
    // 개인수업 모달창에 출석버튼 클릭 시
    $("#table-personal-lessons tbody").on('click', '.btn-primary', function() {
        let $button1 = $(this);
        let $button2 = $(this).next();
        let lessonNo = $button1[0].dataset.select;
        $.getJSON("personal-lesson-attendance", {lessonNo: lessonNo, status: 'Y'}, function() {
            $button1.addClass('disabled');
            $button2.removeClass('disabled');
        })
    });
    // 개인수업 모달창에 결석버튼 클릭 시 
        $("#table-personal-lessons tbody").on('click', '.btn-danger', function() {
	        let $button1 = $(this).prev();
	        let $button2 = $(this);
	        let lessonNo = $button2[0].dataset.select;
	        $.getJSON("personal-lesson-attendance", {lessonNo: lessonNo, status: 'N'}, function() {
	            $button1.removeClass('disabled');
	            $button2.addClass('disabled');
	        })
	    });
</script>


</body>

</html>