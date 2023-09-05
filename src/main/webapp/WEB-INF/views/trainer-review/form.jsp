<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <title>HELF</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    
    <!-- Star Review  -->
	<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
	    .rate { display: inline-block;border: 0;margin-right: 15px;}
	    .rate > input {display: none;}
	    .rate > label {float: right;color: #ddd}
	    .rate > label:before {display: inline-block;font-size: 2rem;padding: .1rem .3rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
	    .rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
	    .rate input:checked ~ label, 
	    .rate label:hover,.rate label:hover ~ label { color: #0d6efd !important;  } 
	    .rate input:checked + .rate label:hover,
	    .rate input input:checked ~ label:hover,
	    .rate input:checked ~ .rate label:hover ~ label,  
	    .rate label:hover ~ input:checked ~ label { color: #0d6efd !important;  } 
  	</style>
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
<!-- 위에 모든 페이지까지 공통부분 건들 x -->
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
                <h1 class="display-4 text-white animated zoomIn">REGISTER</h1>
                <a href="" class="h5 text-white">리뷰 등록</a>
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
    <!-- Lesson Category Start  -->
</div>
<div class="container-fluid py-1 wow fadeInUp " data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
            <div class="container ">
                <div class="row g-1" >
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Lesson Category End -->
<!-- Lesson Register Form Start  -->
<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
    <div class="container py-5">
        <form class="" method="post" action="/trainer-review/registration">
            <div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
                <div class="container ">
                    <div class="row g-1" >
                        <div class="section-title position-relative pb-3 mb-5">
                            <h5 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">리뷰 등록</h5>
                            <h1 class="mb-0" style="font-size: 15px;" >내용을 입력해주세요</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-1">
                <!-- 리뷰작성 버튼에서 전달받은 lessonApply번호를 히든으로 넣어둠 -->
                <input type="hidden"  name="lessonApplyNo" value="${param.applyNo }"/>
                <input type="hidden" name="lessonNo" value="${param.lessonNo }" />
                <div class="col-6">
                    <input type="text" class="form-control bg-light border-0" name="title" placeholder="제목" style="height: 55px;">
                </div>
                <div class="col-6 ">
                  	<fieldset class="rate">
	                    <input type="radio" id="rating10" name="rating" value="5"><label for="rating10" title="5점"></label>
	                    <input type="radio" id="rating9" name="rating" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
	                    <input type="radio" id="rating8" name="rating" value="4"><label for="rating8" title="4점"></label>
	                    <input type="radio" id="rating7" name="rating" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
	                    <input type="radio" id="rating6" name="rating" value="3"><label for="rating6" title="3점"></label>
	                    <input type="radio" id="rating5" name="rating" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
	                    <input type="radio" id="rating4" name="rating" value="2"><label for="rating4" title="2점"></label>
	                    <input type="radio" id="rating3" name="rating" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
	                    <input type="radio" id="rating2" name="rating" value="1"><label for="rating2" title="1점"></label>
	                    <input type="radio" id="rating1" name="rating" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
               		</fieldset>
                </div>
                <div class="col-12">
                    <textarea class="form-control bg-light border-0" name="content" style="height: 300px;" placeholder="내용"></textarea>
                </div>
            </div>
            <div>
                <button type="button" id="btn-cancel" class=" btn btn-danger mt-1 float-end" style="margin-left: 5px;">취소</button>
                <button type="submit" class="btn btn-primary mt-1 float-end">등록</button>
            </div>
        </form>
    </div>
</div>
<!-- Footer End -->
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

<script>




</script>


</body>

</html>