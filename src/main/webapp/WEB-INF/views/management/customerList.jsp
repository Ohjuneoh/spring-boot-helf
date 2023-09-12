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
    <title>고객 조회</title>
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
    
    <!-- 전체 고객 목록 form Start -->
     <div class="container">
     	<form id="form-customer-search" class="" method="get" action="customer-list">
     		<!-- 검색 기능 -->
     		<input type="hidden" name="page" value="${param.page }"/>
     		<div class="row mb-3 align-items-center justify-content-center">
			    <div class="d-flex justify-content-center align-items-center">
			        <select class="form-select" name="opt" id="selectOpt" style="margin-right: 10px; width:150px;">
			            <option value="name" ${param.opt eq 'name' ? 'selected' : ''}>이름</option>
			            <option value="tel" ${param.opt eq 'tel' ? 'selected' : '' }>연락처</option>
			        </select>
			
			        <input type="text" class="form-control" name="keyword" value="${param.keyword}" style="width: 300px; margin-right: 10px;" id="inputKeyword"/>
			
			        <button type="button" class="btn btn-primary" onclick="searchCustomer()">
			            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
			            </svg>
			            검색
			        </button>
			    </div>
			</div>
     		<br>
     		<div class="row">
	     		<div class="col-12">
    	 			<table class="table table-bordered" style="text-align:center">
     					<tbody>
     						<tr>
     							<th style="width: 30%;">회원 구분</th>
     							<th style="width: 70%;">
     								<input type="radio" name="userStatus" value="전체회원" ${param.userStatus == null || param.userStatus eq '전체회원' ? 'checked' : '' }/> 전체 회원 
									<input type="radio" name="userStatus" value="유효회원" ${param.userStatus eq '유효회원' ? 'checked' : '' }/> 유효 회원 
									<input type="radio" name="userStatus" value="탈퇴회원" ${param.userStatus eq '탈퇴회원' ? 'checked' : '' }/> 탈퇴 회원 
     							</th>
     						</tr>
     						<tr>
								<th style="width: 30%;">이용권 상태</th>
     							<th style="width: 70%;">
     								<input type="radio" name="membershipState" value="전체" ${param.membershipState == null || param.membershipState eq '전체' ? 'checked' : '' }/> 전체
									<input type="radio" name="membershipState" value="사용대기" ${param.membershipState eq '사용대기' ? 'checked' : '' }/> 사용대기
									<input type="radio" name="membershipState" value="사용가능" ${param.membershipState eq '사용가능' ? 'checked' : '' }/> 사용가능
									<input type="radio" name="membershipState" value="사용중" ${param.membershipState eq '사용중' ? 'checked' : '' }/> 사용중
									<input type="radio" name="membershipState" value="사용불가" ${param.membershipState eq '사용불가' ? 'checked' : '' }/> 사용불가 
     							</th>
     						</tr>
     						<tr>
     							<th style="width: 30%;">잔여횟수</th>
     							<th style="width: 70%;">
     								<input type="text" name="remainderCnt"> 회 이하 
     							</th>
     						</tr>
     						<tr>
     							<th style="width: 30%;">만료일 기간</th>
     							<th style="width: 70%;">
     								<input type="date" name="remainingDays1"> ~ <input type="date" name="remainingDays2">
     							</th>
     						</tr>
						</tbody>
     				</table>
     			</div>
     		</div>
     	</form>
     </div>
     <div class="container">
     	<div class="d-flex align-items-center">
     		<h4 class="mb-3 mr-4">전체 회원 수 ${totalRows}명 </h4> 
    	</div>
    	<div class="row mb-3">
     		<div class="col-12">
     			<table class="table" id="table-customers" style="text-align:center">
     				<thead>
     					<tr>
     						<th>No</th>
     						<th>이름</th>
     						<th>성별</th>
     						<th>전화번호</th>
     						<th>회원상태</th>
     						<th>첫 결제일</th>
     						<th>최근 결제일</th>
     						<th>이용권명</th>
     						<th>이용권 상태</th>
     						<th>만료일</th>
     						<th>잔여횟수</th>
     						<th>잔여기간</th>
     						<th></th>
     					</tr>
     				</thead>
     				<tbody>
     				<c:choose>
     					<c:when test="${not empty customers}">
     						<c:forEach var="cus" items="${customers}" varStatus="status"> 
     							<tr>
    								<td>${status.index + 1 }</td>
    								<td>${cus.userName }</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${cus.userGender == 'WOMAN' }">
	    										<span class="badge" style="background-color: #ffe6fb; color: #6e646c;">여성</span>
	    									</c:when>
	    									<c:when test="${cus.userGender == 'MAN' }">
	    										<span class="badge" style="background-color: #e6f7ff; color: #727a7d;">남성</span>
	    									</c:when>
	    								</c:choose>
    								</td>
    								<td>${cus.userTel }</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${cus.userStatus == 'Y'}">
	    										<span class="badge" style="background-color: #fff1cc; color: #6e6b64;">유효</span>
	    									</c:when>
	    									<c:when test="${cus.userStatus == 'N'}">
	    										<span class="badge" style="background-color: #6e6b64; color: #fff1cc;">탈퇴</span>
	    									</c:when>
	    								</c:choose>
    								</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${not empty cus.firstOrderDate }">
	    										<fmt:formatDate value="${cus.firstOrderDate }" pattern="yyyy-MM-dd"/>
	    									</c:when>
	    									<c:otherwise>-</c:otherwise>
	    								</c:choose>
    								</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${not empty cus.latestOrderDate }">
	    										<fmt:formatDate value="${cus.latestOrderDate }" pattern="yyyy-MM-dd"/>   									
	    									</c:when>
	    									<c:otherwise>-</c:otherwise>
	    								</c:choose>
    								</td>
    								<td>${not empty cus.membershipName ? cus.membershipName : '-'}</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${cus.myMembershipState == '사용불가'}">
	    										<span class="badge" style="background-color: #c46d6a; color: #cfc3c2;">사용불가</span>
	    									</c:when>
	    									<c:when test="${cus.myMembershipState == '사용대기'}">
	    										<span class="badge" style="background-color: #4dc9e8; color: #f2fafc;">사용대기</span>
	    									</c:when>
	    									<c:when test="${cus.myMembershipState == '사용가능'}">
	    										<span class="badge" style="background-color: #4dc9e8; color: #f2fafc;">사용가능</span>
	    									</c:when>
	    									<c:when test="${cus.myMembershipState == '사용중'}">
	    										<span class="badge" style="background-color: #4dc9e8; color: #f2fafc;">사용중</span>
	    									</c:when>
	    								</c:choose>
    								</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${not empty cus.myMembershipEndDate }">${cus.myMembershipEndDate }</c:when>
	    									<c:when test="${empty cus.myMembershipEndDate}">-</c:when>
	    								</c:choose>
    								</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${cus.myMembershipRemainderCnt == -1 }">무제한</c:when>
	    									<c:when test="${empty cus.myMembershipRemainderCnt}">-</c:when>
	    									<c:otherwise>${cus.myMembershipRemainderCnt } 회
	    									</c:otherwise>
	    								</c:choose>
    								</td>
    								<td>
	    								<c:choose>
	    									<c:when test="${not empty cus.getDaysRemaining()}">${cus.getDaysRemaining()} 일</c:when>
	    									<c:when test="${cus.getDaysRemaining() == null }">-</c:when>
	    								</c:choose>
    								</td>
    								<td><a href="/management/customer-detail?id=${cus.userId}" class="btn btn-outline-primary">상세</a></td>
     							</tr>
     						</c:forEach>
     					</c:when>
     					<c:otherwise>
     						<td colspan="13" style="text-align: center; vertical-align: middle;">일치하는 회원 정보가 없습니다.</td>
     					</c:otherwise>
     				</c:choose> 
     			</tbody>
     		</table>
     		<!--  페이지네이션 --> 
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
               					<a href="customer-list?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
               				</li>
               				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
               					<li class="page-item ${currentPage eq num ? 'active' : '' }">
               						<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
               					</li>
               				</c:forEach>
               				<li class="page-item ${last ? 'disabled' : '' }">
               					<a href="customer-list?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
               				</li>
               			</ul>
               		</nav> 
     		</c:if>
     		<div style="text-align:center;">
	     		<a href="/management/customer-list" class="btn btn-primary">목록</a>
     		</div>
     	</div>
     </div>
     </div>
	<!-- 전체 고객 목록 form End -->
	
	
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
	function changeRows(){
		let rows = document.querySelector("select[name=rows]").value;
		document.querySelector("input[name=rows]").value = rows;
		document.querySelector("input[name=page]").value = 1;
		
		document.querySelector("#form-customer-search").submit();
	}
   
	function changePage(event, page){
		event.preventDefault();
		document.querySelector("input[name=page]").value= page;
		document.querySelector("#form-customer-search").submit();
	}
	
	function searchCustomer(){
		document.querySelector("input[name=page]").value = 1;
		let keyword = document.querySelector("input[name=keyword]").value;
		let membershipState = document.querySelector("input[name=membershipState]").value;
		let remainderCnt = document.querySelector("input[name=remainderCnt]").value;
		let remainingDays1 = document.querySelector("input[name=remainingDays1]").value;
		let remainingDays2 = document.querySelector("input[name=remainingDays2]").value;
		document.querySelector("#form-customer-search").submit();
	}
	
	document.getElementById("selectOpt").addEventListener('change', function(){
		let inputBox = document.getElementById('inputKeyword');
		if(this.value === 'tel'){
			inputBox.placeholder= "'010-0000-0000'으로 검색하세요."
		} else {
			inputBox.placeholder = "";
		}
	});
	</script>
</body>

</html>