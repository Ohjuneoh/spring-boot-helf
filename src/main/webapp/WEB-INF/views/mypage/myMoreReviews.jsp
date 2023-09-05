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
<div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
  <div class="container py-5">
    <div class="row mb-3">
      <div class="col-12">
        <div class="card" >
          <div class="card-header bg-dark" style="color: #ffffff">
            내 리뷰 목록
          </div>
          <div class="card-body">
            <table class="table">
              <thead>
              <tr>
                <th style="width: 15%">리뷰 번호</th>
                <th style="width: 20%">수업 명</th>
                <th style="width: 20%">강사 명</th>
                <th style="width: 20%">제목</th>
                <th style="width: 20%">작성일</th>
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
              <c:forEach var="reviews" items="${reviews }">
                <tr>
                  <td>${reviews.no}</td>
                  <td>${reviews.lesson.name}</td>
                  <td><a href="/trainer-review/list?trainerNo=${reviews.trainer.trainerNo}" />${reviews.lesson.user.name}</td>
                  <td>${reviews.title}</td>
                  <td><fmt:formatDate value="${reviews.createDate}" pattern="yyyy년 M월 d일" /></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
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