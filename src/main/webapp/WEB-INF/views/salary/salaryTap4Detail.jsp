<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>
/* Ensuring the cards are aligned */
.nav-item {
    margin-right: 20px; /* Increase this value if you want more spacing between tabs */
}
</style>
<head>
    <meta charset="utf-8">
    <title>급여 조회</title>
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
	
	<!-- search icon Stylesheet -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
                    <h1 class="display-4 text-white animated zoomIn">급여 상세 조회</h1>
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
    
    <!-- 임직원 급여 상세 form Start -->
    <div class="container">
    	<div class="card-body">
    		<div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
     			<c:choose>
     			<c:when test="${trainerInfo.user.gender == 'MAN' }">
    				<img class="/resources/img-fluid rounded" src="/resources/img/남2.png" style="width: 150px; height: 150px;">     			
     			</c:when>
	    		<c:when test="${trainerInfo.user.gender == 'WOMAN' }">
	     			<img class="/resources/img-fluid rounded" src="/resources/img/여2.png" style="width: 150px; height: 150px;">     			
	     		</c:when>
	     		</c:choose>
            <div class="ps-2">
               	<h4 class="text-primary mb-1">${trainerInfo.user.name }</h4>
                     <div class="text-uppercase">
	                    <span class="badge bg-primary">${trainerInfo.trainer.title }</span>
	                    <span class="badge bg-info">
		                	<c:choose>
		                    	<c:when test="${trainerInfo.user.gender == 'MAN'}">남성</c:when>
		                      	<c:when test="${trainerInfo.user.gender == 'WOMAN'}">여성</c:when>
		                     </c:choose>
	                    </span>
	                    <span class="badge bg-secondary">${trainerInfo.user.tel }</span>
	                    <span class="badge bg-success">
	                    <c:choose>
		                  <c:when test="${trainerInfo.user.status == 'R'}">승인대기</c:when>
	                      <c:when test="${trainerInfo.user.status == 'Y'}">재직</c:when>
	                      <c:when test="${trainerInfo.user.status == 'N'}">퇴사</c:when>
	                   	</c:choose>
	                    </span>
	                    <span class="badge bg-warning">
	                     강사
	                     </span>
                    </div>
              </div>
        </div>
    </div>
    <!-- 임직원 급여 부분 Start -->
	<div class="card-body">
	    <ul class="nav nav-tabs">
	        <li class="nav-item">    
	            <a class="nav-link" aria-current="page" href="/salary/salary-detail?id=${param.id} ">급여 확정 내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab2Content?id=${param.id} ">실시간 급여 정산 명세서</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab3Content?id=${param.id }">개인 레슨 수당 내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link active" href="/salary/tab4Content?id=${param.id }">그룹 레슨 수당 내역</a>
	        </li>
	    </ul>
	<!-- 그룹 레슨 수당 내역  --> 
	<div class="content-section" style="padding: 20px;">
	<div class="card-body">
    	<form method="get" action="/salary/tab4Content" id="form-gclLesson-search">
   			<input type="hidden" name="page" value="${empty param.page ? 1 : param.page  }"/>
    		<input type="hidden" name="id" value="${param.id}"/>
   		 	<input type="hidden" name="startDate" id="startDate">
			<input type="hidden" name="endDate" id="endDate"> 
			<div class="row" style="margin-bottom: 60px;">
				<div class="col-7">
					<h3>최근 정산 현황</h3>
					<div class="card" style="background-color: #f0f8ff; border: none;">
						<canvas id="MonthlyGclSalaryBarChart"></canvas>
					</div>
				</div>
				<div class="col-5">
					<div style="display: flex; align-items: center; justify-content: space-between;">
				        <h3>그룹레슨 수당 정산액</h3>
					</div>
				    <div class="card" style="background-color: #f0f8ff; border: none; padding: 20px;"> 
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <div>
					            <p style="margin-bottom: 5px;">수당정산하기</p>
					            <!-- 이번 달 그룹레슨 수당 총액 계산하기 Start -->
					        	<c:set var="totalLessonPrice" value="0"/>
								<c:if test="${not empty monthlyGclList }">
								    <c:forEach var="gcl" items="${monthlyGclList }">
								       <c:set var="totalLessonPrice" value="${totalLessonPrice + gcl.lessonFee}"/>
								    </c:forEach>
								</c:if>
								<!-- 이번 달 그룹레슨 수당 총액 계산하기 End -->
					            <h3 id="totalLessonPrice" style="color: #007bff; margin-bottom: 20px;">
							   		<fmt:formatNumber value="${totalLessonPrice}" groupingUsed="true"/>원
								</h3>
					        </div>
					        <sec:authorize access="hasRole('ROLE_MANAGER')">
					        	<button type="button" id="saveDataBtn" onclick="saveData()" style="color: white; background-color: #007bff; padding: 10px 15px; border: none; border-radius: 5px; font-weight: bold;">정산하기</button>
					    	</sec:authorize>
					    </div>
					    <div style="display: flex; justify-content: space-between; align-items: center;">
						    <span id="dateRange">
						    	<span id="start-date"></span> ~ <span id="end-date"></span>
						    </span>
						    <span class="badge" style="background-color: #fff5cc; color: #d1a655;">${totalRows }회</span>
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex; justify-content: space-between; align-items: center;">
	   			<h3>그룹레슨 수당 내역 <span id="totalRowsSpan">${totalRows}건</span></h3>
	    		<span>
	    			<input type="month" id="dateInput" name="dateInput" style="margin-right: 10px;">
	    			<button type="button" class="btn btn-outline-primary" id="btn-search" onclick="searchLessonsByMonth()">조회</button>
	    		</span>
			</div>
			<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th>일자</th>
					<th>시간</th>
					<th>수업명</th>		
					<th>신청인원/모집정원</th>	
					<th>출석인원</th>	
					<th>수당정산액</th>	
					<th>수업단가</th>	
					<th>수업커미션비율</th>		
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty monthlyGclList }">
					<c:forEach var="gcl" items="${monthlyGclList }">
						<tr>
							<td><fmt:formatDate value="${gcl.lessonDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${gcl.lessonTime }시</td>
							<td>${gcl.lessonName}</td>
							<td>${gcl.reqCnt}/${gcl.quota }</td>
							<td>${gcl.attendanceCnt}명</td>
							<td style="font-weight: bold;"><fmt:formatNumber value="${gcl.lessonFee}" groupingUsed="true"/>원</td>
							<td><fmt:formatNumber value="${gcl.mySalary.unitPrice}" groupingUsed="true"/>원</td>
							<td><c:out value="${gcl.mySalary.gclPct * 100}"/>%</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<tr>
							<td colspan="8">수업 이력이 없습니다.</td>
						</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<!--  페이지네이션 Start --> 
	     		<c:if test="${pagination.totalRows gt 0 }">
	     			<c:set var="currentPage" value="${pagination.page }" />
	               		<c:set var="first" value="${pagination.first }" />
	               		<c:set var="last" value="${pagination.last }" />
	               		<c:set var="prePage" value="${pagination.prePage }" />
	               		<c:set var="nextPage" value="${pagination.nextPage }" />
	               		<c:set var="beginPage" value="${pagination.beginPage }" />
	               		<c:set var="endPage" value="${pagination.endPage }" />
	               		<nav>
	               			<ul class="pagination justify-content-center">
	               				<li class="page-item ${first ? 'disabled' : '' }">
	               					<a href="tab4Content?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
	               				</li>
	               				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
	               					<li class="page-item ${currentPage eq num ? 'active' : '' }">
	               						<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
	               					</li>
	               				</c:forEach>
	               				<li class="page-item ${last ? 'disabled' : '' }">
	               					<a href="tab4Content?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
	               				</li>
	               			</ul>
	               		</nav> 
	     		</c:if>
	     	<!-- 페이지네이션 End -->
	     	<div id="tab4Id" data-user-id="${param.id }"></div>
	     	<div id="tab4Page" data-page="${param.page }"></div>
	     	<div id="tab4TotalRows" data-total-rows="${totalRows }"></div>
    	</form>
	</div>
</div>
	<!--그룹레슨 수당 내역 form End -->
	<!-- 임직원 급여 부분 End -->
	</div>
   </div>
	<!--  임직원 급여 상세 form End -->

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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script type="text/javascript">
    
    // 이번 달의 첫째일, 마지막일 보여주기 
    window.onload = function() {
        var startDate = moment().startOf('month').format('YYYY-MM-DD');
        var endDate = moment().endOf('month').format('YYYY-MM-DD');
        
        document.getElementById("start-date").innerText = startDate;
        document.getElementById("end-date").innerText = endDate;
    };
    
    // 해당 년/월에 진행한 수업 내역 찾기 
    function searchLessonsByMonth(){
    	var selectedMonth = document.getElementById('dateInput').value;
    	 var startDate = moment(selectedMonth).startOf('month').format('YYYY-MM-DD');
         var endDate = moment(selectedMonth).endOf('month').format('YYYY-MM-DD');
         
         document.getElementById('startDate').value = startDate;
         document.getElementById('endDate').value = endDate;
         
         document.querySelector('#form-gclLesson-search').submit();
    }
    
   // 그룹수업 정산하기 
   function saveData(){
   const userId = document.querySelector("input[name=id]").value;
   const page = document.querySelector("input[name=page]").value;
   const startDate = document.getElementById('start-date').textContent;
   const totalRows = document.querySelector("#tab4TotalRows").getAttribute("data-total-rows");
   
   var totalLessonPriceElement = document.getElementById("totalLessonPrice").textContent;
   var cleanedTotalLessonPrice = totalLessonPriceElement.replace(/원/g, '').replace(/,/g, '').trim();

   var totalRowsElement = document.getElementById("totalRowsSpan").textContent;
   var cleanedTotalRows = totalRowsElement.replace('건', '').trim();
   
   var userResponse = confirm("저장하시겠습니까? 한 번 저장한 정보는 되돌릴 수 없습니다.");
   
   if(userResponse) {
	   // User clicked "OK"
	   $.ajax({
		    type: "POST",
		    url: "/salary/saveGclData",
		    data: {
		        userId: userId,
		        page: page,
		        totalLessonPrice: cleanedTotalLessonPrice,
		        totalRows: cleanedTotalRows,
		        startDate: startDate
		    }
		}).done(function(response) {
		    alert(response);
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    alert(jqXHR.responseText); 
		});
   }
   else {
   }
}

   
   // 페이지네이션
   function changePage(event, page){
	   event.preventDefault();
	   document.querySelector("input[name=page]").value=page;
	   document.querySelector("#form-gclLesson-search").submit();
   }
    
   // 그룹 수당 내역 최근 5개월 그래프 관련 js
   // Step1. model에서 값 js 형식으로 변경
   var gclPay = [];
   var gclMonth = [];

   <c:forEach var="record" items="${graphData}">
   		gclPay.push(${record.gclPay});
   		gclMonth.push('${record.month}');
   </c:forEach>
   
   // Step2. 값을 역순으로 변경
   gclPay.reverse();
   gclMonth.reverse();
   
   console.log(gclPay);
   console.log(gclMonth);
   
   var ctx = document.getElementById('MonthlyGclSalaryBarChart').getContext('2d');
   
   var chart = new Chart(ctx, {
	   type: 'bar',
	   data: {
		   labels: gclMonth,
		   datasets: [{
			   label: '월별 그룹레슨 수당',
			   backgroundColor: '#268fff',
               borderColor: '#268fff',
               data: gclPay,
               borderWidth: 1,
               borderRadius: 5,
               barThickness: 45
		   }]
	   },
	   options: {
           scales: {
               y: {
                   ticks: {
                       callback: function(value, index, values) {
                           const ticks = [0, 100, 200, 300, 400, 500, 600, 800];
                           return ticks.indexOf(value) >= 0 ? value : null;
                       }
                   }
               }
           }
       }
   });
   
    </script>
</body>

</html>