<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<style>     
</style>
<head>
    <meta charset="utf-8">
    <title>임직원 상세 정보_출결 내역</title>
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
                    <h1 class="display-4 text-white animated zoomIn">HELF 임직원 출결 내역 조회</h1>
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
    
    <!-- 최근 출결 내역 form Start -->
   <div class="container">
   	<div class="row mb-3">
	   	<div class="col-2">
	   		<div class="card d-flex justify-content-center align-items-center">
		     	<c:choose>
	     			<c:when test="${trainerInfo.user.gender == 'MAN' }">
	     				<img class="/resources/img-fluid rounded" src="/resources/img/남1.png" style="width: 150px; height: 150px; justify-content: center; align-items: center;" >
	     			</c:when>
	     			<c:when test="${trainerInfo.user.gender == 'WOMAN' }">
	        			<img class="/resources/img-fluid rounded" src="/resources/img/여1_bg.png" style="width: 150px; height: 150px; justify-content: center; align-items: center;" >
	     			</c:when> 
     			</c:choose>	
	   			<div class="card-body" style="box-sizing: border-box;">
	   				<table class="Table-responsive" style="font-size: smaller;">
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">이름</td>
	   						<td>${trainerInfo.user.name }</td>
	   					</tr>
	   					<tr>
	   					<c:choose>
		   					<c:when test="${trainerInfo.user.gender == 'MAN' }">
		   						<td style="font-weight: bold; padding-right: 20px;">성별</td>
		   						<td>남성</td>
		   					</c:when>
		   					<c:when test="${trainerInfo.user.gender == 'WOMAN' }">
		   						<td style="font-weight: bold; padding-right: 20px;">성별</td>
		   						<td>여성</td>
		   					</c:when>
	   					</c:choose>
	   					</tr>
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">직급</td>
	   					<c:choose>
	   						<c:when test="${not empty trainerInfo.trainer.title }">
	   							<td>${trainerInfo.trainer.title }</td>
	   						</c:when>
	   						<c:otherwise>
	   							<td>-</td>
	   						</c:otherwise>
	   					</c:choose>
	   					</tr>
	   					<tr>
	   						<td style="font-weight: bold; padding-right: 20px;">번호</td>
	   						<td>${trainerInfo.user.tel }</td>
	   					</tr>
	   					<tr>
	   					<c:choose>
		   					<c:when test="${trainerInfo.user.status == 'Y' }">
		   						<td style="font-weight: bold; padding-right: 20px;">상태</td>
		   						<td>재직</td>
		   					</c:when>
		   					<c:when test="${trainerInfo.user.status == 'N' }">
		   						<td style="font-weight: bold; padding-right: 20px;">상태</td>
		   						<td>퇴사</td>
		   					</c:when>
		   					<c:when test="${trainerInfo.user.status == 'R' }">
		   						<td style="font-weight: bold; padding-right: 20px;">상태</td>
		   						<td>승인대기</td>
		   					</c:when>
	   					</c:choose>
	   					</tr>
	   				</table>
	   			</div>
	   		</div>
	   	</div>
	   	<div class="col-10">
	   	<div class="row mb-3">
	   		<h3 class="mb-0 text-primary">최근 출결 내역 </h3>
	   			<form id="form-specific-dates" method="get" action="trainer-attendance-list">
	   				<div class="card-body shadow-sm" style="text-align: center; vertical-align: middle;">
	   					<div style="display: inline-flex; align-items: center;">
	   						<select id="state" name="state" class="btn btn-outline-primary">
	   							<option disabled selected>전체</option>
	   							<option value="출근">출근</option>
	   							<option value="퇴근">퇴근</option>
	   							<option value="지각">지각</option>
	   							<option value="외출">외출</option>
	   							<option value="외근">외근</option>
	   							<option value="복귀">복귀</option>
	   						</select>
	   						<span class="px-2"></span>
							<input type="date" id="specificDate1" name="specificDate1" class="btn btn-outline-primary"/> 
						    <span class="px-2">~</span>
					       	<input type="date" id="specificDate2" name="specificDate2" class="btn btn-outline-primary"/> 
	   						<span class="px-2"></span>	
		   					<button type="submit" class="btn btn-primary btn-sm" onclick="searchSpecificDates()">검색</button>	   		
						</div>   	   									
		   				<input type="hidden" name="page" value="${pagination.page }"/>
		   				<input type="hidden" name="id" value="${param.id }"/>
	   				</div>
	   			<div>
	   			<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead class="text-dark fs-4">
	               			<tr>
	               				<th class="border-bottom-0"><h6>번호</h6></th>
	               				<th class="border-bottom-0"><h6>날짜 및 시간</h6></th>
	               				<th class="border-bottom-0"><h6>상태</h6></th>
	               				<th class="border-bottom-0"><h6>사유</h6></th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               		<c:choose>
	               			<c:when test="${not empty attendance }">
	               			<c:forEach var="ta" items="${attendance }" varStatus="loop">
			               		<tr>
			               			<td>${loop.count}</td>
			               			<td><fmt:formatDate  value="${ta.date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
			               			<td>${ta.state }</td>
			               			<c:choose>
			               				<c:when test="${ta.cause != null}">
			               					<td>${ta.cause }</td>
			               				</c:when>
			               				<c:otherwise>
			               					<td>-</td>
			               				</c:otherwise>
			               			</c:choose>
			               		</tr>
		               		</c:forEach>
		               		</c:when>
		               		<c:otherwise>
		               			<tr>
		               				<td colspan="4">출결 이력이 없습니다.</td>
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
               					<a href="trainer-attendance-list?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
               				</li>
               				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
               					<li class="page-item ${currentPage eq num ? 'active' : '' }">
               						<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
               					</li>
               				</c:forEach>
               				<li class="page-item ${last ? 'disabled' : '' }">
               					<a href="trainer-attendance-list?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
               				</li>
               			</ul>
               		</nav> 
	               </c:if>
	   		</div>
	   	</form>
	   	</div>
	   </div>
	   </div>
   </div>
	<!-- 최근 출결 내역 form End -->
	
	
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
	   let state = document.querySelector("select[name=state]").value;
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