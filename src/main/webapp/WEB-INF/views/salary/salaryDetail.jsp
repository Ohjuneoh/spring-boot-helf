<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>
.nav-item {
    margin-right: 20px; /* Increase this value if you want more spacing between tabs */
}
.overflow-x-auto {
    overflow-x: auto;
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
	            <a class="nav-link active" aria-current="page" href="/salary/salary-detail?id=${param.id }">급여 확정 내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab2Content?id=${param.id }">실시간 급여 정산 명세서</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab3Content?id=${param.id }">개인 레슨 수당 내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" href="/salary/tab4Content?id=${param.id }">그룹 레슨 수당 내역</a>
	        </li>
	    </ul>
	</div>
	<!-- 임직원 급여 부분 End -->
	<div class="container" style="padding:10px;">
		<div class="row" style="margin: 10px;">
		<form method="get" action="/salary/salary-detail" id="form-salary-detail">
			<input type="hidden" name="page" value="${empty parm.page ? 1 : pagination.page  }"/>
    		<input type="hidden" name="id" value="${param.id}"/>
			<table class="table" style="text-align: left;">
				<thead>
					<tr>
						<th colspan="2">내역정보</th>
						<th colspan="9">급여정보</th>
					</tr>
					<tr>	
						<th>확정상태</th>
						<th>내역발송일</th>
						<th>지급 월</th>
						<th>월 급여 지급액</th>
						<th>기본급</th>
						<th>개인레슨 수당</th>
						<th>커미션비율</th>
						<th>그룹레슨 수당</th>
						<th>커미션비율</th>
						<th>공제액</th>
						<th>공제비율</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty salaryRecords }">
							<c:forEach var="salaryRecords" items="${salaryRecords }">
								<tr>
									<c:choose>
										<c:when test="${salaryRecords.status == 'Y' }">
											<td><span class="badge bg-primary">확정완료</span></td>		
										</c:when>
										<c:otherwise>
											<td><span class="badge text-bg-info">확정대기</span></td>
										</c:otherwise>
									</c:choose>
									<td><fmt:formatDate value="${salaryRecords.insertedDate }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${salaryRecords.salaryDate }" pattern="yyyy년 MM월"/></td>
									<td><fmt:formatNumber value="${salaryRecords.actualMonthlysalary }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${salaryRecords.mySalary.regularPay}" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${salaryRecords.monthlyPclPayRecords.pclPay }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${salaryRecords.mySalary.pclPct*100}" groupingUsed="true"/>%</td>
									<td><fmt:formatNumber value="${salaryRecords.monthlyGclPayRecords.gclPay }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${salaryRecords.mySalary.gclPct*100}" groupingUsed="true"/>%</td>
									<td><fmt:formatNumber value="${salaryRecords.tax }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${salaryRecords.mySalary.taxRate *100}" groupingUsed="true"/>%</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="11" style="text-align:center">조회 내역이 없습니다.</td>
							</tr>
						</c:otherwise>	
					</c:choose>
				</tbody>
			</table>
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
	               					<a href="salary-list?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
	               				</li>
	               				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
	               					<li class="page-item ${currentPage eq num ? 'active' : '' }">
	               						<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
	               					</li>
	               				</c:forEach>
	               				<li class="page-item ${last ? 'disabled' : '' }">
	               					<a href="salary-list?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
	               				</li>
	               			</ul>
	               		</nav> 
	     		</c:if>
		</form>
		</div>
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
    function changePage(event, page){
		event.preventDefault();
		document.querySelector("input[name=page]").value=page;
		document.querySelector("#form-salary-detail").submit();
		
	}
    </script>
</body>

</html>