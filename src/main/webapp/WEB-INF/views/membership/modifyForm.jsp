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
			<jsp:param name="menu" value="이용권"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 10px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">MEMBERSHIP</h1>
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

	<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
				<h5 class="fw-bold text-primary text-uppercase">Modify Form</h5>
				<h1 class="mb-0">이용권 수정</h1>
			</div>
			<div class="offset-1" style="margin: 50px;">
				<form action="modify?state=${param.state }&keyword=${param.keyword }&type=${param.type }&page=${param.page}" method="post">
					<div class="offset-1" style="margin-top: 100px;">
						<h5>이용권 이름</h5>
						<input name="name" type="text" class="bg-light border-0"  value="${membership.name }"
							   style="height: 50px; width: 1000px; font-size: 20px;" >
						<p id="title-error-msg" style="color:red; display: none;" >3-20자의 형식만 가능합니다.</p>
					</div>
					<div class="offset-1" style="margin-top: 100px;">
						<h5>판매 여부</h5>
						<select name="deleted" class="bg-light border-0" style="height: 50px; width: 1000px; font-size: 20px;">
							<option value="N" ${membership.deleted eq 'N' ? 'selected' : '' }>판매중</option>
							<option value="Y" ${membership.deleted eq 'Y' ? 'selected' : '' }>판매중지</option>
						</select>
					</div>
					<div class="offset-1" style="margin-top: 100px;">
						<h5>이용권 가격</h5>
						<input name="price" type="number" class="bg-light border-0" value="${membership.price }"
							   style="height: 50px; width: 1000px; font-size: 20px;" >
						<p id="price-error-msg" style="color:red; display: none;">가격은 비워둘 수 없습니다.</p>
					</div>
					<div id="cat-div" class="offset-1" style="margin-top: 100px;">
						<h5>이용권 종류</h5>
						<c:forEach var="cat" items="${categorys }">
							<button	id="btn-category-${cat.no }" type="button"
									data-cat-no="${cat.no }" data-cat-property="${cat.property }" data-cat-option="${cat.useOption }"
									class="btn btn-outline-primary btn-lg ${membership.catNo eq cat.no ? 'active' : '' }" 
									style="width: 200px; height: 100px; margin: 20px;">
								${cat.name }
							</button>
						</c:forEach>
					</div>
					<div class="offset-1" style="margin-top: 100px;">
						<h5>이용권 속성</h5>
						<input id="property" type="text" class="bg-light border-0" value="${membership.catProperty }"
							   style="height: 50px; width: 1000px; font-size: 20px; font-weight: bold;" disabled="disabled">
					</div>
					<div class="offset-1" style="margin-top: 100px;">
						<h5>옵션 여부</h5>
						<input id="useOption" type="text" class="bg-light border-0" value="${membership.useOption }"
							   style="height: 50px; width: 1000px; font-size: 20px; font-weight: bold;" disabled="disabled">
					</div>
					<div class="offset-1" style="margin-top: 100px;">
						<h5>설명</h5>
						<input name="description" type="text" class="bg-light border-0 text-start" value="${membership.description }"
							   style="height: 300px; width: 1000px; font-size: 20px;" >
						<p id="description-error-msg" style="color:red; display: none;">10-200자의 형식만 가능합니다.</p>
					</div>
					<div class="offset-10" style="margin-top: 150px;">
						<a href="detail-manager?no=${membership.no }&state=${param.state }&keyword=${param.keyword }&type=${param.type }&page=${param.page }" class="btn btn-danger btn-lg">취소</a>
						<button id="btn-submit" type="submit" class="btn btn-primary btn-lg" >완료</button>
						<input name="no" type="hidden" value="${membership.no }">
						<input name="catNo" type="hidden" value="${membership.catNo }">
					</div>
				</form>
			</div>
		</div>
	</div>
	
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
</body>
<script type="text/javascript">
$(function() {
	
	const titleRegexp = /^[a-zA-Z가-힣0-9\s!@#$%^&*()\-_=+[\]{}|;:'",.<>/?\\]{3,20}$/;
	const descriptionRegexp = /^[a-zA-Z가-힣0-9\s!@#$%^&*()\-_=+[\]{}|;:'",.<>/?\\]{10,200}$/;
	
	let nameValid = true;
	let priceValid = true;
	let catValid = true;
	let descriptionValid = true;
	
	function check() {
		if(nameValid && priceValid && catValid && descriptionValid) {
			$("#btn-submit").removeClass('disabled');
			return;
		}
		$("#btn-submit").addClass('disabled');
	}
	
	$('[id^="btn-category"]').on('click', function() {
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		
		let catNo = $(this).attr('data-cat-no');
		let property = $(this).attr('data-cat-property');
		let useOption = $(this).attr('data-cat-option');
		$("input[name=catNo]").val(catNo);
		$("#property").val(property);
		$("#useOption").val(useOption);
		
	})
	
	$("input[name=name]").blur(function () {
		let nameText = $(this).val();
		if(!titleRegexp.test(nameText)) {
			$("#title-error-msg").show();
			nameValid = false;
			check();
			
			return;
		}
		$("#title-error-msg").hide();
		
		nameValid = true;
		check();
	});
	
	$("input[name=description]").blur(function () {
		let descriptionText = $(this).val();
		if(!descriptionRegexp.test(descriptionText)) {
			$("#description-error-msg").show();
			descriptionValid = false;
			check();
			
			return;
		}
		$("#description-error-msg").hide();
		
		descriptionValid = true;
		check();
	});
	
	$("input[name=price]").blur(function () {
		let priceText = $(this).val();
		
		if(!priceText) {
			$("#price-error-msg").show();
			
			priceValid = false;
			check();
			
			return;
		}
		
		$("#price-error-msg").hide();
		priceValid = true;
		check();
	});
})
</script>
</html>