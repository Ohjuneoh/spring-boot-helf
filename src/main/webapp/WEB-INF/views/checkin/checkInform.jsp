<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<style>
	.modal-font-size {
    font-size: 20px;
}

#modal-table-users td, #modal-table-users th {
    padding-bottom: 20px;
    text-align: center;
    vertical-align: middle;
    font-size: 1.5em;
}	

</style>
<head>
    <title>HELF 입장하기</title>
    <meta charset="utf-8">
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
    
    <!--jQuery library -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <jsp:include page="../common/topnavbar.jsp"/>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0">
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">HELF 입장하기</h1>
                    <a href="/home" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">Concept</a>
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

    <!-- Concept -입장하기 form Start -->
    <div class="container-fluid py-5 text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-12">
                <div class="section-title position-relative pb-3 mb-5 mt-5">
                    <div class="align-items-center justify-content-center text-center h-100 bg-primary p-4">
                        <a href="index.html" class="navbar-brand">
                             <h1 class="m-0 text-white"><i class="fa fa-user-tie me-2"></i>입장하기</h1>
                        </a>
                        <p class="mt-3 mb-4">1. 회원번호 네 자리를 입력해주세요.<br> 
                        					 2. 입장 버튼을 눌러주세요.<br>
                        					 3. 1:1 수업 혹은 그룹 수업은 ‘수업’ 버튼을 눌러주세요. <br>
                        					 4. 시설이용은 ‘시설이용’ 버튼을 눌러주세요. </p>
                        <form id="checkinForm" method="get" action="customer-verification">
                            <div class="input-group" >
                                <input type="text" class="form-control border-white p-3" placeholder="휴대폰 뒷번호 네 자리" id="fourDigits" name="fourDigits">
                                <button type="button" class="btn btn-dark btn-lg"  id="btn-open-modal">입장</button>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Concept -입장하기 form End  -->
    
    
    <!-- Modal 회원정보 Start -->
   <div class="modal fade" id="userModal" data-bs-backdrop="static" role="dialog" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="staticBackdropLabel">회원 목록</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <p class="modal-font-size">본인 정보를 확인하시고 '선택' 버튼을 눌러주세요.</p>
              
                <table class="table" id="modal-table-users">
                	<thead>
                		<tr>
                			<th>이름</th>
                			<th>휴대폰 번호</th>
                			<th></th>
                		</tr>
                	</thead>
                	<tbody>
                		
                	</tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
   </div>
	<!-- Modal 회원정보 End -->
    
 	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />
    <!-- Footer End -->

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
	// 부트스트랩의 모달 객체 생성하기
	const userModal = new bootstrap.Modal('#userModal', {
		keyboard: false
	});
	
	
	$("#btn-open-modal").click(function() {
		$("#modal-table-users tbody").empty();
        const fourDigits = $("#fourDigits").val();
        if(!fourDigits){
        	alert("휴대폰 뒷번호 네 자리를 입력하세요.");
        	return;
        }
        if(!/^\d{4}$/.test(fourDigits)){
        	alert("휴대폰 뒷번호 네 자리를 입력하세요.")
        	return; 
        }
        $.ajax({
            type: "GET",
            url: "/checkin/customer-verification", // The URL to the server endpoint to fetch data
            data: { fourDigits: fourDigits }, // Send the input data to the server
            success: function (users) {
            	
            	$("#modal-table-users tbody").empty();
            	if(!users || users.length == 0){
            		let noUsersRow = `
            						<tr>
            							<td colspan="3">입력하신 회원 정보가 존재하지 않습니다.</td>
            						</tr>
            						`;
            						$("#modal-table-users tbody").append(noUsersRow);
            	} else {            	
            	users.forEach(function(user, index) {
            		let maskedTel = user.tel.replace(/(\d{3})-\d{4}-(\d{4})/, "$1-****-$2");
            		let firstNameChar = user.name.charAt(0);
                    let lastNameChar = user.name.charAt(user.name.length - 1);
                    let maskedName = firstNameChar + '*'.repeat(user.name.length - 2) + lastNameChar;

            		
            		let tr = `
            			<tr>
            				<td>\${maskedName}</td>
            				<td>\${maskedTel}</td>
            				<td><a href="/checkin/check-in-choice?id=\${user.id}" class="btn btn-outline-primary">선택</a></td>
            			</tr>
            		`
            		$("#modal-table-users tbody").append(tr);
            	});
            	}
            	
                // 모달 창 띄우기 
                $("#userModal").modal("show");
            },
            error: function (xhr, status, error) {
                // Handle errors if any
                console.error("Error:", error);
            }
        });
				
	});
	
	
	
	
</script>
</body>
</html>