<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<style>
   .border {
       box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 이 부분에서 그림자 효과를 조절할 수 있습니다 */
   }
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
                    <h1 class="display-4 text-white animated zoomIn">MY PAGE</h1>
                    <a href="" class="h5 text-white">내 정보 조회</a>
                </div>
            </div>
        </div>
    </div>
    <div class=" p-3" style="max-width: 900px; margin: 0 auto;">
	    	<form id="update-trainer" action="/user/trainerInfoChange" method="post" enctype="multipart/form-data">
		        <div class="row g-3">
		            <div class="row" >
						<div class="col-12 section-title text-start position-relative pb-3 mb-1 mt-4" style="max-width: 600px;">
			                <h1 class="fw-bold text-primary text-uppercase">수정하기</h1>
			            </div>
					</div>
		        <div class="p-3">
			        	<div class="row g-3">
							<div class="mb-4"></div>
						
						<div class="row">
							<div class="col-sm-6">
							    <img src="/resources/img/photo/${trainerInfo.trainerFile }" class="img-fluid border" />
							    <button type="button" class="btn btn-primary btn-sm mt-2" onclick="triggerFileInput()">프로필 사진 업로드</button>
							    <div class="col-sm-6 input-wrapper">
							        <input type="file" name="photofile" style="display: none;" id="fileInput" />
							    </div>
							</div>
						    <div class="col-sm-6 input-wrapper">
						    	<h5 class="text-primary">이름</h5>
						    		<div class="col-m-6">
							        	<input id="trainer-name" name="name" style="height: 50px;"  type="text" class="form-control bg-light border-0" value="${userInfo.name }" readonly="readonly" disabled="disabled">
					    				<div class="check_font" id="trainer-name_check"></div>
						    		</div>
								<h5 class="text-primary mt-2">아이디</h5>
						         <input id="trainer-id" name="id" style="height: 50px; width: 620px;" type="text" 
						         		class="form-control bg-light border-0" value="${userInfo.id }" readonly="readonly" disabled="disabled">
						   		<h5 class="text-primary mt-2">이메일</h5> 
							    <div class="row">
								    <div class="col-md-8">
								        <input id="trainer-email" name="email1" style="height: 50px;" 
								        	   type="text" class="form-control bg-light border-0">
								    	<div class="check_font " id="trainer-email-check"></div>
									</div>
									<div class="col-md-3">
									    <select id="trainer-email-2" name="email2" style="height: 50px; width: 150px;" class="form-select bg-light border-0">
								            <option selected="" value="@naver.com">@naver.com</option>
								            <option value="@gamil.com">@gamil.com</option>
										    <option value="@kakao.com">@kakao.com</option>
										    <option value="@hanmail.net">@hanmail.net</option>
										    <option value="@nate.com">@nate.com</option>
										    <option value="@outlook.com">@outlook.com</option>
										    <option value="@yahoo.com">@yahoo.com</option>
									    </select>
								    </div>
							    </div>
						    </div>
						</div>
					    <div class="col-12">
						    <h5 class="text-primary mt-2">비밀번호</h5>
						        <input id="trainer-password" name="password" 
						        	   type="password" class="form-control bg-light border-0"  placeholder="4-12자, 영문+숫자+특수문자를 꼭 포함하여 입력하세요.">
						   		<div class="check_font" id="trainer-password_check"></div>
					    </div>
					    <div class="col-12">
					    	<div class="row">
					    
					    	</div>  
					    </div>
					    <div class="col-12">
					    <h5 class="text-primary">전화번호</h5>
					    	<div class="row">
					    		<div class="col-md-6">
						        	<input id="trainer-tel" name="tel" value="${userInfo.tel }" type="text" class="form-control bg-light border-0" >

					    			<div class="check_font" id="trainer-tel_check"></div>
					    		</div>
							    <div class="col-md-6">
								    <select id="trainer-mobileCarrier" name="mobileCarrier" style="width: 100px;" class="form-select bg-light border-0">
							            <option selected="" disabled="">통신사</option>
							            <option value="SK">SK</option>
							            <option value="LG">LG</option>
									    <option value="KT">KT</option>
									    <option value="MVNO">알뜰폰</option>
								    </select>
							    </div>
					    	</div>  
					    </div>
					    <hr>
					    <!-- Career Start  -->
					    <div>
						    <div>
						        <div class="col-sm-6 m-1">
						            <h3 class="text-primary" style="display: inline-block;">경력</h3>
						        </div>
						    </div>
						    <c:forEach var="career" items="${trainerInfo.careers}" varStatus="status">
						        <div class="row">
						            <div class="col-sm-4 input-wrapper">
						                <input type="text" class="form-control bg-light border-0 mt-1" id="trainer-career-${status.index}" name="updateCareerNames" placeholder="경력명을 입력하세요." style="height: 45px;" value="${career.careerName}" />
						                <input type="text" class="form-control bg-light border-0 mt-1" id="career-no-${status.index}" name="updateCareerNo" style="height: 45px; display : none;" value="${career.careerNo}"  />
						            </div>
						            <div class="col-sm-8">
						                <div class="d-flex">
						                    <input type="text" class="form-control bg-light border-0 m-1" id="datepicker1-${status.index}" name="updateCareerStartDates" placeholder="경력 시작일" value="<fmt:formatDate value='${career.careerStartDate}' pattern='yyyy-M-d' />" />
						                    <strong style="margin-left: 15px; margin-right: 20px; font-size: 20px;">~</strong>
						                    <input type="text" class="form-control bg-light border-0 m-1" id="datepicker2-${status.index}" name="updateCareerEndDates" placeholder="경력 종료일"  value="<fmt:formatDate value='${career.careerEndDate}' pattern='yyyy-M-d' />" />
						                <button type="button" class="btn btn-danger btn-sm m-1 career-delete" data-career="${career.careerNo}" >삭제</button>
						                </div>
						            </div>
						        </div>
						    </c:forEach>
						    <div id="career-box">
						        <!-- 추가된 경력 정보가 여기 표시됨. -->
						    </div>
						    <div>
						        <button class="btn btn-primary m-3 btn-sm" type="button" id="btn-add-field">경력 추가</button>
						    </div>
						</div>
                  	</div>
              	</div>
          	</div>
          	<hr>
			<div class="col-12 mt-3">
				<button type="submit" class="btn btn-dark w-100 py-3" id="changePwd-button" >회원정보 수정</button>
			</div>
		</form>
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

    <!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>


<script type="text/javascript">

$(document).ready(function(){
    function triggerFileInput() {
        $('#fileInput').click();
    }
    
    $('button[onclick="triggerFileInput()"]').on('click', function(e) {
        e.preventDefault();
        
        triggerFileInput();
    });
});
$(document).ready(function(){
    let careerCounter = 0;

    $("#trainer-password").blur(function(){
        if(!$("#password_confirmation").length) {
            $(this).after('<div id="password_confirmation"><input type="password" class="form-control bg-light border-0 mt-3" placeholder="비밀번호를 한 번 더 입력해주세요"></div>');
            addPasswordMatchCheck();
        }
    });

    $(".service-item").click(function() {
        faqModal.show();
    });

    $('#btn-add-field').click(function () {
        let content = 
                `<div class="row mt-4" id="career-row-${careerCounter}">
                    <div class="col-sm-6 input-wrapper">
                        <input type="text" class="form-control bg-light border-0" id="trainer-career-${careerCounter}" name="careerNames${careerCounter}" placeholder="경력명을 입력하세요." style="height: 45px;" />
                    </div>
                    <div class="col-sm-6">
                        <div class="d-flex">
                            <input type="text" class="form-control bg-light border-0 mr-2 datepicker-start" id="datepicker-start-${careerCounter}" name="careerStartDates${careerCounter}" placeholder="경력 시작일" style="height: 45px;"/>
                            <strong style="margin-left: 15px; margin-right: 20px; margin-top: 10px; font-size: 20px;">~</strong>
                            <input type="text" class="form-control bg-light border-0 datepicker-end" id="datepicker-end-${careerCounter}" name="careerEndDates${careerCounter}" placeholder="경력 종료일" style="height: 45px;"/>
                            <button class="btn btn-danger btn-sm" type="button" onclick="$('#career-row-${careerCounter}').remove()" style="margin-left: 15px;">삭제</button>
                        </div>
                    </div>
                </div>`;

        $('#career-box').append(content);
        initializeDatepicker(`#datepicker-start-${careerCounter}`, `#datepicker-end-${careerCounter}`);
        careerCounter++;
    });
  //삭제 버튼 눌렀을 때 이벤트
    $(document).on('click', '.career-delete', function () {
        var careerNo = $(this).data('career'); // 버튼에서 career 번호를 가져옴
        var self = this;  // 'this' 참조를 'self' 변수에 저장

        if (careerNo) {
            $.ajax({
                url: '/user/delete-career',
                type: 'POST',
                data: { careerNo: careerNo },
                success: function(response) {
                    // 서버에서 성공적인 응답을 받으면
                    alert('경력이 성공적으로 삭제되었습니다.');
                    // 삭제된 경력 항목을 DOM에서 제거
                    $(self).closest('.row').remove();  // '.d-flex' 대신 '.row'를 사용하여 전체 행을 제거
                },
                error: function(error) {
                    // 에러 처리
                    alert('경력 삭제에 실패했습니다. 다시 시도해 주세요.');
                }
            });
        }
    });
    // 기존에 있는 datepicker 요소를 찾아 초기화
    $("input[id^='datepicker1-']").datepicker({ dateFormat: 'yy-mm-dd' });
    $("input[id^='datepicker2-']").datepicker({ dateFormat: 'yy-mm-dd' });
});

function initializeDatepicker(startDateSelector, endDateSelector) {
    $(startDateSelector).removeClass('hasDatepicker').datepicker({ dateFormat: 'yy-mm-dd' });
    $(endDateSelector).removeClass('hasDatepicker').datepicker({ dateFormat: 'yy-mm-dd' });
}

function addPasswordMatchCheck() {
    $("#password_confirmation input").on('input', function() {
        checkPasswordMatch();
    });

    $("#trainer-password").on('input', function() {
        checkPasswordMatch();
    });
}

function checkPasswordMatch() {
    var password = $("#trainer-password").val();
    var confirmPassword = $("#password_confirmation input").val();

    if(confirmPassword.length > 0) {
        if(password !== confirmPassword) {
            if(!$("#password_error").length) {
                $("#password_confirmation").after('<div class="mt-1" id="password_error" style="color: red;"><strong>비밀번호가 일치하지 않습니다</strong></div>');
            }
            $("#password_success").remove();
        } else {
            $("#password_error").remove();
            if(!$("#password_success").length) {
                $("#password_confirmation").after('<div class="mt-1" id="password_success" style="color: green;"><strong>비밀번호가 일치합니다</strong></div>');
            }
        }
    }
}

$("#update-trainer").submit(function(e){
    var password = $("#trainer-password").val();
    var confirmPassword = $("#password_confirmation input").val();

    if(password !== confirmPassword) {
        alert('비밀번호를 확인해주세요');
        e.preventDefault();
    }
});
</script>


    
</body>

</html>