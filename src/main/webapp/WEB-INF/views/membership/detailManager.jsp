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
	<div>
		<div class="container py-5 ">
			<div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
				<h5 class="fw-bold text-primary text-uppercase">Membership Detail</h5>
				<h1 class="mb-0">이용권 상세정보</h1>
			</div>
			<div class="row mb-3 d-flex align-items-center justify-content-center">
				<div class="col-10 ">
					<div class="col-12 d-flex align-items-center justify-content-center">
						<div>		
							<table class="table text-center border border-black" style="width: 800px;">
								<thead style="background: #191970; ">
									<tr>
										<th colspan="4" class="text-start bg-primary" style="color:white;">${membership.name }</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="bg-primary" style="color:white; width: 15%;">
											가격
										</th>
										<td style="width: 30%;"><fmt:formatNumber value="${membership.price }" pattern="###,###"/>원</td>
										<th class="bg-primary" style="color:white; width: 15%;">
											판매여부
										</th>
										<td style="width: 30%;">${membership.deleted eq 'N' ? '판매중' : '판매중지'}</td>
									</tr>
									<tr>
										<th class="bg-primary" style="color:white;">생성일</th>
										<td>${membership.createDate }</td>
										<th class="bg-primary" style="color:white;">삭제일</th>
										<td>${membership.deleteDate eq null ? '미지정' : membership.deleteDate }</td>
									</tr>
									<tr>
										<th class="bg-primary" style="color:white;">종류</th>
										<td>${membership.catName }</td>
										<th class="bg-primary" style="color:white;">옵션</th>
										<td>${membership.useOption }</td>
									</tr>
									<tr>
										<th class="bg-primary" style="color:white; height: 150px; vertical-align: middle;">설명</th>
										<td colspan="3" style="vertical-align: middle;">${membership.description }</td>
									</tr>
								</tbody>
							</table>
							<div style="display: flex; justify-content: space-between; margin-top: 40px;">
								<div>
									<c:if test="${membership.deleted eq 'N'}">
							    		<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deletedModal">삭제</button>
									</c:if>
							        <a href="modify-form?no=${membership.no }&state=${param.state }&keyword=${param.keyword }&type=${param.type }&page=${param.page }" 
							           class="btn btn-warning">수정</a>
							    </div>
							    <div>
							        <a href="list-manager?state=${param.state }&type=${param.type }&keyword=${param.keyword }&page=${param.page }" class="btn btn-primary">목록</a>
							    </div>
							</div>
						</div>
        			</div>
					
	    		</div>
	    	</div>
	    </div>
    </div>
	<div class="modal fade" id="deletedModal" tabindex="-1" aria-labelledby="#deletedModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5>삭제확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<strong>해당 이용권을 정말 삭제하시겠습니까?</strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<form action="deleted" method="post">
						<button type="submit" class="btn btn-danger" onclick="deleted()">확인</button>
						<input type="hidden" name="no" value="${membership.no }">
						<input type="hidden" name="page" value="${param.page }">
						<input type="hidden" name="state" value="${param.state }">
						<input type="hidden" name="type" value="${param.type }">
						<input type="hidden" name="keyword" value="${param.keyword}">	   
					</form>
				</div>
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
function deleted() {
	alert("삭제되었습니다.");
}
</script>
</html>