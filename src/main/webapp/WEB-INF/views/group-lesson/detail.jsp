<%@ page import="kr.co.helf.vo.Lesson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <title>HELF</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
                <a href="" class="h5 text-white">수업 등록</a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row mb-3">
        <div class="col-12">
            <h1 class="border bg-light fs-4 p-2">그룹레슨 상세 정보</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-12">
            <p>그룹레슨 상세정보를 확인할 수 있습니다.</p>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th class="table-dark" style="width: 15%;">레슨번호</th>
                        <td style="width: 35%;">${lesson.no }</td>
                        <th class="table-dark" style="width: 15%;">레슨명</th>
                        <td style="width: 35%;">${lesson.name }</td>
                    </tr>
                    <tr>
                        <!-- 레슨 날짜에 레슨날짜+레슨시간 출력-->
                        <th class="table-dark" style="width: 15%;">레슨날짜</th>
                        <td style="width: 35%;"><fmt:formatDate value="${lesson.date }" pattern="yyyy년 M월 d일" /> ${lesson.time }시 </td>
                        <th class="table-dark" style="width: 15%;">강사명</th>
                        <td style="width: 35%;">${lesson.user.name }</td>
                    </tr>
                    <tr>
                        <th class="table-dark" style="width: 15%;">신청인원</th>
                        <td style="width: 35%;">${lesson.reqCnt }명</td>
                        <th class="table-dark" style="width: 15%;">총 인원</th>
                        <td style="width: 35%;">${lesson.quota }명</td>
                    </tr>
                    <tr>
                        <th class="table-dark" style="width: 15%;">레슨모집 상태</th>
                        <c:if test="${lesson.reqCnt != lesson.quota && !lesson.past}">
                            <td  style="width: 85%" colspan="3">
                                <span class="badge text-bg-success p-2">모집중</span>
                            </td>
                        </c:if>
                        <c:if test="${lesson.reqCnt == lesson.quota || lesson.past}">
                            <td  style="width: 85%" colspan="3">
                                <span class="badge text-bg-danger p-2">모집완료</span>
                            </td>
                        </c:if>
                    </tr>
                    <tr>
                        <th class="table-dark" style="width: 15%;">설명</th>
                        <td style="width: 85%; height: 200px;" colspan="3">${lesson.description }</td>
                    </tr>
                </tbody>
            </table>

            <sec:authorize access="hasRole('ROLE_MANAGER')">
            <!-- 관리자로 로그인 시 해당 수업에 신청한 회원 보기 -->
            <div class="col-12">
                <div class="card" >
                    <div class="card-header bg-dark" style="color: #ffffff">
                        신청 목록
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th style="width: 20%">유저명</th>
                                <th style="width: 20%">출석 상태</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="lessonApply" items="${lessonApplies}">
                                    <tr>
                                        <td>${lessonApply.user.name}</td>
                                        <td>${lessonApply.attendanceStatus}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </sec:authorize>

            <!-- 유저가 수업 신청 시 뜨는 모달 창 -->
            <div class="modal fade" id="insert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">신청 </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" id="lesson-no" value="${lesson.no }"/>
                            <br />
                            <p>그룹수업 신청을 하시겠습니까?</p>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary btn-sm" id="btn-apply">예</button>
                            <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">아니오</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-end">
                <!-- 유저로 로그인 시 detail.jsp에 보이는 화면 -->
                <sec:authorize access="hasRole('ROLE_USER')">
                <a href="/group-lesson/request?no=${lesson.no }" class="btn btn-warning btn-sm ${lesson.reservation eq '모집완료' ? 'disabled' : ''}" data-bs-toggle="modal" data-bs-target="#insert">신청</a>
                <a href="/group-lesson/list" class="btn btn-primary btn-sm">목록</a>
                </sec:authorize>
                <!-- 트레이너로 로그인 시 detail.jsp에 보이는 화면 -->
                <sec:authorize access="hasRole('ROLE_TRAINER')">
                    <!-- 글 작성자와 로그인 한 아이디가 다르면 수정,삭제 화면출력 x-->
                    <sec:authentication property="principal.id" var="trainerId" />
                    <c:if test="${lesson.user.id eq trainerId}">
                        <a href="/group-lesson/modify?no=${lesson.no }" class="btn btn-warning btn-sm">수정</a>
                        <a href="/group-lesson/delete?no=${lesson.no }" class="btn btn-danger btn-sm">삭제</a>
                    </c:if>
                    <a href="/group-lesson/list" class="btn btn-primary btn-sm">목록</a>
                </sec:authorize>
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
    // 수업 신청시 예외처리
    $(function() {
        $("#btn-apply").click(function(event){
            let lessonNo = $('#lesson-no').val();
            $.get("request", {no: lessonNo})
                // controller에서 맵에 status란 이름으로 담긴 값이 success면 신청완료. fail이면 신청불가
                .done(function(data) {
                    if(data.status === "success"){
                        alert("신청이 완료되었습니다.")
                        location.reload()
                    }else{
                        alert("이미 신청한 레슨입니다.");
                        location.reload()
                    }
                })
        });
    });






</script>


</body>

</html>