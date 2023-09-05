<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>
/* Button-like appearance */
.btn-like {
    display: inline-block;
    padding: 10px 15px;
    margin: 5px;
    border: 2px solid blue;
    background-color: transparent;
    color: blue;
    cursor: pointer;
    transition: all 0.3s;
}

/* Selected state appearance */
input[type="radio"]:checked + .btn-like {
    background-color: blue;
    color: white;
}
.spacing-top {
    margin-top: 20px;
}

</style>
<head>
    <meta charset="utf-8">
    <title>ATTENDANCE</title>
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
    
    <!-- 직원 출퇴근 form Start -->
     <div class="container">
		<div class="row row-cols-1 row-cols-md-2 g-4">
  			<div class="col">
    			<p class="d-inline-flex gap-1">
  					<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    					출퇴근 등록하기
  					</button>
				</p>
				<div class="collapse" id="collapseExample">
  					<div class="card card-body" style="width: 1200px;">
    					<form action="attendance-register" method="get" id="attendanceForm">
    						<input type="radio" class="btn-check" id="in" name="attendance" value="출근" autocomplete="off">
    						<label for="in" class="btn btn-outline-primary" style=" margin-right: 20px;">출근</label>
    						
    						<input type="radio" class="btn-check" id="out" name="attendance" value="퇴근" autocomplete="off">
    						<label for="out" class="btn btn-outline-primary" style=" margin-right: 20px;">퇴근</label>
    						
    						
    						<select name="attendance" id="others" class="btn btn-outline-primary"> 
    							<option value="" selected disabled>--기타--</option>
    							<option value="지각">지각</option>
    							<option value="외출">외출</option>
    							<option value="외근">외근</option>
    							<option value="복귀">복귀</option>
    						</select>
    						<br>
							<div class="spacing-top" style="display: flex; align-items: center;">
							 	<span style="margin-right: 10px;">사유</span>
								 <input type="text" id="cause" name="cause" style="width:80%;" class="form-control">
							</div>
    						<br>
    						<button type="submit" class="btn btn-primary">등록</button>
    					</form>
  					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th style="width:5%"></th>
									<th style="width:45%">날짜 및 시간</th>
									<th style="width:20%">출근 상태</th>
									<th style="width:30%">기타</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty result.attendances}">
										<c:forEach var="attendance" items="${result.attendances }">
											<tr>
												<td style="width:5%">${attendance.no }</td>
												<td style="width:45%"><fmt:formatDate value="${attendance.date }" pattern="yyyy년 M월 d일 a h시 m분" /></td>
												<td style="width:20%">${attendance.state}</td>
												<td style="width:30%">${attendance.cause }</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<!-- 페이지네이션 -->
						<c:if test="${result.pagination.totalRows gt 0 }">
							<c:set var="currentPage" value="${result.pagination.page }"/>
							<c:set var="first" value="${result.pagination.first }"/>
							<c:set var="last" value="${result.pagination.last }"/>
							<c:set var="prePage" value="${result.pagination.prePage }" />
							<c:set var="nextPage" value="${result.pagination.nextPage }"/>
							<c:set var="beginPage" value="${result.pagination.beginPage }"/>
							<c:set var="endPage" value="${result.pagination.endPage }"/>
							<nav>
								<ul class="pagination justify-content-center">
									<li class="page-item ${first ? 'disabled' : '' }">
										<a href="list?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage })">이전</a>
									</li>
									<c:forEach var="num" begin="${beginPage }" end="${endPage }">
										<li class="page-item ${currentPage eq num ? 'active' : '' }">
											<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
										</li>
									</c:forEach>
									<li class="page-item ${last ? 'disabled' : '' }">
										<a href="list?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
									</li>
								</ul>
							</nav>
						</c:if>
						<!-- ** 검색 기능 **  -->
						<div class="d-flex justify-content-center">
							<form id="form-attendance-search" class="row row-cols-md-auto g-3 align-items-center" method="get" action="attendance">
								<input type="hidden" name="page" value="${param.page }"/>
								<div class="col-12">
								 	<select class="form-select" name="state">
								 		<option value="전체" ${param.state eq 'all' ? 'selected' : '' }>전체</option>
										<option value="출근" ${param.state eq 'in' ? 'selected' : ''}>출근</option>
										<option value="퇴근" ${param.state eq 'out' ? 'selected' : '' }>퇴근</option>
										<option value="지각" ${param.state eq 'late' ? 'selected' : '' }>지각</option>
										<option value="외출" ${param.state eq 'break' ? 'selected' : '' }>외출</option>
										<option value="외근" ${param.state eq 'outside' ? 'selected' : '' }>외근</option>
										<option value="복귀" ${param.state eq 'return' ? 'selected' : '' }>복귀</option>
									</select>
								</div>
								<div class="col-12">
									<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
								</div>
								 <div class="col-12">
			                        <button type="button" class="btn btn-primary btn-sm" onclick="searchCause()">검색</button>
			                     </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 직원 출퇴근 form End -->
	
	
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

    function changePage(event, page){
    	event.preventDefault();
    	document.querySelector("input[name=page]").value=page;
    	document.querySelector("#form-attendance-search").submit();
    }
    
    function searchCause(){
    	document.querySelector("input[name=page]").value= 1;
    	/* let keyword = document.querySelector("input[name=keyword]").value;
    	if(keyword.trim()===""){
    		alert("키워드를 입력하세요.");
    		document.querySelector("input[name=keyword]").focus();
    		return;
    	} */
    	document.querySelector("input[name=page]").value= 1;
    	document.querySelector("#form-attendance-search").submit();
    	
    }
    
    // 출퇴근 버튼 한 개만 선택되게 하기 
 	$("#in, #out").change(function() {
 		$("#others").removeClass('bg-primary text-white').prop('selectedIndex', 0);
 	});
    
    $("#others").change(function() {
    	$(this).addClass('bg-primary text-white');
    	$("#out").prop("checked", false);
    	$("#in").prop("checked", false);
    })
    
    
   // 출퇴근 버튼 선택되지 않으면 경고창 띄우기 
   	$("#attendanceForm").submit(function(){
   		
   		let isCheckedIn = $("#in").prop("checked");
   		let isCheckedOut = $("#out").prop("checked");
   		let isCheckedOthers = $("#others").val();
   		
   		if (!(isCheckedIn || isCheckedOut || isCheckedOthers)) {
   			alert("출퇴근 항목을 선택하세요");
    		return false;
   		}
   		
   		return true;
   	});
   
   
	</script>
</body>

</html>