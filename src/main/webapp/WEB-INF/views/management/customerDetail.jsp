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
    <title>고객 상세 정보</title>
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
    
    <!-- 회원별 상세 페이지 form Start -->
   <div class="container">
  	 <div class="testimonial-item">
     	<div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
     		<c:choose>
     			<c:when test="${customerInfo.user.gender == 'MAN'}">
     				<img class="/resources/img-fluid rounded" src="/resources/img/남1.png" style="width: 150px; height: 150px;" >
     			</c:when>
     			<c:when test="${customerInfo.user.gender == 'WOMAN'}">
        			<img class="/resources/img-fluid rounded" src="/resources/img/여1_bg.png" style="width: 150px; height: 150px;" >
     			</c:when>
     		</c:choose>
            	<div class="ps-2">
                	<h4 class="text-primary mb-1">${customerInfo.user.name} 회원</h4>
                      <div class="text-uppercase"><span class="badge bg-primary">${customerInfo.user.rank.name }</span>
                      <span class="badge bg-info">
                      	<c:choose>
                      		<c:when test="${customerInfo.user.gender == 'MAN'}">남성</c:when>
                      		<c:when test="${customerInfo.user.gender == 'WOMAN'}">여성</c:when>
                      	</c:choose>
                      </span>
                      <span class="badge bg-secondary">${customerInfo.user.tel }</span>
                      <span class="badge bg-success">
                      	<c:choose>
                      		<c:when test="${customerInfo.user.status == 'Y'}">유효회원</c:when>
                      		<c:when test="${customerInfo.user.status == 'N'}">탈퇴회원</c:when>
                      	</c:choose>
                      </span>
                      </div>
                </div>
        </div>
     	<div class="pt-4 pb-5 px-5">
        	<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
        		<tbody>
        			<tr>
        				<th style="width: 13%">회원아이디</th>
        				<th style="width: 20%">${customerInfo.user.id }</th>
        				<th style="width: 13%">이메일</th>
        				<th style="width: 20%">${customerInfo.user.email }</th>
        				<th style="width: 14%">최초 등록일</th>
        				<th style="width: 20%"><fmt:formatDate value="${customerInfo.user.createDate }" pattern="yyyy-MM-dd"/></th>
        			</tr>
        			<tr>
        				<th style="width: 13%">최근 방문일</th>
        				<c:choose>
        					<c:when test="${customerInfo.recentVisitDate !=null}">
        				<th style="width: 20%"><fmt:formatDate value="${customerInfo.recentVisitDate}" pattern="yyyy-MM-dd"/></th>
        					</c:when>
        					<c:otherwise>
        				<th>-</th>
        					</c:otherwise>
        				</c:choose>
        				<th style="width: 13%">누적 결제금액</th>
        				<c:choose>
        					<c:when test="${customerInfo.accumulatedOrderTotalPrice !=null}">
        				<th style="width: 20%">${customerInfo.accumulatedOrderTotalPrice }원</th>
        					</c:when>
        					<c:otherwise>
        				<th>0원</th>
        					</c:otherwise>
        				</c:choose>
        				<th style="width: 14%">적립 포인트</th>
        				<th style="width: 20%">${customerInfo.user.point }점</th>
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
            	<h3 class="mb-0 text-primary">최근 개인수업 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
            	<p style="text-align: right;"><a href="customer-personal-lesson?id=${customerInfo.user.id }">자세히보기</a></p>
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead>
	               			<tr>
	               				<th>수업날짜</th>
	               				<th>예약날짜</th>
	               				<th>수업명</th>
	               				<th>담당강사</th>
	               				<th>출결상태</th>
	               				<th>이용권명</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               			<c:set var="rowCount" value="0"/>
	               			<c:choose>
	               				<c:when test="${not empty personalLesson }">
	               					<c:forEach var="pl" items="${personalLesson }" varStatus="loop">
	               						<c:if test="${loop.index <3 }">
					               			<tr>
					               				<td><fmt:formatDate value="${pl.date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate> ${pl.time}시</td>
					               				<td><fmt:formatDate value="${pl.createDate }" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
					               				<td>${pl.name}</td>
					               				<td>${pl.trainer.user.name }</td>
					               		<c:choose>
					               			<c:when test="${pl.status == 'W'}">
					               				<td>예약완료</td>
					               			</c:when>
					               			<c:when test="${pl.status == 'Y'}">
					               				<td>출석</td>
					               			</c:when>
					               			<c:otherwise>	
					               				<td>결석</td>
					               			</c:otherwise>
					               		</c:choose>
					               				<td>${pl.myMembership.membership.name }</td>
				               				</tr>
	               							<c:set var="rowCount" value="${rowCount +1 }"/>
	               						</c:if>
	               					</c:forEach>
	               				</c:when>
	               				<c:otherwise>
	               					<tr>
		               					<td colspan="6">수업 신청 내역이 없습니다.</td>
	               					</tr>
	               				</c:otherwise>
	               			</c:choose>
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
            	<h3 class="mb-0 text-primary">최근 그룹수업 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
            	<p style="text-align: right;"><a href="customer-lesson?id=${customerInfo.user.id }">자세히보기</a></p>
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead>
	               			<tr>
	               				<th>수업날짜</th>
	               				<th>예약날짜</th>
	               				<th>수업명</th>
	               				<th>담당강사</th>
	               				<th>출결상태</th>
	               				<th>이용권명</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               			<c:set var="rowCount" value="0"/>
	               			<c:choose>
	               				<c:when test="${not empty groupLesson }">
	               					<c:forEach var="la" items="${groupLesson }" varStatus="loop">
	               						<c:if test="${loop.index <3 }">
					               			<tr>
					               				<td><fmt:formatDate value="${la.lesson.date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate> ${la.lesson.time}</td>
					               				<td><fmt:formatDate value="${la.applyDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
					               				<td>${la.lesson.name}</td>
					               				<td>${la.lesson.user.name }</td>
					               		<c:choose>
					               			<c:when test="${la.attendanceStatus == 'W'}">
					               				<td>예약완료</td>
					               			</c:when>
					               			<c:when test="${la.attendanceStatus == 'Y'}">
					               				<td>출석</td>
					               			</c:when>
					               			<c:otherwise>	
					               				<td>결석</td>
					               			</c:otherwise>
					               		</c:choose>
					               				<td>${la.myMembership.membership.name }</td>
				               				</tr>
	               							<c:set var="rowCount" value="${rowCount +1 }"/>
	               						</c:if>
	               					</c:forEach>
	               				</c:when>
	               				<c:otherwise>
	               					<tr>
		               					<td colspan="6">수업 신청 내역이 없습니다.</td>
	               					</tr>
	               				</c:otherwise>
	               			</c:choose>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<!-- 최근 결제 내역  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">최근 결제 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;" id="table-order-list">
               			<thead>
	               			<tr>
	               				<th>결제날짜</th>
	               				<th>이용권명</th>
	               				<th>결제금액</th>
	               				<th>이용권금액</th>
	               				<th>결제상태</th>
	               				<th>옵션이용</th>
	               			</tr>
	               		</thead>
	               		<tbody id="order-table-body">
	               		<c:set var="rowCount" value="0"/>
	               		<c:choose>
	               			<c:when test="${not empty customerOrderDto}">
	               				<c:forEach var="od" items="${customerOrderDto}" varStatus="loop">
	               					<c:if test="${loop.index <3 }">
				               			<tr>
				               				<td>${od.order.paymentDate }</td>
				               				<td>${od.order.myMembership.membership.name }</td>
				               				<td>${od.order.totalPrice }</td>
				               				<td>${od.order.membershipPrice }</td>
				               				<td>${od.order.state }</td>
				               				<c:choose>
				               					<c:when test="${not empty od.myOption}">
				               				<td>${od.myOption.optionDetail.option.name }</td>
				               					</c:when>
				               					<c:otherwise>	
				               				<td>-</td>
				               					</c:otherwise>
				               				</c:choose>
				               			</tr>
				               			<c:set var="rowCount" value="${rowCount + 1 }"/>
		               				</c:if>
		               				<c:if test="${loop.index >=3 }">
				               			<tr class="hidden-row">
				               				<td>${od.order.paymentDate }</td>
				               				<td>${od.order.myMembership.membership.name }</td>
				               				<td>${od.order.totalPrice }</td>
				               				<td>${od.order.membershipPrice }</td>
				               				<td>${od.order.state }</td>
				               				<c:choose>
				               					<c:when test="${not empty od.myOption.optionDetail.option.name}">
				               				<td>${od.myOption.optionDetail.option.name }</td>
				               					</c:when>
				               					<c:otherwise>	
				               				<td>-</td>
				               					</c:otherwise>
				               				</c:choose>
				               			</tr>
		               				</c:if>
		               			</c:forEach>
		               			<c:choose>
	               					<c:when test="${rowCount >=3 }">
			               				<tr id="see-more-myMemberships">
			               					<td colspan="7" style="cursor:pointer;" id="td-more-myMemberships">더보기</td>
			               				</tr>
	               					</c:when>
	               				</c:choose>
	               			</c:when>
	               			<c:otherwise>
	               				<tr>
	               					<td colspan="6">최근 결제 내역이 없습니다.</td>
	               				</tr>
	               			</c:otherwise>
	               		</c:choose>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<!-- 이용권 목록  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">이용권 목록 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
              		<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;" id="table-myMembership-list">
               			<thead>
	               			<tr>
	               				<th>종류</th>
	               				<th>이용권명</th>
	               				<th>이용권 상태</th>
	               				<th>시작날짜</th>
	               				<th>만료날짜</th>
	               				<th>잔여기간</th>
	               				<th>잔여횟수</th>
	               			</tr>
	               		</thead>
	               		<tbody id="membership-table-body">
	               		<c:set var="rowCount" value="0"/>
	               		<c:choose>
	               			<c:when test="${not empty myMembershipList }">
	               				<c:forEach var="mm" items="${myMembershipList}" varStatus="loop">
	               					<c:if test="${loop.index <3 }">
				               			<tr>
				               				<td>${mm.membership.category.property }제</td>
				               				<td>${mm.membership.name }</td>
				               			<c:choose>	
				               				<c:when test="${mm.state == 'Y' }">
				               					<td>이용중</td>
				               				</c:when>
				               				<c:otherwise>
				               					<td>만료</td>
				               				</c:otherwise>
				               			</c:choose>
				               				<td>${mm.startDate }</td>
				               				<td>${mm.endDate }</td>
				               			<c:choose>
				               				<c:when test="${mm.remainPeriod() < 0}">
				               					<td>-</td>
				               				</c:when>
				               				<c:otherwise>
					               				<td>${mm.remainPeriod() }일</td>
				               				</c:otherwise>
				               			</c:choose>
				               			<c:choose>
					               			<c:when test="${mm.remainderCnt == -1 }">
					               				<td>무제한</td>
					               			</c:when>
					               			<c:otherwise>
					               				<td>${mm.remainderCnt }회</td>
					               			</c:otherwise>
				               			</c:choose>
				               			</tr>
				               			<c:set var="rowCount" value="${rowCount +1 }"/>
			               			</c:if>
			               			<c:if test="${loop.index >=3 }">
			               				<tr class="hidden-row">
				               				<td>${mm.membership.category.property }제</td>
				               				<td>${mm.membership.name }</td>
					               			<c:choose>	
					               				<c:when test="${mm.state == 'Y' }">
					               					<td>이용중</td>
					               				</c:when>
					               				<c:otherwise>
					               					<td>만료</td>
					               				</c:otherwise>
					               			</c:choose>
					               				<td>${mm.startDate }</td>
					               				<td>${mm.endDate }</td>
					               				<td></td>
					               			<c:choose>
						               			<c:when test="${mm.remainderCnt == -1 }">
						               				<td>무제한</td>
						               			</c:when>
						               			<c:otherwise>
						               				<td>${mm.remainderCnt }회</td>
						               			</c:otherwise>
					               			</c:choose>
			               				</tr>
			               			</c:if>
		               			</c:forEach>
	               				<c:choose>
	               					<c:when test="${rowCount >=3 }">
			               				<tr id="see-more-myMemberships">
			               					<td colspan="7" style="cursor:pointer;" id="td-more-myMemberships">더보기</td>
			               				</tr>
	               					</c:when>
	               				</c:choose>
	               			</c:when>
	               			<c:otherwise>
	               				<tr>
	               					<td colspan="7">사용가능한 이용권이 없습니다.</td>
	               				</tr>
	               			</c:otherwise>
	               		</c:choose>
	               		</tbody>
	               </table>
            	</div>
        	</div>
     	</div>
   	</div>
   	<!-- 최근 방문 내역  -->	
  <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
   	<div class="container py-5">
    	<div class="col-12">
        	<div class="section-title position-relative pb-3">
            	<h3 class="mb-0 text-primary">최근 방문 내역 </h3>
            </div>
            <div class="col-sm wow zoomIn" data-wow-delay="0.2s">
            	<p style="text-align: right;"><a href="customer-recent-visit?id=${customerInfo.user.id }">자세히보기</a></p>
            	<table class="table table-bordered shadow-sm" style="text-align: center; vertical-align: middle;">
               			<thead>
	               			<tr>
	               				<th>번호</th>
	               				<th>방문날짜</th>
	               				<th>이용권 종류</th>
	               				<th>이용권명</th>
	               				<th>수업명</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               		<c:set var="rowCount" value="0"/>
	               		<c:choose>
	               			<c:when test="${not empty customerAttendance }">
	               				<c:forEach var="att" items="${customerAttendance }" varStatus="loop">
	               					<c:if test="${loop.index <3 }">
				               			<tr>
				               				<td>${att.no }</td>
				               				<td><fmt:formatDate value="${att.date }" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
				               				<td>${att.myMembership.membership.category.name }</td>
				               				<td>${att.myMembership.membership.name }</td>
				               				<c:choose>
				               					<c:when test="${not empty att.lessonName }">
				               				<td>${att.lessonName }</td>
				               					</c:when>
				               					<c:otherwise>
				               						<td>-</td>
				               					</c:otherwise>
				               				</c:choose>
			               				</tr>
			               				<c:set var="rowCount" value="${rowCount + 1 }"/>
			               			</c:if>
			               		</c:forEach>
			               		<c:forEach begin="1" end="${3-rowCount }">
		               				<tr>
			               				<td>-</td>
			               				<td>-</td>
			               				<td>-</td>
			               				<td>-</td>
			               				<td>-</td>
			               				<td>-</td>
		               				</tr>
	               				</c:forEach>
	               			</c:when>
	               			<c:otherwise>	
	               				<tr>
	               					<td colspan="5">방문 이력이 없습니다.</td>
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
		<a href="/management/customer-list" class="btn btn-primary">목록</a>
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
	
    <!-- 이용권 목록 더보기 Start -->
    $(document).ready(function() {
        // Initialize some rows to be hidden
        $("#membership-table-body tr.hidden-row").hide(); // Assuming the 'hidden-row' class initially hides the row

        // Show more rows when '더보기' is clicked
        $("#td-more-myMemberships").click(function() {
            $("#membership-table-body tr.hidden-row").slice(0, 3).removeClass("hidden-row").show();
            
            // Hide the '더보기' row if there are no more hidden rows
            if ($("#membership-table-body tr.hidden-row").length == 0) {
                $("#see-more-myMemberships").hide();
                alert("마지막 페이지입니다.");
            }
        });
    });
    <!-- 이용권 목록 더보기 End -->
    
    <!-- 최근 결제 내역 더보기 Start -->
    $(document).ready(function(){
    	$("#order-table-body tr.hidden-row").hide();
    	$("#td-more-orders").click(function(){
    		$("#order-table-body tr.hidden-row").slice(0,3).removeClass("hidden-row").show();
    		
    		if($("#order-table-body tr.hidden-row").length == 0){
    			$("#see-more-orders").hide();
    			alert("마지막 페이지입니다.");
    		}
    	});
    });
    <!-- 최근 결제 내역 더보기 End -->
    
	</script>
</body>

</html>