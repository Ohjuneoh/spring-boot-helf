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
    <title>임직원 조회</title>
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
    
    <!-- 전체 강사 목록 form Start -->
     <div class="container">
     	<form id="form-trainer-search" class="" method="get" action="trainer-list">
     		<!-- 검색 기능 -->
     		<input type="hidden" name="page" value="${param.page }"/>
     		<div class="row mb-3 align-items-center">
     		<div class="col-2 pl-1">
     			<select class="form-select" name="opt" id="selectOpt">
     				<option disabled selected>전체</option>
     				<option value="name" ${param.opt eq 'name' ? 'selected' : ''}>이름</option>
     				<option value="tel" ${param.opt eq 'tel' ? 'selected' : '' }>연락처</option>
     			</select>
     		</div>
     			<div class="col-md-5 pr-1">
     				<input type="text" class="form-control" name="keyword" value="${param.keyword}" style="width: 80%; margin:0 auto;" id="inputKeyword"/>
     			</div>
     			<div class="col-2 pl-1">
     				<button type="button" class="btn btn-primary" onclick="searchTrainer()">
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
    	 			<table class="table table-bordered">
     					<tbody>
     						<tr>
     							<th style="width: 30%;">임직원 구분</th>
     							<th style="width: 70%;">
     								<input type="radio" name="trainerStatus" value="전체" checked/> 전체  
     								<input type="radio" name="trainerStatus" value="재직"/> 재직
     								<input type="radio" name="trainerStatus" value="퇴직"/> 퇴직
     								<input type="radio" name="trainerStatus" value="승인대기"/> 승인대기
     							</th>
     						</tr>
     						<tr>
								<th style="width: 30%;">직급</th>
     							<th style="width: 70%;">
     								<input type="radio" name="trainerTitle" value="전체" checked/> 전체
     								<input type="radio" name="trainerTitle" value="점장"/> 점장
     								<input type="radio" name="trainerTitle" value="직원"/> 강사 
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
     		<h4 class="mb-3 mr-4">전체 임직원 수 ${totalRows }명 </h4> 
     		<span class="px-2"></span>
     		<div class="d-flex justify-content-start mb-3">
     			<select class="form-select" style="width: 150px;" name="rows" onchange="changeRows()">
     				<option value="10" ${param.rows eq 10 ? 'selected' : '' }>10개씩</option>
     				<option value="20" ${param.rows eq 20 ? 'selected' : '' }>20개씩</option>
     				<option value="30" ${param.rows eq 30 ? 'selected' : '' }>30개씩</option>
     			</select>
     		</div>
    	</div>
    	<div class="row mb-3">
     		<div class="col-12">
     			<table class="table" id="table-trainers">
     				<thead>
     					<tr>
     						<th>No</th>
     						<th>이름</th>
     						<th>성별</th>
     						<th>전화번호</th>
     						<th>상태</th>
     						<th>직급</th>
     						<th>입사일</th>
     						<th>퇴사일</th>
     						<th></th>
     					</tr>
     				</thead>
     				<tbody>
     				<c:choose>
     					<c:when test="${not empty trainers }">
     						<c:forEach var="trainer" items="${trainers }" varStatus="status">
	     						<tr>
	    							<td>${status.index +1 }</td>
	    							<td>${trainer.user.name }</td>
	    							<c:choose>
	    								<c:when test="${trainer.user.gender == 'MAN'}">
	    									<td>남성</td>
	    								</c:when>
	    								<c:when test="${trainer.user.gender == 'WOMAN'}">
	    									<td>여성</td>
	    								</c:when>
	    							</c:choose>
	    							<td>${trainer.user.tel }</td>
	    							<c:choose>
	    								<c:when test="${trainer.user.status == 'R'}">
	    									<td>승인대기</td>
	    								</c:when>
	    								<c:when test="${trainer.user.status == 'Y' }">
	    									<td>재직</td>
	    								</c:when>
	    								<c:when test="${trainer.user.status == 'N'}">
	    									<td>퇴사</td>
	    								</c:when>
	    							</c:choose>
	    							<c:choose>
									    <c:when test="${trainer.user.status == 'R'}">
									        <td>
									        	<button  class="btn btn-outline-primary" data-trainer-no="${trainer.trainerNo }" >직급부여</button>
									        </td>
									    </c:when>
									    <c:otherwise>
									        <td>${trainer.title}</td>
									    </c:otherwise>
									</c:choose>
	    							<td><fmt:formatDate value="${trainer.hiredDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
	    							<c:choose>
	    								<c:when test="${trainer.resignationDate != null}">
	   										<td><fmt:formatDate value="${trainer.resignationDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>	    									
	    								</c:when>
	    								<c:otherwise>
	    									<td>-</td>
	    								</c:otherwise>
	    							</c:choose>
	   								<td><a href="/management/trainer-detail?id=${trainer.user.id }" class="btn btn-outline-primary">상세</a></td>
	    						</tr>
	    							
	    					</c:forEach>
    					</c:when>
    					<c:otherwise>
    						<td colspan="9" style="text-align: center; vertical-align: middle;">일치하는 임직원 정보가 없습니다. </td>
    					</c:otherwise>
     				</c:choose>
     			</tbody>
     		</table>
     		<!-- 페이지네이션 -->
     		<c:if test="${pagination.totalRows gt 0 }">
     			<c:set var="currentPage" value="${pagination.page }"/>
     			<c:set var="first" value="${pagination.first }"/>
     			<c:set var="last" value="${pagination.last }" />
     			<c:set var="prePage" value="${pagination.prePage }"/>
     			<c:set var="nextPage" value="${pagination.nextPage }"/>
     			<c:set var="beginPage" value="${pagination.beginPage }"/>
     			<c:set var="endPage" value="${pagination.endPage }"/>
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
	     		<a href="/management/trainer-list" class="btn btn-primary">목록</a>
     		</div>
     	</div>
     </div>
     </div>
     
     <!-- 직급부여 모달 by 유리 -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
		<form id="form-change-position" action="give-position" method="post" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">직급 부여하기</h4>
	        <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
			  	<div class="modal-body">
					<input type="hidden" name="trainerNo" value="" >
					<input type="hidden" name="trainerStatus" value="${param.trainerStatus}">
					<input type="hidden" name="trainerTitle" value="${param.trainerTitle}">
					<input type="hidden" name="opt" value="${param.opt}">
					<input type="hidden" name="keyword" value="${param.keyword}">
					<input type="hidden" name="rows" value="${param.rows}">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="position" value="점장">
						<label class="form-check-label" for="managerRadio">점장</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="position" value="직원">
						<label class="form-check-label" for="employeeRadio">직원</label>
					</div>
				 </div>
				 <div class="modal-footer">
					<button id="btn-submit" type="submit" class="btn btn-primary"  disabled>확인</button>
				</div>
	    </div>
    	</form>
	  </div>
	</div>
	<!-- 전체 강사 목록 form End -->
	
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

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    
    <script type="text/javascript">
    
    let myModal = new bootstrap.Modal(document.getElementById("myModal"))
    $("#table-trainers tbody button.btn-outline-primary").click(function() {
    	let trainerNo = $(this).attr("data-trainer-no");
    	$("input[name=trainerNo]").val(trainerNo);
    	myModal.show()
    });
	
	$("[name=position]").on('click', function() {
		$("#btn-submit").removeAttr('disabled');
	})
	
	$("#btn-close").on('click', function () {
		$("[name=position]").prop("checked", false);
		$("#btn-submit").attr('disabled', true);
	})
    
	function changeRows(){
		let rows = document.querySelector("select[name=rows]").value;
		document.querySelector("input[name=rows]").value= rows;
		document.querySelector("input[name=page]").value= 1;
		
		document.querySelector("#form-trainer-search").submit();
	}
	
	function changePage(event, page){
		event.preventDefault();
		document.querySelector("input[name=page]").value = page;
		document.querySelector("#form-trainer-search").submit();
	}
	
	function searchTrainer(){
		document.querySelector("input[name=page]").value = 1;
		let keyword = document.querySelector("input[name=keyword]").value;
		let trainerStatus = document.querySelector("input[name=trainerStatus]").value;
		let trainerTitle = document.querySelector("input[name=trainerTitle]").value;
		document.querySelector("#form-trainer-search").submit();
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