<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">
<style>
.card-img-top {
    width: 5px;
    height: auto;
}
.grid {
    display: flex;
    flex-direction: column;
}

.g-row {
    display: flex;
}

.g-col-6 {
    flex: 0 0 50%; /* This ensures that the column takes up 50% of the parent width */
}

.text-center {
    text-align: center;
}

/* If you want a space between the rows, you can use margin or padding */
.g-row + .g-row {
    margin-top: 10px;
}

.inline-div {
    display: inline-block;
    /* Optional: You can add some margin for spacing between the divs */
    margin-right: 10px;
}
</style>
<head>
    <meta charset="utf-8">
    <title>HELF 입장하기</title>
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

	<!-- Box Stylesheet -->
	<link rel="stylesheet" href="styles.css">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <jsp:include page="../common/topnavbar.jsp"/>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0">
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">HELF 입장하기</h1>
                    <a href="/home" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">Concept</a>
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
    
    <!-- Concept -입장종류 선택하기 form Start -->
    <div class="container">
		<div class="row row-cols-1 row-cols-md-2 g-4">
  			<div class="col">
   				 <div class="card text-center">
      			 <img src="/resources/img/personal-training.jpg" class="card-img-top" alt="gym">
      				<div class="card-body">
        				<h5 class="card-title">수업</h5>
        					<p class="card-text"> 미리 예약한 수업을 출석해요. <br></p>
        				<button type="button" class="btn btn-primary"  id="btn-open-lesson-modal">출석하기</button>
      				</div>
    			</div>
  			</div>
  			<div class="col">
    			<div class="card text-center">
      			<img src="/resources/img/gym.jpg" class="card-img-top" alt="personal-training">
      				<div class="card-body">
       					<h5 class="card-title">시설 이용</h5>
       					<p class="card-text">입장하기 버튼을 눌러서 입장해요.<br></p>
        				<button type="button" class="btn btn-primary"  id="btn-open-gym-modal">입장하기</button>
      				</div>
   				</div>
  	  		</div>
		</div>
	</div>
  	<!-- Concept -입장종류 선택하기 form End  -->
 	
 	<!-- 시설 이용 modal Start-->
    <div class="modal" tabindex="-1" id="welcome-modal">
    	<div class="modal-dialog modal-xl">
    		<div class="modal-content" style="padding: 100px;"> 
    			<div style="display: flex; justify-content: center;">
    					<img src="/resources/img/check-mark-icon.jpg" class="card-img-top" alt="check-mark-icon" style="width:100px; height:100px;">
    			</div>
    			<br>
    				<div class="modal-box" id="user-welcome">
    					<h2 style="text-align: center;"><span id="span-user-name">김채경</span> 회원님</h2>
    					<h3 style="text-align: center;">'<span id="span-my-membership-cat"></span>' 입장했어요!</h3>
    				</div>	
    				<br>
    			<div class="card text-bg-light mb-3"> 
    				<div class="card-body">
    					<div class="grid text-center">
        					<!-- Grouping 1 -->
        					<div class="g-row">
           						<div class="g-col-6">잔여횟수</div>
            					<div id="remaining-counts" class="g-col-6">30회</div>
        					</div>
							<!-- Grouping 2 -->
        					<div class="g-row">
            					<div class="g-col-6">잔여기간</div>
            					<div class="g-col-6">
                					<div id="end-date" class="inline-div">2023년 08월 07일</div> 
                					<div id="remaining-days" class="inline-div">170일</div>
            					</div>
        					</div>
    					</div>
					</div>
    			</div>	
    			<br>
    			<div class="d-grid gap-2 mx-auto">
    				<a href="/checkin/check-in" class="btn btn-primary" aria-label="close">확인</a>
    			</div>
    		</div>
    	</div>
    </div>
    <!-- 시설 이용 modal End --> 
    
    <!-- 수업 선택 modal Start-->
    <div class="modal" tabindex="-1" id="welcome-lesson-modal">
    	<div class="modal-dialog modal-xl">
    		<div class="modal-content" style="padding: 100px;"> 
    			<h2 style="text-align: center;">오늘의 수업 목록</h2>
    			<br>
    			<table class="table" id="modal-table-lessons">
    				<thead>
    					<tr>
    						<th>수업 시간</th>
    						<th>수업명</th>
    						<th>강사명</th>
   							<th></th>
   						</tr>
   					</thead>
   					<tbody>
    					
   					</tbody>
   				</table>
    			<div class="d-grid gap-2 mx-auto">
    				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
    			</div>
    		</div>
    	</div>
    </div> 
     <!-- 수업 출석 modal End--> 
    
     <!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
    <!-- Footer End -->

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
    <script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    
    <script type="text/javascript">
	// 부트스트랩의 모달 객체 생성하기
	const welcomeModal = new bootstrap.Modal('#welcome-modal', {
		keyboard: false
	});
	
	const welcomeLessonModal = new bootstrap.Modal('#welcome-lesson-modal', {
		keyboard: false
	});
	
	// 수업 출석하기 (버튼) - 오늘 수업 목록 조회 및 클릭하기 
	$("#btn-open-lesson-modal").click(function(){
		$("#modal-table-lessons tbody").empty();
		const requestUserId = '${param.id}'
		$.ajax({
			type: "GET",
			url: "/checkin/lesson",
			data:{id:requestUserId},
			success: function(response){
				 const myLessonLists = response.myLessonLists;
				 const personalLists = response.personalLists;
				
				 if (myLessonLists.length == 0 && personalLists.length == 0) {
				     alert("수업이 없습니다.");
				     return;
				 }
				
				 // 그룹 수업 
				myLessonLists.forEach(function(lessonApply, index){
					let lessonTimestamp = new Date(lessonApply.lesson.date);
					let lessonDate = lessonTimestamp.toISOString().split('T')[0];
					let lessonTime = lessonApply.lesson.time;
					let lessonName = lessonApply.lesson.name;
					let teacherName = lessonApply.lesson.user.name;
					let userName = lessonApply.user.name;
					let myMembershipNo = lessonApply.myMembership.no;
					let membershipCat =	lessonApply.myMembership.membership.category.no;
					let myMembershipRemainderCnt = lessonApply.myMembership.remainderCnt;
					let myMembershipEndDate = lessonApply.myMembership.endDate;
				
					let tr = `
						<tr>
							<td>\${lessonDate} \${lessonTime}</td>
							<td>\${lessonName}</td>
							<td>\${teacherName}</td>
							<td><button class="btn btn-outline-primary"
								data-my-membership-no = "\${myMembershipNo}"
								data-user-name = "\${userName}"
								data-membership-cat = "\${membershipCat}"
								data-my-membership-remainder-cnt = "\${myMembershipRemainderCnt}"
								data-my-membership-end-date = "\${myMembershipEndDate}">출석</button>
							</td>
						</tr>
					`
					$("#modal-table-lessons tbody").append(tr);
				});
				 // start
				 // 개인 레슨 수업 
					personalLists.forEach(function(personalLesson, index){
						let lessonTimestamp = new Date(personalLesson.date);
						let lessonDate = lessonTimestamp.toISOString().split('T')[0];
						let lessonTime = personalLesson.time;
						let lessonName = personalLesson.name;
						let teacherName = personalLesson.trainer.user.name;
						let userName = personalLesson.user.name;
						let myMembershipNo = personalLesson.myMembership.no;
						let membershipCat =	personalLesson.myMembership.membership.category.no;
						let myMembershipRemainderCnt = personalLesson.myMembership.remainderCnt;
						let myMembershipEndDate = personalLesson.myMembership.endDate;
						
						let tr = `
							<tr>
								<td>\${lessonDate} \${lessonTime}</td>
								<td>\${lessonName}</td>
								<td>\${teacherName}</td>
								<td><button class="btn btn-outline-primary"
									data-my-membership-no = "\${myMembershipNo}"
									data-user-name = "\${userName}"
									data-membership-cat = "\${membershipCat}"
									data-my-membership-remainder-cnt = "\${myMembershipRemainderCnt}"
									data-my-membership-end-date = "\${myMembershipEndDate}">출석</button>
								</td>
							</tr>
						`
						$("#modal-table-lessons tbody").append(tr);
						
					});
				 // 개인수업 end
				 
				$("#welcome-lesson-modal").modal("show");
			},
			error: function (xhr, status, error) {
                // Handle errors if any
                console.error("Error:", error);
			}
		});
	});
	
	// 출석 버튼 클릭 시, customerAttendance 저장 
	$("#modal-table-lessons tbody").on('click', 'button', function() {
		const userId = '${param.id}'
		
		let userName = $(this).attr('data-user-name');
		let membershipCat = $(this).attr('data-membership-cat');
		let myMembershipRemainderCnt = $(this).attr('data-my-membership-remainder-cnt');
		let myMembershipEndDate = $(this).attr('data-my-membership-end-date');
		let myMembershipNo = $(this).attr('data-my-membership-no');
		
		$("#span-user-name").text(userName);
		
		$("#span-my-membership-cat").text('수업');
		$("#remaining-counts").text(myMembershipRemainderCnt + "회");
		
		
		$("#end-date").text(myMembershipEndDate.substr(0, 10));
		
		let now = dayjs();
		let myMembershipEndDate2 = dayjs(myMembershipEndDate);
		let differenceInDays = myMembershipEndDate2.diff(now, 'day');
		$("#remaining-days").text(differenceInDays + "일"); 
		
		$("#welcome-lesson-modal").modal("hide");
		$("#welcome-modal").modal("show");
		
		$.ajax({
			type: "POST",
			url: "/checkin/check-lesson-attendance",
			data:{
				userId: userId,
				myMembershipNo : myMembershipNo},
			success: function(){
				console.log("Data sent successfully");
			},
			 error: function(error){
	                console.error("Error:", error);
	                alert("There was an error processing your request.");
	            }
		});
	});
	
	
	$("#btn-open-gym-modal").click(function(){
		const userId = '${param.id}'
		$.ajax({
			type: "GET",
			url: "/checkin/welcome",
			data: {userId:userId},
			success: function(myMembership){
				
				if (!myMembership || myMembership.length == 0) {
					alert("사용할 수 있는 이용권이 없습니다.");
					return;
				}
				
				$("#span-user-name").text(myMembership.user.name);
				$("#span-my-membership-cat").text('헬스'); 
				$("#remaining-counts").text('무제한');
				let endDate = myMembership.endDate;
				$("#end-date").text(endDate.substr(0, 10));
				
				let now = dayjs();
				let endDate2 = dayjs(endDate);
				let differenceInDays = endDate2.diff(now, 'day');
				$("#remaining-days").text(differenceInDays + "일"); 

				$("#welcome-modal").modal("show");
			},
			error: function(xhr, status, error){
				console.error("Error:", error);
			}
		});
		
	});
	
	</script>
</body>

</html>