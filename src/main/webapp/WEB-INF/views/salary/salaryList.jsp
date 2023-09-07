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
                    <h1 class="display-4 text-white animated zoomIn">HELF 급여조회</h1>
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
    
    <!-- 전체 급여 목록 form Start -->
     <div class="container">
     	<form id="form-salary-list" class="" method="get" action="salary-list">
	     	<input type="hidden" name="page" value="${param.page }" />
	     	<div class="row mb-3">
	     	<div class="col-8">
	     		<div class="card">
					임직원 급여 현황 2023년 5월     		
	     		</div>
	     	</div>
	     	<div class="col-4">
	     		<div class="card">
	     			급여정산 요약 
	     		</div>
	     	</div>
	     </div>
	     <div class="container">
	     	<table class="table" id="table-salary">
	     		<thead>
	     			<tr>
	     				<th colspan="4">기본정보</th>
	     				<th colspan="5">급여정보</th>
	     			</tr>
	     			<tr>
	     				<th>이름</th>
	     				<th>성별</th>
	     				<th>재직상태</th>
	     				<th>직급</th>
	     				<th>월급여지급액</th>
	     				<th>기본급</th>
	     				<th>개인수당요율</th>
	     				<th>그룹수당요율</th>
	     				<th>공제율</th>
	     			</tr>
	     		</thead>
	     		<tbody>
	     		<c:choose>
	     			<c:when test="${not empty mySalary }">
	     				<c:forEach var="mySalary" items="${mySalary }">
				     			<tr>
				     				<td>
				     				${mySalary.user.name }
				     				<button type="button" 
				     						class="btn btn-outline-primary btn-sm" 
				     						id="btn-open-modal" 
				     						data-bs-toggle="modal" 
				     						data-bs-target="#salaryModal"
				     						data-user-id="${mySalary.user.id }"
				     						data-trainer-no="${mySalary.trainer.trainerNo }" >설정</button>
				     				<a href="/salary/salary-detail?id=${mySalary.user.id }" class="btn btn-outline-primary btn-sm">상세</a>
				     				</td>
				     				<td>
				     					 <span class="badge bg-info">
				     						${mySalary.user.gender }
				     					 </span>
				     				</td>
				     				<td>
				     					<span class="badge bg-secondary">
				     						${mySalary.user.status }
				     					</span>
				     				</td>
				     				<td>
				     					<span class="badge bg-success">
					     					${mySalary.trainer.title }
				     					</span>
				     				</td>
				     				<td>5,000,000 원</td>
				     				<c:choose>
				     					<c:when test="${mySalary.regularPay != null} ">
				     						<td>${mySalary.regularPay } 원</td>
				     					</c:when>
				     					<c:otherwise>	
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.pclPct != null}">
				     						<td>${mySalary.pclPct }%</td>				     						
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.gclPct != null}">
				     						<td>${mySalary.gclPct }%</td>			     						
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.taxRate != null}">
				     						<td>${mySalary.taxRate }%</td>
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     			</tr>
	     					</c:forEach>
	     				</c:when>
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
	    	</div>
    	</form>
     </div>
	<!-- 전체 고객 목록 form End -->
	
	<!-- Modal 급여 기본 설정 form Start  -->
	<div class="modal fade" id="salaryModal" tabindex="-1" aria-labelledby="salaryModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<form id="modal-form-salary" method="post" action="salary-info-save">
						<div class="card">
							<div class="card-header d-flex justify-content-between align-items-center">
								<h4 class="d-inline-block">01 급여 기본 설정</h4>
								<button type="button" class="btn-close d-inline-block" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="card-body">
								<div class="mb-3">
									<div class="row mb-3">
										<label for="regularPay" class="col-5 col-form-label">기본급 설정</label>
									    	<div class="col-6">
									        	<input type="text" class="form-control" id="regularPay" name="regularPay" placeholder="ex) 2000000"/>
									    	</div>
									    	<div class="col-1">원</div>
									</div>
									<div class="row mb-3">
									<label for="taxRate" class="col-5 col-form-label">공제율</label>
										<div class="col-7">
											<input type="radio" class="form-control-inline" id="taxRate1" name="taxRate" checked value="3.3"/> 3.3% 
										    <input type="radio" class="form-control-inline" id="taxRate2" name="taxRate" value="4.4"/> 4.4%
										</div>
									</div>
								</div>
							</div>
							<div class="card-header d-flex justify-content-between align-items-center">
								<h4 class="d-inline-block">02 개인수업/그룹수업 수당 설정</h4>
							</div>
							<div class="card-body">
								<div class="mb-3">
									<div class="row mb-3">
										<label for="pclCommissionPct" class="col-5 col-form-label">개인수업 커미션 비율 설정</label>
									    	<div class="col-6">
									        	<input type="text" class="form-control" id="pclCommissionPct" name="pclCommissionPct" placeholder="ex) 25"/>
									    	</div>
									    	<div class="col-1">%</div>
									</div>
									<div class="row mb-3">
										<label for="gclCommissionPct" class="col-5 col-form-label">그룹수업 커미션 비율 설정</label>
									    	<div class="col-6">
									        	<input type="text" class="form-control" id="gclCommissionPct" name="gclCommissionPct" placeholder="ex) 25"/>
									    	</div>
									    	<div class="col-1">%</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        	<button type="submit" class="btn btn-primary" id="btn-save">저장</button>
		      </div>
			</div>
		</div>
	</div>
	<!-- Modal 급여 기본 설정 form End  -->
	
	<!-- Modal 저장 성공 Start -->
	<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center">
	                Successfully Saved!
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
<!-- Modal 저장 성공 End -->
	
	
	
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
		document.querySelector("#form-salary-list").submit();
		
	}
	
	const salaryModal = new bootstrap.Modal('#salaryModal', {
		keyboard: false
	});
	
	let currentUserId;
	
	$("#btn-open-modal").click(function(){
		currentUserId = $(this).data("user-id");
		currentTrainerNo = $(this).data("trainer-no");
		$("#salaryModal").modal("show");
	})
	
	$("#btn-save").click(function(){
		
		$("#salaryModal").modal("hide");
		const regularPay = $("#regularPay").val();
		if(!regularPay){
			alert("기본급을 입력하세요.");
			return;
		}
		const taxRate = $('input[name=taxRate]:checked').val();
		if(!taxRate){
			alert("공제율은 선택하세요.");
			return;
		}
		const gclCommissionPct = $("#gclCommissionPct").val();
		if(!gclCommissionPct){
			alert("개인 수업 커미션 비율을 입력하세요.");
			return;
		}
		const pclCommissionPct = $("#pclCommissionPct").val();
		if(!pclCommissionPct){
			alert("그룹 수업 커미션 비율을 입력하세요.");
			return;
		}
		$.ajax({
			type: "POST",
			url: "/salary/salary-info-save",
			data: {
				userId: currentUserId,
				trainerNo: currentTrainerNo,
				regularPay: regularPay,
				taxRate: taxRate,
				gclCommissionPct: gclCommissionPct,
				pclCommissionPct: pclCommissionPct
			},
			success: function(){
				const successModal = new bootstrap.Modal(document.getElementById('successModal'), {});
		        
		        successModal.show();
			}
		})
	})
	</script>
</body>

</html>