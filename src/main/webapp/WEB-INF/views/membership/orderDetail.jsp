<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <title>HELF</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
    <!-- Date Picker  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->

    <!-- Topnavbar Start -->
   	<jsp:include page="../common/topnavbar.jsp" />
    <!-- Topnavbar End -->

    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="../common/navbar.jsp">
			<jsp:param name="menu" value="이용권"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">MY ORDER</h1>
                </div>
            </div>
        </div>
    </div>
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
	<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
				<h5 class="fw-bold text-primary text-uppercase">Your Order Detail</h5>
				<h1 class="mb-0">구매내역 상세정보</h1>
			</div>
			<c:if test="${param.error eq 'dup' }">
				<div class="alert alert-danger text-center" style="height: 50px; width: 700px; margin: 0 auto;">
					<strong>[중복 오류]</strong> 현재 사용중인 이용권이 존재하기 때문에 환불취소가 불가합니다.
				</div>
			</c:if>
			<div class="text-center d-flex align-items-center justify-content-center">
				<div>
					<table class="table table-bordered" style="margin: 50px; width: 700px;">
			   			<thead>
			   				<tr>
			   					<th class="bg-primary" style="color:white; height: 35px;" colspan="4"></th>
			   				</tr>
			   				<tr>
			   					<th>
			   						${dto.orderJoin.name }
			   						<c:forEach var="myOption" items="${dto.myOptionJoins }">
										<br/><br/>${myOption.name }
			   						</c:forEach>
			   					</th>
				   				<td style="width: 150px;">
				   					<c:if test="${dto.orderJoin.remainderCnt eq null }">
					   					${dto.orderJoin.period.duration }개월
				   					</c:if>
				   					<c:if test="${dto.orderJoin.remainderCnt ne null }">
				   						${dto.orderJoin.period.property }회
				   					</c:if>
				   					<c:forEach var="myOption" items="${dto.myOptionJoins }">
										<br/><br/>${dto.orderJoin.period.duration }개월
			   						</c:forEach>
				   				</td>
				   				<td style="width: 150px;">
				   					<fmt:formatNumber value="${dto.orderJoin.membershipPrice }" pattern="###,###"/>원
				   					<c:forEach var="myOption" items="${dto.myOptionJoins }">
										<br/><br/><fmt:formatNumber value="${myOption.price }"/> 원
			   						</c:forEach>
				   				</td>
				   				<td rowspan="4" style="vertical-align: middle;">
				   					${dto.orderJoin.orderState }
				   					<c:if test="${dto.orderJoin.orderState eq '환불대기' }">
										<br/>
										<form action="cancle-refund" method="post">
											<button class="btn btn-warning btn-sm" style="margin-top: 5px;">취소</button>
											<input type="hidden" name="no" value="${dto.orderJoin.no }">
											<input type="hidden" name="page" value="${param.page }">
											<input type="hidden" name="state" value="${param.state }">
											<input type="hidden" name="type" value="${param.type }">
											<input type="hidden" name="keyword" value="${param.keyword}">
										</form>
									</c:if>
				   				</td>
			   				</tr>
			   				<tr>
			   					<th>
			   						부가세
			   					</th>
			   					<td colspan="2">
			   						<fmt:formatNumber value="${dto.orderJoin.surtax }" pattern="###,###"/>원
			   					</td>
			   				</tr>
			   				<tr>
			   					<th>포인트 내역</th>
			   					<td colspan="2">
			   						<div class="d-grid gap-2 col-6 mx-auto align-items-center justify-content-center text-center"
				 						 data-bs-toggle="modal" data-bs-target="#point-modal">
			   							<button id="btn-point" class="btn btn-success btn-sm">내역보기</button>
			   						</div>
			   					</td>
			   				</tr>
			   				<tr>
			   					<th>
			   						<strong>총 결제 금액</strong>
			   					</th>
			   					<td colspan="2" >
			   						<strong>
			   							<span id="total-price-text">
			   								<fmt:formatNumber value="${dto.orderJoin.totalPrice }" pattern="###,###"/>
			   							</span>원
			   						</strong>
			   					</td>
			   				</tr>
		   					<c:if test="${dto.orderJoin.orderState ne '결제완료' }">
				   				<tr>
				   					<th>
				   						<strong>환불금액</strong>
				   					</th>
				   					<td colspan="2" >
				   						<strong>
				   							<span>
				   								<fmt:formatNumber value="${dto.refund.amount }" pattern="###,###"/>
				   							</span>원
				   						</strong>
				   					</td>
				   				</tr>
		   					</c:if>
			   			</thead>
					</table>
					<div style="margin-top: 80px;">
						<a href="order-list?page=${param.page }&state=${param.state }&type=${param.type }&keyword=${param.keyword}" 
						   class="btn btn-primary">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="point-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  		<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">포인트 내역</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="card" >
								<div class="card-body align-items-center justify-content-center text-center">
									<table class="table">
										<thead>
			                        		<tr>
			                            		<th style="width: 30%;">사용 날짜</th>
			                            		<th style="width: 30%;">포인트 금액</th>
			                            		<th style="width: 30%;">속성</th>
			                        		</tr>
										</thead>
			                    		<tbody>
											<c:forEach var="point" items="${dto.orderJoin.points }">
												<tr>
													<td>${point.useDate }</td>
													<td>${point.usePoint }P</td>
													<td>${point.type}</td>
												</tr>
 											</c:forEach>
				                        </tbody>
		                    		</table>
		                    	</div>
		                    </div>
						</div>
						<div class="modal-footer">
							<br/>
				    	</div>
					</div>
				</div>
			</div>
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://momentjs.com/downloads/moment.min.js"></script>
    <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>
</body>
</html>