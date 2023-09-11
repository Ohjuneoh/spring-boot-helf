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
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
    
 	<div class="container my-5 ">
        <div class="section-title position-relative pb-3 mb-3">
	   		<h1 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">내 정보</h1>
		</div>
        <div class="d-flex align-items-center mb-3">
            <img src="/resources/img/photo/유저사진.png" class="rounded-circle mr-2" style="width: 150px; height: 150px; ">
            <div class="ml-4" style="margin-left: 40px;">
                <h1 class="text-dark">${userInfo.name } <span style="font-size: 30px; color: #b0b0b0;">유저</span></h1>
		        <div>
		        	<c:if test="${userInfo.social eq 'web' }">
		        	<a href="/user/userModify" class="btn btn-primary btn-sm">수정하기</a>
		        	</c:if>
		        	<a class="btn btn-danger btn-sm" href="/user/withdrawal" onclick="return confirmWithdrawal();">회원탈퇴</a>
		        </div>
            </div>
        </div>
        <hr>
        <!-- Personal Information Section -->
        <section class="mb-4">
            <div class="row">
				<div class="col-4 ">
				<h2 class="mb-3 text-dark">개인 정보</h2>
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
            </div>
        </section>
        
   
    
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
    
    <!-- Lesson Register Form End  -->
	<div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
	    <div class="container">
	        <div class="row gx-5">
	            <div class="col-lg-8 col-md-6">
	                <div class="row gx-5">
	                    <div class="col-lg-4 col-md-12 pt-5 mb-5">
	                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
	                            <h3 class="text-light mb-0">Get In Touch</h3>
	                        </div>
	                        <div class="d-flex mb-2">
	                            <i class="bi bi-geo-alt text-primary me-2"></i>
	                            <p class="mb-0">123 Street, New York, USA</p>
	                        </div>
	                        <div class="d-flex mb-2">
	                            <i class="bi bi-envelope-open text-primary me-2"></i>
	                            <p class="mb-0">info@example.com</p>
	                        </div>
	                        <div class="d-flex mb-2">
	                            <i class="bi bi-telephone text-primary me-2"></i>
	                            <p class="mb-0">+012 345 67890</p>
	                        </div>
	                        <div class="d-flex mt-4">
	                            <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
	                            <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
	                            <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
	                            <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
	                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
	                            <h3 class="text-light mb-0">Quick Links</h3>
	                        </div>
	                        <div class="link-animated d-flex flex-column justify-content-start">
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
	                            <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
	                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
	                            <h3 class="text-light mb-0">Popular Links</h3>
	                        </div>
	                        <div class="link-animated d-flex flex-column justify-content-start">
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
	                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
	                            <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="container-fluid text-white" style="background: #061429;">
	    <div class="container text-center">
	        <div class="row justify-content-end">
	            <div class="col-lg-8 col-md-6">
	                <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
	                    <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. 
			
			<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
			Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- Footer End -->


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

function confirmWithdrawal() {
    return confirm('정말로 탈퇴하시겠습니까?');
}
</script>

    
</body>

</html>