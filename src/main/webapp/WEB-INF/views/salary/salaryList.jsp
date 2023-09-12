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
     <div class="container" style="padding:20px;">
     	<form id="form-salary-list" class="" method="get" action="salary-list">
	     	<input type="hidden" name="page" value="${param.page }" />
	     	<div class="row mb-3">
	     	<div class="col-8">
				<h3 style="display: inline-block;">임직원 급여 현황</h3>
				<h3 style="color:#007bff; display: inline-block; margin-left:10px;"><fmt:formatDate value="${graphData[0].salaryDate }" pattern="yyyy년 MM월"/></h3>
				<div class="card" style="background-color: #f0f8ff; border:none; padding-top:20px; border-radius:15px;">
					<canvas id="AllTrainerSalaryBarChart"></canvas>
				</div>
	     	</div>
	     	<div class="col-4">
	     		<h3 >급여정산 요약</h3> 
	     		<div class="card" style="background-color: #f0f8ff; border:none; padding:10px; border-radius:15px;">
	     			<div class="card-body">
	     					<span class="badge" style="background-color: #fff5cc; color: #d1a655; padding-bottm:10px;">확정완료</span>
		     				<!-- 이번 달 급여액 합 계산하기 Start -->
		     				<c:set var="totalSalary" value="0"/>
		     				<c:forEach var="total" items="${mySalary }">
		     					<c:if test="${total.status == 'Y'}">
		     						<c:set var="totalSalary" value="${ totalSalary + total.actualMonthlysalary}"/>
		     					</c:if>
		     				</c:forEach> 
		     				<!-- 이번 달 급여액 합 계산하기 Start -->
		     				<div style="display: flex; justify-content: space-between; align-items: center; padding-top:20px;">
       							<h4 style="color: #2f343d;">급여 지급액 합계</h4>
       							<h4 style="color: #007bff; margin-bottom: 20px;"><fmt:formatNumber value="${totalSalary}" groupingUsed="true"/>원</h4>
    						</div>
	     			</div>
	     			<div class="card-body">
	     					<!-- 이번 달 급여 확정 인원 계산하기 Start -->
							<c:set var="confirmedCnt" value="0"/>
							<c:forEach var="cnt" items="${mySalary}">
							    <c:if test="${cnt.status == 'Y'}">
							        <c:set var="confirmedCnt" value="${confirmedNumber + 1 }"/>
							    </c:if>
							</c:forEach>
							<!-- 이번 달 급여 확정 인원 계산하기 End -->
							<div style="display: flex; justify-content: space-between; align-items: center;">
		     					<h4 style="color: #2f343d;">급여 확정 인원</h4>
		     					<h4 style="color: #007bff; margin-bottom: 20px;">${confirmedCnt}명</h4>
	     					</div>
	     			</div>
	     		</div>
	     	</div>
	     </div>
	     <div class="container" style="padding:20px;">
	     	<table class="table" id="table-salary">
	     		<thead>
	     			<tr>
	     				<th colspan="4">기본정보</th>
	     				<th colspan="2">내역정보</th>
	     				<th colspan="5">급여정보</th>
	     			</tr>
	     			<tr style="text-align: center;">
	     				<th>이름</th>
	     				<th>성별</th>
	     				<th>재직상태</th>
	     				<th>직급</th>
	     				<th>확정상태</th>
	     				<th>내역 발송일</th>
	     				<th>최근지급월</th>
	     				<th>최근지급액</th>
	     				<th>기본급</th>
	     				<th>개인수당요율</th>
	     				<th>그룹수당요율</th>
	     				<th>공제율</th>
	     			</tr>
	     		</thead>
	     		<tbody style="text-align: center;">
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
				     						data-trainer-no="${mySalary.mySalary.trainer.trainerNo }" 
				     						style="margin-left:10px;">설정</button>
				     				<a href="/salary/salary-detail?id=${mySalary.user.id }" class="btn btn-outline-primary btn-sm">상세</a>
				     				</td>
				     				<td>
					     				<c:choose>
					     					<c:when test="${mySalary.user.gender == 'MAN'}">
					     						<span class="badge bg-info">남성</span>
					     					</c:when>
					     					<c:when test="${mySalary.user.gender == 'WOMAN'}">
					     						<span class="badge bg-info">여성</span>
					     					</c:when>
					     				</c:choose>
				     				</td>
				     				<td>
					     				<c:choose>
						     				<c:when test="${mySalary.user.status == 'R'}">
						     					<span class="badge bg-secondary">승인대기</span>				     					
						     				</c:when>
						     				<c:when test="${mySalary.user.status == 'Y'}">
						     					<span class="badge bg-secondary">재직</span>				     					
						     				</c:when>
						     				<c:when test="${mySalary.user.status == 'N'}">
						     					<span class="badge bg-secondary">퇴사</span>				     					
						     				</c:when>
						     			</c:choose>
				     				</td>
				     				<td>
				     					<c:choose>
				     						<c:when test="${mySalary.mySalary.trainer.title == '점장' }">
				     							<span class="badge bg-success">점장</span>
				     						</c:when>
				     						<c:when test="${ mySalary.mySalary.trainer.title == '직원' }">
				     							<span class="badge" style="background-color: #72cc75; color: white;">트레이너</span>
				     						</c:when>
				     						<c:otherwise>-</c:otherwise>
				     					</c:choose>
				     				</td>
				     				<c:choose>
				     					<c:when test="${mySalary.status == 'Y'}">
				     						<td>
				     							<span class="badge" style="background-color: #fff5cc; color: #d1a655;">확정완료</span>
				     						</td>
				     					</c:when>
				     					<c:when test="${empty mySalary.status }">
				     						<td>
				     							<span class="badge" style="background-color: #f5f5f5; color: #d1a655;">확정대기</span>
				     						</td>
				     					</c:when>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${not empty mySalary.insertedDate }">
				     				<td><fmt:formatDate value="${mySalary.insertedDate }" pattern="yyyy-MM-dd"/></td>
				     					</c:when>
				     					<c:when test="${empty mySalary.insertedDate }">
				     						<td>-</td>
				     					</c:when>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${not empty mySalary.salaryDate }">
				     						<td><fmt:formatDate value="${mySalary.salaryDate }" pattern="yyyy년 MM월"/></td>				     						
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${not empty mySalary.actualMonthlysalary }">
				     						<td><fmt:formatNumber value="${mySalary.actualMonthlysalary }" groupingUsed="true" />원</td>
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.mySalary.regularPay != null}">
				     						<td><fmt:formatNumber value="${mySalary.mySalary.regularPay }" groupingUsed="true"/>원</td>
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.mySalary.pclPct != null}">
				     						<td>${mySalary.mySalary.pclPct }%</td>				     						
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.mySalary.gclPct != null}">
				     						<td>${mySalary.mySalary.gclPct }%</td>			     						
				     					</c:when>
				     					<c:otherwise>
				     						<td>-</td>
				     					</c:otherwise>
				     				</c:choose>
				     				<c:choose>
				     					<c:when test="${mySalary.mySalary.taxRate != null}">
				     						<td><fmt:formatNumber value="${mySalary.mySalary.taxRate *100 }" pattern="#.#"/>%</td>
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
					<input type="hidden" id="userId" name="userId">
					<input type="hidden" id="trainerNo" name="trainerNo">
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
									<div class="row mb-3">
										<label for="gclLessonFee" class="col-5 col-form-label">그룹수업 단가 설정</label>
									    	<div class="col-6">
									        	<input type="text" class="form-control" id="gclLessonFee" name="gclLessonFee" placeholder="ex)30000"/>
									    	</div>
									    	<div class="col-1">원</div>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
	
	$('#salaryModal').on('show.bs.modal', function (event) {
		  let button = $(event.relatedTarget);
		  let userId = button.data('user-id');
		  let trainerNo = button.data('trainer-no');
		  let modal = $(this);
		  modal.find('#userId').val(userId);
		  modal.find('#trainerNo').val(trainerNo);
		});
	
	$('#btn-save').click(function(e) {
		  e.preventDefault();
		  
			const regularPay = $("#regularPay").val();
			if(!regularPay){
				alert("기본급을 입력하세요.");
				return;
			}
			if(!/^\d+$/.test(regularPay)){
			     alert("기본급에는 숫자만 입력 가능합니다.");
			     return;
			}
			const taxRate = $('input[name=taxRate]:checked').val();
			if(!taxRate){
				alert("공제율은 선택하세요.");
				return;
			}
			const gclCommissionPct = $("#gclCommissionPct").val();
			if(!gclCommissionPct){
				alert("그룹 수업 커미션 비율을 입력하세요.");
				return;
			}
			if(!/^\d+$/.test(gclCommissionPct) || gclCommissionPct < 0 || gclCommissionPct > 100){
		        alert("개인 수업 커미션 비율은 0에서 100 사이의 숫자만 가능합니다.");
		        return;
		    }			
			const pclCommissionPct = $("#pclCommissionPct").val();
			if(!pclCommissionPct){
				alert("개인 수업 커미션 비율을 입력하세요.");
				return;
			}
			if(!/^\d+$/.test(pclCommissionPct) || pclCommissionPct < 0 || pclCommissionPct > 100){
		        alert("그룹 수업 커미션 비율은 0에서 100 사이의 숫자만 가능합니다.");
		        return;
		    }
			const gclLessonFee = $("#gclLessonFee").val();
			if(!gclLessonFee){
				alert("그룹수업 단가를 입력하세요. ");
				return;
			}
			if(!/^\d+$/.test(gclLessonFee)){
		        alert("그룹수업 단가에는 숫자만 입력 가능합니다.");
		        return;
		    }
			
		  let data = {
		    userId: $("#userId").val(),
		    trainerNo: $("#trainerNo").val(),
		    regularPay: $("#regularPay").val(),
		    taxRate: $("input[name='taxRate']:checked").val(),
		    gclCommissionPct: $("#gclCommissionPct").val(),
		    pclCommissionPct: $("#pclCommissionPct").val(),
		    gclLessonFee: $("#gclLessonFee").val()
		  };

		  $.ajax({
		    type: "POST",
		    url: "/salary/salary-info-save", // your form's action
		    data: data,
		    success: function(response) {
		      alert('기본급 설정이 완료되었습니다.');
		      $('#salaryModal').modal('hide');
		      location.reload();
		    },
		    error: function(error) {
		      alert('처리하는 과정에서 오류가 발생했습니다.');
		    }
		  });
		});
	
	// 임직원 지난달 급여 내역 그래프 관련 js
	var salary = [];
	var userName = [];
	
	<c:forEach var="record" items="${graphData}">
		salary.push(${record.actualMonthlysalary});
		userName.push('${record.user.name}');
	</c:forEach>
	
	console.log(salary);
	console.log(userName);
	
	var ctx = document.getElementById('AllTrainerSalaryBarChart').getContext('2d');
	
	var chart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: userName,
			datasets: [{
			label: '임직원 급여',
			backgroundColor: '#268fff',
            borderColor: '#268fff',
            data: salary,
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