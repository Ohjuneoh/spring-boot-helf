<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-section">
	<div>
	</div>
	<div class="card-body">
    	<form method="get" action="/salary/tab3Content">
			<div class="row" style="margin-bottom: 60px;">
				<div class="col-7">
					<h3>최근 정산 현황</h3>
					<div class="card" style="background-color: #f0f8ff; border: none;">
					그래프가 표시될 거예요! 
					</div>
				</div>
				<div class="col-5">
					<div style="display: flex; align-items: center; justify-content: space-between;">
				        <h3>개인레슨 수당 정산액</h3>
					</div>
				    <div class="card" style="background-color: #f0f8ff; border: none; padding: 20px;"> 
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <div>
					            <p style="margin-bottom: 5px;">수당정산하기</p>
					            <h4 style="color: #007bff; margin-bottom: 20px;">3,500,000원</h4>
					        </div>
					        <button type="button" style="color: white; background-color: #007bff; padding: 10px 15px; border: none; border-radius: 5px; font-weight: bold;">정산하기</button>
					    </div>
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <span id="dateRange">${param.startDate } ~ ${param.endDate }</span>
					        <span class="badge" style="background-color: #fff5cc; color: #d1a655;">35회</span>
					    </div>
					</div>
				</div>
			</div>
			<div style="display: flex; justify-content: space-between; align-items: center;">
	   			<h3>개인레슨 수당 내역 <span>35건</span></h3>
	    		<span>
	    			<input type="month" id="dateInput" style="margin-right: 10px;">
	    			<button type="submit" class="btn btn-outline-primary" id="btn-search">조회</button>
	    		</span>
			</div>
			<table class="table">
			<thead>
				<tr>
					<th>일자</th>
					<th>시간</th>
					<th>회원명</th>		
					<th>이용권명</th>	
					<th>수업상태</th>	
					<th>이용권금액</th>	
					<th>수당정산액</th>	
					<th>수업단가</th>	
					<th>수업요율</th>		
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty monthlyPclList }">
					<c:forEach var="pcl" items="${monthlyPclList }">
						<tr>
							<td>${pcl.date }</td>
							<td>${pcl.time }</td>
							<td>${pcl.userName}</td>
							<td>${pcl.membershipName }</td>
							<td>${pcl.status }</td>
							<td>${pcl.membershipPrice }</td>
							<td>${pcl.lessonPrice}</td>
							<td>${pcl.unitPrice}</td>
							<td>${pcl.pclPct}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			</tbody>
		</table>
		<!--  페이지네이션 Start --> 
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
	     	<!-- 페이지네이션 End -->
    	</form>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
<!--let startDate = moment().startOf('month').format('YYYY-MM-DD');
let endDate = moment().endOf('month').format('YYYY-MM-DD');

function updateDateRangeDisplay() {
    $('#dateRange').text(startDate + ' ~ ' + endDate);
} 

updateDateRangeDisplay();
refreshData();-->

$("#btn-search").click(function() {
   let dateInput = $("#dateInput").val();

   startDate = moment(dateInput).startOf('month').format("YYYY-MM-DD");
   endDate = moment(dateInput).endOf('month').format("YYYY-MM-DD");

   // Update the date range every time it changes
   updateDateRangeDisplay();
   refreshData();
});

var userId = "${param.id}";

function refreshData() {
  	$.ajax({
  		type: "POST",
  		url: "/salary/tab3ContentDetail",
  		data: {
  			userId:userId,
  			startDate: startDate,
  			endDate: endDate
  		},
  		success:function(response){
  			
  		},
  		error: function(xhr, status, error) {
  		    alert('An error occurred: ' + status + '\n' + error);
  		}
  	});
}

</script>




