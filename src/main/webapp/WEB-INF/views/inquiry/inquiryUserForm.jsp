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
    <!-- 썸머노트  -->
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
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
                    <h1 class="display-4 text-white animated zoomIn">INQUIRY FORM</h1>
                    <a href="" class="h5 text-white">1:1문의 작성</a>
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

        <div class="container-fluid py-4 wow fadeInUp" data-wow-delay="0.1s">

	        <div class="container py-3">
			   	<div>
			   		<h3>1:1문의 작성하기</h3>
			   	</div>
	            <div class="row g-5">
	                <div class="col-lg-13">
	                    <div class=" rounded h-100 d-flex align-items-center p-5 wow zoomIn" data-wow-delay="0.9s">
	                        <form method="post" action="/inquiry/inquiryRegister" enctype="multipart/form-data">
	                            <div class="row g-3">
	                                <div class="col-12" >
	                                    <select class="form-select bg-light border-0" name="type" style="height: 55px;">
	                                        <option value="수업">수업 관련</option>
	                                        <option value="헬스장">헬스장 관련</option>
	                                        <option value="웹사이트">웹사이트 관련</option>
	                                        <option value="기타">기타</option>
	                                    </select>
	                                </div>
	                                <div class="col-xl-12">
	                                    <input type="text" class="form-control bg-light border-0" name="title" placeholder="제목을 입력하세요." style="height: 55px;">
	                                </div>
	                                <div>
	                                	<label class="attr-value-option"><input type="checkbox" name="secret" value="Y" onchange="kboard_toggle_password_field(this)" checked> 비밀글</label>
										<input type='file' name="photofile" style="margin-left: 20px;"/>
	                                </div>
	                        			<textarea id="summernote" name="content">
	                        				<p>다음 내용을 작성해 주시면 답변 후 회원님의 연락처로 답변 알림을 드리겠습니다.<br>
	                        				(개인정보는 상담관련 내용 이외에 사용하지 않습니다.) </p>
	                        				
	                        				<p style="color:blue;">
		                        				1. 성함 <br>
		                        				<br>
												2. 연락처 <br>
												<br>
												3. 상담내용  <br>
												<br>
												4. 파일
											</p>
	                        			</textarea>
	                                <div class="col-12">
	                                    <button class="btn btn-dark w-100 py-3" type="submit">문의하기</button>
	                                </div>
	                            </div>
	                        </form>
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
<script src="/resources/js/main.js"></script>

<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
// 썸머노트 
$(document).ready(function() {
    $('#summernote').summernote({
        height: 300,
        lang: "ko-KR"
    });
});

$(document).ready(function() {
    $('form').submit(function(e) {
        var title = $('input[name="title"]').val();
        
        if (title.trim() === '') {
            e.preventDefault(); 
            alert('제목을 입력하세요.');
        }
    });
});
</script>

</body>

</html>