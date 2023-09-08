<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  
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
              <p class="m-1 text-primary" style="font-size: 80px;"><fmt:formatNumber value="${averageRating }" pattern="#.#" /> </p>
            </div>
            <div id="3" class="d-flex flex-column align-items-start m-1">
            <c:set var="fillCount" value="${Math.floor(averageRating)}"/>
			<c:set var="halfCount" value="${averageRating > fillCount ? 1 : 0}"/>
			<c:set var="emptyCount" value="${5 - fillCount - halfCount}"/>
              <h6 class="m-1 text-primary" style="font-size: 20px;">
                <c:forEach begin="1" end="${fillCount}">
			    	<i class="bi bi-star-fill"></i>
			  	</c:forEach>
			  	<c:forEach begin="1" end="${halfCount}">
			    	<i class="bi bi-star-half"></i>
			  	</c:forEach>
			  	<c:forEach begin="1" end="${emptyCount}">
			   		<i class="bi bi-star"></i>
			 	</c:forEach>
              </h6>
              <strong class="m-1 text-primary" style="font-size: 20px;">${totalReviews} 개의 리뷰</strong>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr style="height: 3px; color: skyblue;" ></hr>

    <div id="review-box">
    <c:forEach var="trainerReview" items="${dto.trainerReviews }">
      <!-- 한 사람에 해당되는 전체 div-->                                                                                                                    
      <div class="testimonial-item bg-light mt-1 mb-3 border-bottom ">
        <!-- 파라미터로 전달받은 트레이너번호 -->
        <input type="hidden" name="trainerNo" value="${param.trainerNo }">
        <h5 class="m-1 text-primary float-end">
          <c:forEach begin="1" end="${trainerReview.fillCount}">
            <i class="bi bi-star-fill"></i>
          </c:forEach>
          <c:forEach begin="1" end="${trainerReview.halfCount}">
            <i class="bi bi-star-half"></i>
          </c:forEach>
          <c:forEach begin="1" end="${trainerReview.emptyCount}">
            <i class="bi bi-star"></i>
          </c:forEach>
        </h5>
        
        <div class="d-flex align-items-center pt-1 pb-1 px-5">

          <h3 class="text-primary">${trainerReview.lesson.name }</h3>
        </div>

        <!-- 리뷰 내용 위의 작성자명, 작성일자 div -->
        <div class="d-flex align-items-center pt-1 pb-3 px-5 border-bottom mb-3">
          <img class="img-fluid rounded" src="/resources/img/testimonial-1.jpg" style="width: 60px; height: 60px;" >
          <div class="ps-4">
              <!-- 작성자명을 모두 노출하지 않고 중간글자를 x(익명) 처리 -->
              <h4 class="text-primary">${trainerReview.lessonApply.user.hiddenName}</h4>
            	<a class="bg-success text-white" style="font-size: 3px; border-radius: 50%; display: inline-block; padding: 5px;">
			    	<span>그룹</span>
				</a>
            </h4>
            <small class="text-uppercase"><fmt:formatDate value="${trainerReview.createDate }" pattern="yyyy년 M월 d일" /></small>
          </div>
        </div>
        <div class="row">
          <div class="col-9 ps-5">
            <h6>${trainerReview.title }</h6>
            <p>${trainerReview.content }</p>
          </div>
          <div class="col-3 text-end">
            <sec:authorize access="isAuthenticated()">
              <sec:authentication property="principal.id" var="loginUserId" />
              <input type="hidden" id="login-user-id" value="${loginUserId}" />
              <c:if test="${trainerReview.lessonApply.user.id eq loginUserId}">
                <a href="/trainer-review/delete?reviewNo=${trainerReview.no }" class="btn btn-danger btn-sm float-end" style="margin-left: 5px;">삭제</a>
                <a  href="/trainer-review/modify?reviewNo=${trainerReview.no }" class="btn btn-warning btn-sm float-end">수정</a>
              </c:if>
            </sec:authorize>
          </div>
        </div>
        <!-- 작성일자 밑에 있는 리뷰내용 div -->
      </div>
    </c:forEach>
    <!-- 개인수업  -->
    <c:forEach var="trainerPersonalReview" items="${personalReviews.trainerPersonalReviews }">
      <!-- 한 사람에 해당되는 전체 div-->                                                                                                                    
      <div class="testimonial-item bg-light mt-1 mb-3 border-bottom ">
        <!-- 파라미터로 전달받은 트레이너번호 -->
        <input type="hidden" name="trainerNo" value="${param.trainerNo }">
        <h5 class="m-1 text-primary float-end">
          <c:forEach begin="1" end="${trainerPersonalReview.fillCount}">
            <i class="bi bi-star-fill"></i>
          </c:forEach>
          <c:forEach begin="1" end="${trainerPersonalReview.halfCount}">
            <i class="bi bi-star-half"></i>
          </c:forEach>
          <c:forEach begin="1" end="${trainerPersonalReview.emptyCount}">
            <i class="bi bi-star"></i>
          </c:forEach>
        </h5>
        <div class="d-flex align-items-center pt-1 pb-1 px-5">
          <h5 class="text-primary">${trainerPersonalReview.personalLesson.name } </h5>
        </div>

        <!-- 리뷰 내용 위의 작성자명, 작성일자 div -->
        <div class="d-flex align-items-center pt-1 pb-3 px-5 border-bottom mb-3">
          <img class="img-fluid rounded" src="/resources/img/testimonial-1.jpg" style="width: 60px; height: 60px;" >
          <div class="ps-4">
            <h4 class="text-primary mb-1">${trainerPersonalReview.personalLesson.user.name }
            	<a class="bg-info text-white" style="font-size: 3px; border-radius: 50%; display: inline-block; padding: 5px;">
			    	<span>개인</span>
				</a></h4>
            <small class="text-uppercase"><fmt:formatDate value="${trainerPersonalReview.createDate }" pattern="yyyy년 M월 d일" /></small>
          </div>
        </div>
       <div class="row">
		    <div class="col-9 ps-5">
		        <p>${trainerPersonalReview.content } </p>
		    </div>
		    <div class="col-3 text-end">
		        <sec:authorize access="isAuthenticated()">
		            <sec:authentication property="principal.id" var="loginUserId" />
		            <input type="hidden" id="login-user-id" value="${loginUserId}" />
		            <c:if test="${trainerPersonalReview.personalLesson.user.id eq loginUserId}">
		                <a type="button" data-review-no="${trainerPersonalReview.no}" data-trainer-no="${trainerPersonalReview.trainer.trainerNo}" class="btn btn-danger btn-sm float-end deleteButton" style="margin-left: 5px;">삭제</a>
		                <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="collapse" data-bs-target="#collapseExample${trainerPersonalReview.no}" 
		                		data-personal-review-no="${trainerPersonalReview.no }"
		                		data-trainer-no="${trainerPersonalReview.trainer.trainerNo }"
		                		aria-expanded="false" aria-controls="collapseExample${trainerPersonalReview.no}">수정</button>
		            </c:if>
		        </sec:authorize>
		    </div>
		</div>
        <div class="collapse" id="collapseExample${trainerPersonalReview.no}">
	        <form method="post" action="/trainer-review/review-update">
	           <input id="personal-review-no-${trainerPersonalReview.no}" name="no" type="hidden"/>
	           <input name="trainerNo" type="hidden">
				<div class="card card-body bg-light">
					<div class="row">
						<div class="col-7 text-primary mb-0 d-flex align-items-center" style="font-size: 30px;">
							<strong style="margin-right: 15px;">평점</strong>
							 <fieldset class="rate" data-checked="0">
			                    <input type="radio" id="rating10-${trainerPersonalReview.no}" name="rating" value="5"><label for="rating10-${trainerPersonalReview.no}" title="5점"></label>
			                    <input type="radio" id="rating9-${trainerPersonalReview.no}" name="rating" value="4.5"><label class="half" for="rating9-${trainerPersonalReview.no}" title="4.5점"></label>
			                    <input type="radio" id="rating8-${trainerPersonalReview.no}" name="rating" value="4"><label for="rating8-${trainerPersonalReview.no}" title="4점"></label>
			                    <input type="radio" id="rating7-${trainerPersonalReview.no}" name="rating" value="3.5"><label class="half" for="rating7-${trainerPersonalReview.no}" title="3.5점"></label>
			                    <input type="radio" id="rating6-${trainerPersonalReview.no}" name="rating" value="3"><label for="rating6-${trainerPersonalReview.no}" title="3점"></label>
			                    <input type="radio" id="rating5-${trainerPersonalReview.no}" name="rating" value="2.5"><label class="half" for="rating5-${trainerPersonalReview.no}" title="2.5점"></label>
			                    <input type="radio" id="rating4-${trainerPersonalReview.no}" name="rating" value="2"><label for="rating4-${trainerPersonalReview.no}" title="2점"></label>
			                    <input type="radio" id="rating3-${trainerPersonalReview.no}" name="rating" value="1.5"><label class="half" for="rating3-${trainerPersonalReview.no}" title="1.5점"></label>
			                    <input type="radio" id="rating2-${trainerPersonalReview.no}" name="rating" value="1"><label for="rating2-${trainerPersonalReview.no}" title="1점"></label>
			                    <input type="radio" id="rating1-${trainerPersonalReview.no}" name="rating" value="0.5"><label class="half" for="rating1-${trainerPersonalReview.no}" title="0.5점"></label>
			                </fieldset>
						</div>
					</div>
					<hr></hr>
		          	<div class="col-12 m-3">
		           		<input type="text" class="form-control border-0 bg-light m-0" name="content" placeholder="내용 (최소 15자 이상을 입력해주세요)" style="height: 80px;">
		           	</div>
		           	<div class="col-12 d-flex justify-content-end">
			        	<button type="submit" class="btn btn-primary btn-sm m-1">수정하기</button>
			        	<button type="button" class="btn btn-success btn-sm m-1 close-button" data-bs-toggle="collapse" data-bs-target="#collapseExample${trainerPersonalReview.no}" id="closeButton">닫기</button>
		           	</div>
				</div>
			</form>
		</div>
        <!-- 작성일자 밑에 있는 리뷰내용 div -->
      </div>
    </c:forEach>
    </div>
    <div style="text-align: center;">
      <button class="btn btn-primary px-4" id="btn-more">더 보기</button>
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
      let userName = "${trainerReview.lessonApply.user.name}";
      let maskedName = "";

      let currentPage = 1;
      let more = true;
      $("#btn-more").click(function() {
        let trainerNo = $("input[name=trainerNo]").val()
        if(!more){
          alert("마지막 페이지 입니다.");
        }
        currentPage++;
        $.getJSON("/trainer-review/reviews", {trainerNo:trainerNo, page:currentPage}, function(reviews) {
          if (reviews.length < 3) {
            more = false;
          }

          let loginUserId = $("#login-user-id").val();

          // reviews = [{no:x, title:x, }, {}, {}]
          reviews.forEach(function(r, index) {

            let content = `
                <div class="testimonial-item bg-light mt-1 mb-3 border-bottom ">
                  <h5 class="m-1 text-primary float-end">
                    \${ getFillStar(r.fillCount) }
                    \${ getHalfStar(r.halfCount) }
                    \${ getEmptyStar(r.emptyCount) }
                  </h5>
                <div class="d-flex align-items-center pt-1 pb-1 px-5">
                  <h5 class="text-primary">\${r.lesson.name }</h5>
                </div>
              <div class="d-flex align-items-center pt-1 pb-3 px-5 border-bottom mb-3">
                <img class="img-fluid rounded" src="/resources/img/testimonial-1.jpg" style="width: 60px; height: 60px;" >
              <div class="ps-4">

                <h4 class="text-primary mb-1">\${r.lessonApply.user.hiddenName }</h4>
                    <a class="bg-success text-white" style="font-size: 3px; border-radius: 50%; display: inline-block; padding: 5px;">
			    	<span>그룹</span>
				    </a>
                  <small class="text-uppercase">\${r.createDate }</small>
              </div>
             </div>
             <div class="row">
             <div class="col-9 ps-5">
               <h6>\${r.title }</h6>
               <p>\${r.content }</p>
             </div>
             <div class="col-3 text-end">
            `
            if (loginUserId == r.lessonApply.user.id) {
             content += `
                <a href="/trainer-review/delete?reviewNo=\${r.no }" class="btn btn-danger btn-sm float-end" style="margin-left: 5px;">삭제</a>
                <a href="/trainer-review/modify?reviewNo=\${r.no }" class="btn btn-warning btn-sm float-end">수정</a>
                `
            }
            content +=
                    `
             </div>
          </div>
            `;

            $("#review-box").append(content);
          });
        });
      });

      function getFillStar(count) {
        let content = "";
        for (let i=1; i<=count; i++) {
          content += '<i class="bi bi-star-fill"></i> '
        }
        return content;
      }

      function getHalfStar(count) {
        let content = "";
        for (let i=1; i<=count; i++) {
          content += '<i class="bi bi-star-half"></i> '
        }
        return content;
      }

      function getEmptyStar(count) {
        let content = "";
        for (let i=1; i<=count; i++) {
          content += '<i class="bi bi-star"></i> '
        }
        return content;
      }
      /* 수정 버튼을 눌렀을 때 각각의 div에 Collapse 부여 */  
	$(document).ready(function(){
	    $('.btn-warning').on('click', function(){
	        var target = $(this).attr('href');
	        handleToggle(target);
	        return false; 
	    });
	
	    $('.closeButton').on('click', function(){
	        var target = $(this).data('bs-target');
	        handleToggle(target);
	    });
	
	    function handleToggle(target) {
	        var isCurrentlyShown = $(target).hasClass('show');
	        
	        $('.collapse.show').each(function(){
	            $(this).removeClass('show');
	            $(this).find('input[name="content"]').val(''); // 닫힌 div의 내용을 삭제
	            $(this).find('.rate input:checked').prop('checked', false); // 별점을 초기화
	            $(this).find('.rate label').removeClass('selected hover'); // 별점 라벨을 초기화
	            $(this).find('input[name="no"], input[name="trainerNo"]').val(''); // 숨겨진 입력값을 초기화
	        });
	
	        if(!isCurrentlyShown) {
	            // 현재 클릭한 div만 열거나 닫습니다
	            $(target).toggleClass('show');
	        }
	    }
	
	    $("button[data-personal-review-no]").click(function(){
	        var reviewNo = $(this).data('personal-review-no');
	        $("#personal-review-no-" + reviewNo).val(reviewNo);
	
	        var trainerNo = $(this).data('trainer-no');
	        $("input[name='trainerNo']").val(trainerNo); // hidden input에 trainerNo 값을 설정
	    });
	
	    $('form').on('submit', function(e){
	        var contentLength = $(this).find('input[name="content"]').val().length; // 이 부분을 수정합니다.
	        if(contentLength < 15){
	            alert('최소 15자 이상을 입력해주세요');
	            e.preventDefault();
	        }
	    });
	});
	
	$(document).ready(function(){
	    $('.rate input').on('change', function(){
	        var $set = $(this).closest('.rate');
	        var $labels = $set.find('label');
	
	        $labels.removeClass('selected');
	        $(this).next('label').addClass('selected');
	    });
	
	    // 별점 위에 마우스를 올렸을 때 색이 채워지는 효과
	    $('.rate label').on('mouseenter', function(){
	        var $set = $(this).closest('.rate');
	        var $labels = $set.find('label');
	
	        $labels.removeClass('hover');
	        $(this).addClass('hover');
	        $(this).prevAll('label').addClass('hover');
	    });
	
	    // 별점에서 마우스를 떠날 때 호버 효과 제거
	    $('.rate').on('mouseleave', function(){
	        $(this).find('label').removeClass('hover');
	    });
	});
	
	/* 리뷰 삭제버튼  */
	$(document).ready(function(){
	    $('.deleteButton').on('click', function(){
	        var reviewNo = $(this).data('review-no');
	        var trainerNo = $(this).data('trainer-no');
	
	        if(confirm('정말 삭제하시겠습니까?')) {
	            $.ajax({
	                url: '/trainer-review/personal-delete',  
	                type: 'POST',
	                data: {
	                    reviewNo: reviewNo,
	                    trainerNo: trainerNo
	                },
	                success: function(response) {
	                    alert('리뷰가 성공적으로 삭제되었습니다.');
	                    window.location.href = "/trainer-review/list?trainerNo=" + trainerNo; // 페이지 리다이렉트
	                },
	                error: function(xhr, status, error) {
	                    // 오류가 발생했을 때의 처리
	                    alert('리뷰 삭제 중 오류가 발생했습니다.');
	                }
	            });
	        }
	    });
	});
	

</script>
</body>
</html>
