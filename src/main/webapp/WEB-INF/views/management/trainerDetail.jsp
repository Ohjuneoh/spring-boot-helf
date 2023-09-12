<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>     
.hidden-row {
    display: none;
}
</style>
<head>
    <meta charset="utf-8">
    <title>임직원 상세 정보</title>
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
                    <h1 class="display-4 text-white animated zoomIn">HELF 임직원 조회</h1>
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
    
    <!-- 임직원별 상세 페이지 form Start -->
   <div class="container">
  	 <div class="testimonial-item">
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
                	<h4 class="text-primary mb-1">${trainerInfo.user.name } 트레이너</h4>
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
                      </div>
                </div>
        </div>
     	<div class="pt-4 pb-5 px-5">
        	<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
        		<tbody>
        			<tr>
        				<th style="width: 13%">강사번호</th>
        				<th style="width: 20%">${trainerInfo.trainer.trainerNo }</th>
        				<th style="width: 13%">아이디</th>
        				<th style="width: 20%">${trainerInfo.user.id }</th>
        				<th style="width: 13%">이메일</th>
        				<th style="width: 20%">${trainerInfo.user.email }</th>
        			</tr>
        			<tr>
        				<th style="width: 13%">입사일</th>
        				<th style="width: 20%"><fmt:formatDate value="${trainerInfo.trainer.hiredDate }" pattern="yyyy-MM-dd"/></th>
        				<th style="width: 14%">퇴사일</th>
        				<c:choose>
        					<c:when test="${not empty trainerInfo.trainer.resignationDate }">
        						<th style="width: 20%"><fmt:formatDate value="${trainerInfo.trainer.resignationDate }" pattern="yyyy-MM-dd"/></th>        					
        					</c:when>
        					<c:otherwise>
        						<th style="width: 20%">-</th>
        					</c:otherwise>	
        				</c:choose>
        				<th style="width: 14%">연봉</th>
        				<th style="width: 20%">${trainerInfo.annualSalary }원</th>
        			</tr>
        		</tbody>
        	</table>
     	</div>
    </div> 
  </div> 
  <!-- 최근 개인 수업 내역  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">최근 개인 수업 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
            	<p style="text-align: right;"><a href="/management/morePersonalLesson?id=${param.id}">자세히보기</a></p>
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead>
	               			<tr>
	               				<th>수업날짜</th>
	               				<th>예약날짜</th>
	               				<th>수업명</th>
	               				<th>회원명</th>
	               				<th>출결상태</th>
	               				<th>이용권명</th>
	               			</tr>
	               		</thead>
	               		<tbody>
		               		<c:forEach var="personalLesson" items="${personalLessons }" >
		               			<tr>
					               	<td><fmt:formatDate value="${personalLesson.date }" pattern="yyyy년 M월 d일" /></td>
					       			<td><fmt:formatDate value="${personalLesson.createDate }" pattern="yyyy년 M월 d일" /></td>
				    				<td>${personalLesson.name }</td>
					   				<td>${personalLesson.user.name }</td>
				      				<td>${personalLesson.status }</td>
				     				<td>${personalLesson.myMembership.membership.name }</td>
				               	</tr>
				            </c:forEach>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<!-- 최근 그룹 수업 내역  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">최근 그룹 수업 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
				<p style="text-align: right;"><a href="/management/moreGroupLesson?id=${param.id}">자세히	보기</a></p>
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;" id="table-order-list">
               			<thead>
	               			<tr>
	               				<th>수업명</th>
								<th>수업날짜</th>
	               				<th>이용권 명</th>
	               			</tr>
	               		</thead>
	               		<tbody>
						<c:choose>
							<c:when test="${empty lessons }">
								<tr>
									<td colspan="4">그룹수업 내역이 없습니다.</td>
								</tr>
							</c:when>
						</c:choose>
						<c:forEach var="lesson" items="${lessons }" varStatus="status">
							<c:choose>
								<c:when test="${status.index < 5}">
									<tr>
										<td>${lesson.name}</td>
										<td><fmt:formatDate value="${lesson.date }" pattern="yyyy년 M월 d일" /> ${lesson.time }시 </td>
										<td>그룹PT</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<!-- 최근 출결 내역  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">최근 출결 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
            	<p style="text-align: right;"><a href="trainer-attendance-list?id=${param.id }">자세히보기</a></p>
            	<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead>
	               			<tr>
	               				<th>번호</th>
	               				<th>날짜 및 시간</th>
	               				<th>상태</th>
	               				<th>기타</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               		<c:choose>
	               			<c:when test="${not empty attendances }">
	               				<c:forEach var="att" items="${attendances }" varStatus="loop">
		               				<tr>
					               		<td>${loop.count }</td>
					               		<td><fmt:formatDate value="${att.date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					              		<td>${att.state }</td>
					               		<td>${att.cause }</td>
			               			</tr>
	               				</c:forEach>
	               			</c:when>
	               			<c:otherwise>
	               				<tr>
				               		<td colspan="4">출결 내역이 없습니다.</td>
		               			</tr>
	               			</c:otherwise>
	               		</c:choose>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<div class="container" style="text-align:right;">
	   <a href="/management/trainer-list" class="btn btn-primary">목록</a>
    </div>
	<!--  회원별 상세 페이지 form End -->
	
	
    <!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
   
    
	</script>
</body>

</html>