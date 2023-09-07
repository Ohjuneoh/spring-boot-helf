<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>

</style>

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
   	<jsp:include page="/WEB-INF/views/common/topnavbar.jsp" />
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="/WEB-INF/views/common/navbar.jsp">
			<jsp:param name="menu" value="수업"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">MY PAGE</h1>
                    <a href="" class="h5 text-white">내 정보 조회</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5">
    		<div class="row my-3">
    			<div class="col-4">
    				<div class="profile_pic">
						<img src="https://atimg.sonyunara.com/files/attrangs/mempic/me.png" class="profile-img" style=" top:48%; left:55%;  width:70%">
					</div>
    			</div>
    			<div class="col-4 ">
    				<h4 class="mb-5"><strong style="color: blue;">${userInfo.name }</strong>님 [유저]</h4>
    				<c:if test="${userInfo.social eq 'kakao' }"> 
    				<p><strong>소셜 로그인 회원입니다.</strong></p>
    				</c:if>
    				<c:if test="${userInfo.social eq 'web' }"> 
    				<p><strong>성별 : </strong> ${userInfo.gender }</p> 	
    				<p><strong>전화번호 : </strong> ${userInfo.tel }</p>
    				<p><strong>이메일 : </strong> ${userInfo.email }</p>
    				</c:if>
    				<p><strong>등급 : </strong> <span>${userInfo.rank.name } </span></p>
    				<p><strong>포인트 : </strong> <span>${userInfo.point } </span>점 </p>
    			</div>
    			<div class="col-4 text-end">
    				<c:if test="${userInfo.social eq 'web' }"> 
    				<a class="btn btn-outline-light btn-sm mb-2" href="/user/userModify">수정</a>
    				</c:if>
    				<a class="btn btn-outline-light btn-sm mb-2" href="/user/withdrawal" onclick="return confirmDelete();" >회원탈퇴</a>
    			</div>
    		</div>
    		<hr>
    		<div class="row my-3 " >
    			<div class="col-6">
    				<div class="card">
    					<div class="card-header">내 문의내역</div>
    					<div class="card-body">
    						<p class="text-end"><a href="/user/moreInquiries">더보기</a></p>
    						<table class="table">
    							<thead>
    								<tr>
    									<th>제목</th>
    									<th>등록일자</th>
    									<th>답변여부</th>
    								</tr>
    							</thead>
    							<tbody>
	    							<c:choose>
										<c:when test="${empty moreInquiries }">
											<tr>
												<td colspan="5" class="text-center">
													등록된 리뷰가 없습니다.
												</td>
											</tr>
										</c:when>
									</c:choose>
									<c:forEach var="moreInquiries" items="${moreInquiries}" varStatus="status">
										<c:choose>
											<c:when test="${status.index < 5}">
												<tr>
													<td>${moreInquiries.title}</td>
													<td><fmt:formatDate value="${moreInquiries.createDate}" pattern="yyyy년 M월 d일" /></td>
													<td>
														<c:choose>
													        <c:when test="${moreInquiries.isAnswer eq 'N'}">
													            미답변
													        </c:when>
													        <c:when test="${moreInquiries.isAnswer eq 'Y'}">
													            답변완료
													        </c:when>
													    </c:choose>
													</td>
												</tr>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</c:forEach>
    							</tbody>
    						</table>
    					</div>
    				</div>
    			</div>

    			<div class="col-6">
    				<div class="card">
    					<div class="card-header">내 리뷰내역</div>
    					<div class="card-body">
    						<p class="text-end"><a href="/user/moreReviews">더보기</a></p>
							<table class="table">
								<thead>
								<tr>
									<th>수업명</th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty reviews }">
										<tr>
											<td colspan="5" class="text-center">
												등록된 리뷰가 없습니다.
											</td>
										</tr>
									</c:when>
								</c:choose>
									<c:forEach var="reviews" items="${reviews}" varStatus="status">
										<c:choose>
											<c:when test="${status.index < 5}">
												<tr>
													<td>${reviews.lesson.name}</td>
													<td>${reviews.title}</td>
													<td><fmt:formatDate value="${reviews.createDate}" pattern="yyyy년 M월 d일" /></td>
												</tr>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <!-- Lesson Register Form End  -->
    
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>


	<script type="text/javascript">
	let faqModal = new bootstrap.Modal("#modal-faq");
	
	$(".service-item").click(function() {
	
		faqModal.show();
	});

	function confirmDelete() {
	    return confirm('정말로 탈퇴하시겠습니까? (되돌릴 수 없습니다.)');
	}
	

</script>


    
</body>

</html>