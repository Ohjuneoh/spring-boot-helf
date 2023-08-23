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
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <!-- 별점구현하기 위한 css -->
  <style>
    .inner-star::before{color: #FF9600;}
    .outer-star {position: relative;display: inline-block;color: #CCCCCC;}
    .inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
    .outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
  </style>
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
        <h1 class="display-4 text-white animated zoomIn">REVIEWLIST</h1>
        <a href="" class="h5 text-white">리뷰 목록</a>
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
<div class="container-fluid py-0 wow fadeInUp " data-wow-delay="0.1s" style="margin-top: 1px;">
  <div class="container py-5 bg-light">
    <div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" >
      <div class="container ">
        <div class="row g-1 d-flex align-items-start" >
          <div class="section-title position-relative pb-3 mb-5 col-6" >
            <h2 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">최근후기</h2>
            <h3 class="mb-3" >생생한 후기를 확인하세요!</h3>
          </div>
          <div id="1" class="col-6 d-flex align-items-center">
            <div id="2" class="d-flex justify-content-end">
              <p class="m-1 text-primary" style="font-size: 80px;">5.0</p>
            </div>
            <div id="3" class="d-flex flex-column align-items-start m-1">
              <h6 class="m-1 text-primary" style="font-size: 20px;">★★★★★</h6>
              <strong class="m-1" style="font-size: 10px;">11개의 리뷰</strong>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr style="height: 3px; color: skyblue;" ></hr>
    <c:forEach var="trainerReview" items="${reviews }">
    <!-- 한 사람에 해당되는 전체 div-->
    <div class="testimonial-item bg-light my-4 ">
      <h5 class="m-1 text-primary float-end">★★★★★</h5>
      <div class="d-flex align-items-center pt-3 pb-1 px-5">
        <h5 class="text-primary">${trainerReview.lesson.name }</h5>
      </div>
      <!-- 리뷰 내용 위의 작성자명, 작성일자 div -->
      <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
        <img class="img-fluid rounded" src="/resources/img/testimonial-1.jpg" style="width: 60px; height: 60px;" >
        <div class="ps-4">
          <h4 class="text-primary mb-1">${trainerReview.lessonApply.user.id }</h4>
          <small class="text-uppercase">${trainerReview.createDate }</small>
        </div>
      </div>
      <!-- 작성일자 밑에 있는 리뷰내용 div -->
      <div class="pt-4 pb-5 px-5">
        <h6>${trainerReview.title }</h6>
        <p>${trainerReview.content }</p>
      </div>
      <hr style="height: 1px; color: gray;" ></hr>
    </div>
    </c:forEach>
    <!-- 한 사람에 해당되는 전체 div 끝-->
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
  // 별점출력 하기 위한 쿼리
  <%--/*<![CDATA[*/ ratings = {RatingScore: 4.5}--%>
  <%--  totalRating = 5;--%>
  <%--table = document.querySelector('.RatingStar');--%>
  <%--function rateIt() {--%>
  <%--  for (rating in ratings) {--%>
  <%--    ratingPercentage = ratings[rating] / totalRating * 100;--%>
  <%--    ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';--%>
  <%--    star = table.querySelector(`.${rating} .inner-star`);--%>
  <%--    numberRating = table.querySelector(`.${rating} .numberRating`);--%>
  <%--    star.style.width = ratingRounded;--%>
  <%--    numberRating.innerText = ratings[rating];--%>
  <%--  }--%>
  <%--}--%>
  <%--rateIt()--%>
  <%--  /*]]>*/--%>
</script>


</body>

</html>