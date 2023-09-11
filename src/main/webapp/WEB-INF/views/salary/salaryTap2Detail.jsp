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

 .header {
            font-weight: bold;
            color: #292929;
            font-size: 1.2rem;
            padding-bottom: 15px;
        }
 .normal {
            color: grey;
            font-size: 1rem;
            margin-bottom: 5px;
        }
 .line {
            background-color: #ededed;
            color: 	#d3d3d3;
            height: 1px;
            margin: 5px;
        }
  .small-space {
            height: 15px;
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
	            <a class="nav-link active" href="/salary/tab2Content?id=${param.id} ">실시간 급여 정산 명세서</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab3Content?id=${param.id }">개인 레슨 수당 내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab4Content?id=${param.id }">그룹 레슨 수당 내역</a>
	        </li>
	    </ul>
	<!-- 이번 달 급여 정산 명세서 form Start  --> 
 	<div class="content-section">
	<div class="container">
	<div class="align-items-center border-bottom pt-5 pb-4 px-5">
		<h3>실시간 급여 정산 명세서</h3>
		<div class="card" style="background-color: #f0f8ff; padding: 20px;"> 
			<div style="display: flex; justify-content: space-between; align-items: center;">
				<div>
					<p style="margin-bottom: 5px; font-weight:bold;">수당정산하기<span class="badge text-bg-primary" style="background-color: #007bff; margin-left:10px;">실시간</span></p>
					<h3 id="totalPayment" style="color: #007bff; margin-bottom: 20px;">
						<fmt:formatNumber value="${salaryInfo.totalPayment}" groupingUsed="true"/>원
					</h3>
				</div>
				<sec:authorize access="hasRole('ROLE_MANAGER')">
					<button type="button" id="saveDataBtn" onclick="saveData()" style="color: white; background-color: #007bff; padding: 10px 15px; border: none; border-radius: 5px; font-weight: bold;">급여 정산 확정하기</button>
				</sec:authorize>
			</div>
			<div style="display: flex; justify-content: space-between; align-items: center;">
				<span id="dateRange">
					<span id="start-date"></span> ~ <span id="end-date"></span>
				</span>
			</div>
		</div>
		<div class="card" style="border:none; padding:10px;"></div>
		<!-- 이번달 실시간 급여 내역 Start -->
		<div class="card" style="padding:20px;">
			<c:choose>
			<c:when test="${not empty salaryInfo.mySalary.regularPay }">
				<c:choose>
					<c:when test="${not empty salaryInfo.pcl.pclPay && not empty salaryInfo.gcl.gclPay}">
				<div class="header">기본급
					<span style="float: right;">
						<c:choose>
							<c:when test="${not empty salaryInfo.mySalary.regularPay }">
						<fmt:formatNumber value="${salaryInfo.mySalary.regularPay }" groupingUsed="true"/>원
							</c:when>
							<c:otherwise>0원</c:otherwise>
						</c:choose>
					</span>
				</div>
			    <div class="line"></div>
			    <div class="header">수당 내역
			    	<span style="float: right;" id="totalLessonFee">
			    		<fmt:formatNumber value="${salaryInfo.totalLessonFee }" groupingUsed="true" />원
			    	</span>
			    </div>
			    <div class="normal">개인레슨 
			    	<span style="float: right;">
			    		<fmt:formatNumber value="${salaryInfo.pcl.pclPay }" groupingUsed="true"/> 원
			    	</span>
			    </div>
			    <div class="normal">레슨횟수 <span style="float: right;">${salaryInfo.pcl.cnt } 회</span></div>
			    <div class="small-space"></div>
			    <div class="normal">그룹레슨
			    	<span style="float: right;">
			    		<fmt:formatNumber value="${salaryInfo.gcl.gclPay }" groupingUsed="true" /> 원
			    	</span>
			    </div>
			    <div class="normal">레슨횟수 <span style="float: right;">${salaryInfo.gcl.cnt } 회</span></div>
			    <div class="small-space"></div>
			    <div class="line"></div>
			    <div class="header">공제내역
					<span style="float: right;" id="totalTax">
						- <fmt:formatNumber value="${salaryInfo.totalTax }" groupingUsed="true"/>원
					</span>
				</div>
			    <div class="normal">공제율
			    	<span style="float: right;">
			    		<fmt:formatNumber value="${salaryInfo.mySalary.taxRate * 100}" pattern="#.#"/> %
			    	</span></div>
			    <div class="normal">공제액
			    	<span style="float: right;">
			    		<fmt:formatNumber value="${salaryInfo.totalTax }" groupingUsed="true"/> 원
			    	</span>
			    </div>
			    	</c:when>
			    	<c:otherwise>
			    		<div>
				    		<p style="text-align:center">조회된 내역이 없습니다. 개인/그룹레슨 수당 정산 후에 급여 정산을 확정할 수 있습니다.</p>
				    	</div>
			    	</c:otherwise>
			    	</c:choose>
			    </c:when>
			    <c:otherwise>
			    	<div>
			    		<p style="text-align:center">조회 내역이 없습니다. 기본급을 설정하세요.</p>
			    	</div>
			    </c:otherwise>
			   </c:choose>	
		</div>
		<input type="hidden" name="pclNo" id="pclNo" value="${salaryInfo.pcl.no }"/>
		<input type="hidden" name="gclNo" id="gclNo" value="${salaryInfo.gcl.no }"/>
		<input type="hidden" name="id" value="${param.id }"/>
		<!-- 이번달 실시간 급여 내역 End -->
	</div>
	</div>
	</div>
	<!-- 이번 달 급여 정산 명세서 form End -->
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
    
    
   function saveData(){
	   let userId = document.querySelector("input[name=id]").value;
	   let startDate = document.getElementById('start-date').textContent;
	   let pclNo = document.querySelector("input[name=pclNo]").value;
	   let gclNo = document.querySelector("input[name=gclNo]").value; 
	   var totalPaymentElement = document.getElementById("totalPayment").textContent;
	   var totalPayment = totalPaymentElement.replace(/원/g, '').replace(/,/g, '').trim();

	   var totalLessonFeeElement = document.getElementById("totalLessonFee").textContent;
	   var totalLessonFee = totalLessonFeeElement.replace(/원/g, '').replace(/,/g, '').trim();
	   
	   var totalTaxElement = document.getElementById("totalTax").textContent;
	   var totalTax = totalTaxElement.replace(/원/g, '').replace(/,/g, '').replace(/-/g, '').trim();
	   
	   
	   alert("저장하시겠습니까? 한 번 저장한 정보는 되돌릴 수 없습니다.");
	   $.ajax({
		   type:"POST",
		   url:"/salary/save-monthly-salary",
		   data: {
			   userId: userId,
			   startDate: startDate,
			   pclNo: pclNo,
			   gclNo: gclNo,
			   totalPayment: totalPayment,
			   totalLessonFee: totalLessonFee,
			   totalTax: totalTax
		   }
		}).done(function(response) {
		    alert(response);
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    alert(jqXHR.responseText); 
		});

  } 

    
    </script>
</body>

</html>