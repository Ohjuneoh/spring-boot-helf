<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <title>강사 소개</title>
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
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <jsp:include page="common/topnavbar.jsp"/>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0">
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">강사 소개</h1>
                    <a href="/" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">강사 소개</a>
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


    <!-- Team Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    	<div class="container py-5">
			<div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                <h5 class="fw-bold text-primary text-uppercase">TRAINERS</h5>
                <h1 class="mb-0">HELF 헬스장의<br> 트레이너를 소개합니다.</h1>
            </div>
            <div class="row g-5" id="box-trainer">
	            <c:forEach var="trainer" items="${trainers }">
	                <div class="col-lg-3 wow slideInUp" data-wow-delay="0.3s">
	                    <div class="team-item bg-light rounded overflow-hidden">
	                        <div class="team-img position-relative overflow-hidden">
	                            <img class="img-fluid w-100" src="/resources/img/team-1.jpg" alt="" data-trainer-no="${trainer.trainerNo}" >
	                        </div>
	                        <div class="text-center py-4">
	                            <h4 class="text-primary">${trainer.user.name }</h4>
	                            <p class="text-uppercase m-0">${trainer.title }</p>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
            </div>
    	</div>
	</div>   
    <!-- Team End -->
    
    <!-- 강사 모달창  -->
    <div class="modal" tabindex="-1" id="modal-teacher">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title">트레이너 상세정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <div class="modal-body">
	        <p>
	        	자격<br>
	        	경력<br>
	        	수상이력<br>
	        </p>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

              <a href="" class="btn btn-primary">강사후기 보러가기</a>

	      </div>
	      
	    </div>
	  </div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
	
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

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
    
    
    <script type="text/javascript">
    let teacherModal = new bootstrap.Modal("#modal-teacher");

    // 이미지 클릭시 실행하게 되는 코드
    $("#box-trainer img").click(function() {
        // 클릭시 속성값이 "data-trainer-no"인 것을 찾아서 trainerNo에 저장
        let trainerNo = $(this).attr("data-trainer-no");
        // id가 modalteacher 안 a 태그에 속성이 "href"인 것에 Url을  대입
        $("#modal-teacher a").attr("href", "/trainer-review/list?trainerNo=" + trainerNo);
       teacherModal.show();
    });


    </script>
</body>

</html>