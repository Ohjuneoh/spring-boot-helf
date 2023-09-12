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
                <h1 class="display-4 text-white animated zoomIn">LESSONLIST</h1>
                <a href="" class="h5 text-white">수업 목록</a>
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
            	<div>
				    <button id="personal-lesson-button" class="btn btn-outline-primary mb-1 active" type="button"  >개인수업</button>
				    <button id="group-lesson-button" class="btn btn-outline-primary mb-1" type="button">그룹수업</button>
				</div>
				
				<!-- PersonalLesson start  -->
                <div class="card"  id="personal-lesson">
                    <div class="card-header bg-dark" style="color: #ffffff">
		                <c:if test="${not empty personalLessonList}">
							담당 강사명 : <strong style="font-size: 20px;"class="text-info"><c:out value="${personalLessonList[0].user.name}" /></strong>
							
						</c:if>
						<p class="mb-0" style="font-size: 8px;">
						    <c:choose>
						        <c:when test="${not empty personalLessonList}">
						            <strong>남은 PT회수 : <c:out value="${personalLessonList[0].myMembership.remainderCnt}"></c:out>회</strong>
						        </c:when>
						        <c:otherwise>
						            <strong>&nbsp;</strong>
						        </c:otherwise>
						    </c:choose>
						</p>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 35%">수업명</th>
                                <th class="text-center" style="width: 20%">수업 날짜</th>
                                <th class="text-center" style="width: 15%">수업 시간</th>
                                <th class="text-center" style="width: 15%">출석</th>
                                <th class="text-center" style="width: 15%">리뷰</th>
                            </tr>
                            </thead>
                            <tbody>
    <c:choose>
        <c:when test="${not empty personalLessonList}">
            <c:forEach var="lesson" items="${personalLessonList}">
                <tr>
                    <td class="text-center">${lesson.personalLesson.name}</td>
                    <td class="text-center"><fmt:formatDate value="${lesson.personalLesson.date}" pattern="yyyy년 M월 d일" /></td>
                    <td class="text-center">${lesson.personalLesson.time}</td>
                    <td class="text-center">${lesson.personalLesson.status}</td>
                    <td class="text-center">
                        <c:if test="${lesson.personalLesson.status == 'Y'}">
                            <a class="btn btn-primary btn-sm" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" data-lesson-no="${lesson.personalLesson.no}" data-consultation-no="${lesson.consultation.consultationNo}" data-trainer-no="${lesson.trainer.trainerNo}">리뷰작성</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5" class="text-center text-primary"><strong>조회된 수업이 없습니다.</strong></td>
            </tr>
        </c:otherwise>
    </c:choose>
</tbody>
                        </table>
                        <div class="collapse" id="collapseExample" id="review">
	                        <form method="post" action="/trainer-review/personal-review-registration">
	                        	<input id="personal-lesson-no" name="personalLessonNo" type="hidden" />
	                        	<input id="trainer-no" name="trainerNo" type="hidden"/>
	                        	<input id="consultation-no" name="ConsultationNo" type="hidden"/>
								<div class="card card-body bg-light">
									<div class="row">
										<div class="text-primary mb-0 col-3  d-flex align-items-center" style="font-size: 30px;"><strong>리뷰작성</strong></div>
											<div class="col-7 text-primary mb-0 d-flex align-items-center" style="font-size: 30px;">
												<strong style="margin-right: 15px;">평점</strong>
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
										</div>
									<hr></hr>
				                	<div class="col-12 m-3">
				                    	<input type="text" class="form-control border-0 bg-light m-0" name="content" placeholder="내용 (최소 15자 이상을 입력해주세요)" style="height: 80px;">
				                	</div>
				                	<div class="col-12 d-flex justify-content-end">
				                	<button type="submit" class="btn btn-primary btn-sm m-1">등록하기</button>
				                	<button type="button" class="btn btn-success btn-sm m-1" data-bs-toggle="collapse" data-bs-target="#collapseExample" id="closeButton">닫기</button>
				                	</div>
								</div>
							</form>
						</div>
                    </div>
                </div>
                <!-- PersonalLesson end  -->
                <!-- GroupLesson start  -->
                <div class="card"  id="group-lesson" style="display: none;">
                    <div class="card-header bg-dark" style="color: #ffffff">
                        <strong>그룹수업 목록</strong>
                    </div>
                    <div class="card-body">
                        <table class="table"  id="x">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 10%">레슨 번호</th>
                                <th class="text-center" style="width: 25%">수업명</th>
                                <th class="text-center" style="width: 15%">강사명</th>
                                <th class="text-center" style="width: 20%">레슨시간</th>
                                <th class="text-center" style="width: 20%">출석 상태</th>
                                <th class="text-center" style="width: 10%">리뷰 작성</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty applyList}">
                                    <c:forEach var="lessonApply" items="${applyList }">
                                <tr>
                                    <td class="text-center">${lessonApply.lesson.no }</td>
                                    <td class="text-center"><a href="/group-lesson/detail?no=${lessonApply.lesson.no }">${lessonApply.lesson.name }</a></td>
                                    <td class="text-center">${lessonApply.user.name }</td>
                                    <td class="text-center"><fmt:formatDate value="${lessonApply.lesson.date }" pattern="yyyy년 M월 d일" /> ${lessonApply.lesson.time }시</td>
                                    <td class="text-center">${lessonApply.attendanceStatus }</td>
                                    <!-- 위의 <td>에서 attendanceStatus가 Y일때만 리뷰작성 버튼이 활성화 되게하는 코드 -->
                                    <td class="text-center"><a href="/trainer-review/registration?applyNo=${lessonApply.no}&lessonNo=${lessonApply.lesson.no}" class="btn btn-primary btn-sm ${lessonApply.attendanceStatus eq 'Y' ? '' : 'disabled'}">리뷰작성</a></td>
                                </tr>
                                </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="text-center text-primary"><strong>조회된 수업이 없습니다.</strong></td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- groupLesson end -->
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
	/* 개인,그룹수업 버튼 display 설정  */
	$(document).ready(function(){
	    $("#personal-lesson-button").click(function(){
	        $(this).addClass('active');
	        $("#group-lesson-button").removeClass('active');
	        $("#personal-lesson").show();
	        $("#group-lesson").hide();
	    });
	
	    $("#group-lesson-button").click(function(){
	        $(this).addClass('active');
	        $("#personal-lesson-button").removeClass('active');
	        $("#group-lesson").show();
	        $("#personal-lesson").hide();
	    });
	});
	/* 개인수업 리뷰작성 data 전달 */
	$(document).ready(function(){
	    $('a[data-lesson-no]').click(function(){
	        var lessonNo = $(this).attr('data-lesson-no');
	        var consultationNo = $(this).attr('data-consultation-no');
	        var trainerNo = $(this).attr('data-trainer-no');
	        $('#personal-lesson-no').val(lessonNo);
	        $('#consultation-no').val(consultationNo);
	        $('#trainer-no').val(trainerNo);
	    });
	});
	/* 닫기 버튼 눌렀을 때 값 초기화  */
    $('#closeButton').click(function() {
        $('#personal-lesson-no').val('');
        $('#trainer-no').val('');
        $('#consultation-no').val('');
        $('input[name="rating"]:checked').prop('checked', false);
        $('input[name="content"]').val('');
    });
	/* 공백, 최소 입력글자  */
    $(document).ready(function(){
        $("form").submit(function(e){
            var content = $("input[name='content']").val();
            if($.trim(content).length == 0) {
                alert("리뷰 내용을 입력해주세요");
                $("input[name='content']").focus();
                e.preventDefault();
            } else if(content.length < 15){
                alert("최소 15자 이상을 입력해주세요");
                $("input[name='content']").focus();
                e.preventDefault();
            }
        });
    });

</script>


</body>

</html>