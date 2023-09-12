<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>     
</style>
<head>
    <meta charset="utf-8">
    <title>고객 상세 정보_개인수업 내역</title>
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
    <link rel="stylesheet" type="text/css" href="your-stylesheet.css">

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
                    <h1 class="display-4 text-white animated zoomIn">HELF 고객조회</h1>
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
    
    <!-- 최근 방문 내역 form Start -->
   <div class="container">
   	<div class="row mb-3">
	   	<div class="col-2">
	   		<div class="card d-flex justify-content-center align-items-center">
		     	<c:choose>
	     			<c:when test="${customerDetailDto.user.gender == 'MAN'}">
	     				<img class="/resources/img-fluid rounded" src="/resources/img/남1.png" style="width: 150px; height: 150px; justify-content: center; align-items: center;" >
	     			</c:when>
	     			<c:when test="${customerDetailDto.user.gender == 'WOMAN'}">
	        			<img class="/resources/img-fluid rounded" src="/resources/img/여1_bg.png" style="width: 150px; height: 150px; justify-content: center; align-items: center;" >
	     			</c:when> 
     			</c:choose>	
	   			<div class="card-body" style="box-sizing: border-box;">
	   				<table class="Table-responsive" style="font-size: smaller;">
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">이름</td>
	   						<td>${customerDetailDto.user.name}</td>
	   					</tr>
	   					<tr>
	   					<c:choose>
		   					<c:when test="${customerDetailDto.user.gender == 'MAN' }">
		   						<td style="font-weight: bold; padding-right: 20px;">성별</td>
		   						<td>남성</td>
		   					</c:when>
		   					<c:when test="${customerDetailDto.user.gender == 'WOMAN' }">
		   						<td style="font-weight: bold; padding-right: 20px;">성별</td>
		   						<td>여성</td>
		   					</c:when>
	   					</c:choose>
	   					</tr>
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">등급</td>
	   						<td>${customerDetailDto.user.rank.name }</td>
	   					</tr>
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">번호</td>
	   						<td>${customerDetailDto.user.tel }</td>
	   					</tr>
	   					<tr>
	   					<c:choose>
		   					<c:when test="${customerDetailDto.user.status == 'Y' }">
		   						<td style="font-weight: bold; padding-right: 20px;">상태</td>
		   						<td>유효회원</td>
		   					</c:when>
		   					<c:when test="${customerDetailDto.user.status == 'N' }">
		   						<td style="font-weight: bold; padding-right: 20px;">상태</td>
		   						<td>탈퇴회원</td>
		   					</c:when>
	   					</c:choose>
	   					</tr>
	   				</table>
	   			</div>
	   		</div>
	   	</div>
	   	<div class="col-10">
	   	<div class="row mb-3">
	   		<h3 class="mb-0 text-primary">최근 개인 수업 내역 </h3>
	   			<form id="form-specific-dates" method="get" action="customer-recent-visit">
	   				<div class="card-body p-4 d-flex justify-content-center align-items-center">
	   					<div>
		   					<input type="date" id="specificDate1" name="specificDate1"/> 
	   					</div>
	   					<span class="px-2">~</span>
	   					<div>
	   						<input type="date" id="specificDate2" name="specificDate2"/> 
	   					</div>
	   					<span class="px-2"></span>
		   				<button type="button" class="btn btn-primary btn-sm" onclick="searchSpecificDates()">검색</button>	   		
		   				<input type="hidden" name="page" value="${pagination.page }"/>
		   				<input type="hidden" name="id" value="${param.id }"/>
	   				</div>
	   			<div>
	   			<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead class="text-dark fs-4">
	               			<tr>
	               				<th class="border-bottom-0"><h6>수업날짜</h6></th>
	               				<th class="border-bottom-0"><h6>신청날짜</h6></th>
	               				<th class="border-bottom-0"><h6>수업명</h6></th>
	               				<th class="border-bottom-0"><h6>담당강사</h6></th>
	               				<th class="border-bottom-0"><h6>출결상태</h6></th>
	               				<th class="border-bottom-0"><h6>이용권명</h6></th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               		<c:choose>
	               			<c:when test="${not empty personalLessonList }">
	               				<c:forEach var="pcl" items="${ personalLessonList}">
	               					<tr>
		               					<td><fmt:formatDate value="${pcl.date}" pattern="yyyy-MM-dd" /> ${pcl.time }</td>
		               					<td><fmt:formatDate value="${pcl.createDate}" pattern="yyyy-MM-dd"/></td>
		               					<td>${pcl.name}</td>
		               					<td>${pcl.trainer.user.name }</td>
		               					<td>
		               						<c:choose>
		               							<c:when test="${pcl.status == 'N' }">
		               								<span class="badge" style="background-color: #c46d6a; color: #cfc3c2;">결석</span>
		               							</c:when>
		               							<c:when test="${pcl.status == 'Y' }">
		               								<span class="badge" style="background-color: #4dc9e8; color: #f2fafc;">출석</span>
		               							</c:when>
		               						</c:choose>
		               					</td>
		               					<td>${pcl.myMembership.membership.name}</td>
	               					</tr>
	               				</c:forEach>
	               			</c:when>
		               		<c:otherwise>
		               			<tr>
		               				<td colspan="5">참여한 개인수업 이력이 없습니다.</td>
		               			</tr>
		               		</c:otherwise>
		               	</c:choose>
	               		</tbody>
	               </table>
	               <c:if test="${pagination.totalRows gt 0}">
					<c:set var="first" value="${pagination.first }" />
               		<c:set var="last" value="${pagination.last }" />
               		<c:set var="prePage" value="${pagination.prePage }" />
               		<c:set var="nextPage" value="${pagination.nextPage }" />
               		<c:set var="beginPage" value="${pagination.beginPage }" />
               		<c:set var="endPage" value="${pagination.endPage }" />
               		<nav>
               			<ul class="pagination justify-content-center">
               				<li class="page-item ${first ? 'disabled' : '' }">
               					<a href="customer-recent-visit?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
               				</li>
               				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
               					<li class="page-item ${currentPage eq num ? 'active' : '' }">
               						<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
               					</li>
               				</c:forEach>
               				<li class="page-item ${last ? 'disabled' : '' }">
               					<a href="customer-recent-visit?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
               				</li>
               			</ul>
               		</nav> 
	               </c:if>
     			<div style="text-align:center;">
	     			<a href="/management/customer-list?id=${customerDetailDto.user.id}" class="btn btn-primary">목록</a>
     			</div>
	   		</div>
	   	</form>
	   	</div>
	   </div>
	   </div>
   </div>
	<!--  회원별 상세 페이지 form End -->
	
	<!-- 최근 결제 내역 Modal Start 
	
	 최근 방문 내역 Modal End -->
	
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
	
    <!-- 검색 하기 Start -->
   function searchSpecificDates(){
	   document.querySelector("input[name=page]").value=1;
	   
	   let specificDate1 = document.querySelector("input[name=specificDate1]").value;
	   let specificDate2 = document.querySelector("input[name=specificDate2]").value;
   		
	   document.querySelector("#form-specific-dates").submit();
   }

    <!-- 검색 하기 End -->
    
    <!--페이지네이션 -->
	function changePage(event, page){
		event.preventDefault();
		document.querySelector("input[name=page]").value=page;
		document.querySelector("#form-specific-dates").submit();
	}
    
	</script>
</body>

</html>