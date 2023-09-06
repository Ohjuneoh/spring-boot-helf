<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                    <h1 class="display-4 text-white animated zoomIn">INQUIRY</h1>
                    <a href="" class="h5 text-white">1:1 문의</a>
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
    <div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
		<div class="container py-5">
			<div class="row mb-3">
				<div class="col-12 d-flex justify-content-center" >
					<div id="boardlist" class="wrap_inner" style="width: 1200px;">
						<div class="card-body">
							<!-- 검색 -->
						    <div class="d-flex justify-content-center mb-4">
								<div class="card" style="margin-bottom: 20px; width: 1500px;" >
							    	<div class="card-body">
							    		<form action="inquiries" method="get">
											<div class="row mb-3 pt-3">
												<label style="margin-bottom: 10px;">
													<strong>‘자주하는 질문(F&Q)’ 을 먼저 확인하여 주시기 바랍니다.</strong>
												</label>
												<div class="col-2">
													<select name="type" class="form-select">
														<option selected="selected" disabled="disabled">전체보기</option>
														<option value="name" ${param.type eq 'name' ? 'selected' : '' }>제목</option>
														<option value="id" ${param.type eq 'id' ? 'selected' : '' }>작성자</option>
													</select>
												</div>
												<div class="col-9">
											        <input type="text" style="width: 100%;" name="keyword" class="form-control" value="${param.keyword }">
											    </div>
											    <div class="col-1">
											        <button type="submit" class="btn btn-success">검색</button>
											    </div>
											    <input type="hidden" name="page" value="${param.page }">
											</div>
							    		</form>						
									</div>
								</div>
						    </div>
			               <table class="table">
			               		<thead>
									<tr>
			                        	<th style="width: 20%;">글번호</th>
			                        	<th style="width: 30%;">제목</th>
			                        	<th style="width: 20%;">작성자</th>
			                        	<th style="width: 20%;">작성일</th>
			                        	<th style="width: 10%;">답변여부</th>
			                     	</tr>
								</thead>
							   <tbody>
							   <c:forEach var="inquiry" items="${result.inquiries }">
				                        <tr>
											<td>${inquiry.no }</td>
											<td>
												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal.username" var="loginUserId"/>
												</sec:authorize>
												<a href="/inquiry/inquiryDetail?no=${inquiry.no }"
													class="${inquiry.secret == 'N' || (inquiry.secret == 'Y' && loginUserId == inquiry.user.id) ? '': 'disabled'}">
													<c:if test="${inquiry.secret == 'Y' }">
														<i class="bi bi-lock-fill"></i>
													</c:if>
													${inquiry.title }
												</a>
											</td>
				                        	<td>${inquiry.user.name }</td>
				                        	<td><fmt:formatDate value="${inquiry.createDate }" pattern="yyyy년 M월 d일" /></td>
											<td>
												 <c:choose>
											        <c:when test="${inquiry.isAnswer eq 'N'}">
											            미답변
											        </c:when>
											        <c:when test="${inquiry.isAnswer eq 'Y'}">
											            답변완료
											        </c:when>
											    </c:choose>
											</td>
		                    		 	</tr>
							   </c:forEach>


							   </tbody>
			               </table>
			               <sec:authorize access="hasRole('ROLE_USER')">
			               <div class="ExpandMoreBtn_more_btn_box__5lBg8 d-flex justify-content-end align-items-center">
								<a href="inquiryUserForm" class="btn btn-primary btn-sm" >
									문의하기
								</a>
							</div>
			               </sec:authorize>
        				</div>
    				</div>
    			</div>
    		</div>
        </div>
    </div>
    
    
	<div class="row mb-3" >
		<div class="col-12" style="text-align: center;">
			<c:choose>
				<c:when test="${not empty result }">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item ${result.pagination.first ? 'disabled' : '' }">
						<a class="page-link"  href="inquiries?page=${result.pagination.prePage }" >이전</a>
					</li>
				<c:forEach var="num" begin="${result.pagination.beginPage }" end="${result.pagination.endPage }">
					<li class="page-item ${result.pagination.page eq num ? 'active' : '' }">
						<a class="page-link" href="inquiries?page=${num }" >${num }</a>
					</li>
				</c:forEach>
					<li class="page-item ${result.pagination.last ? 'disabled' : '' }">
						<a class="page-link" href="inquiries?page=${result.pagination.nextPage }" >다음</a>
					</li>
				</ul>
			</nav>
				</c:when>
			</c:choose>
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

<script>

</script>

    
</body>

</html>