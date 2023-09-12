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
    
    <!-- 썸머노트  -->
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
    
    <style type="text/css">
	#boardview .btn{text-align: left; margin:50px 0 20px;}
	#boardview .btn .box_btn a{border-radius: 8px;}
	#boardview .btn .modelete{float: right;}
	#boardview .boxview{padding-top:0}
	#boardview .boxview .qna{border-radius: 20px; border:1px solid #fefefe; padding: 0 15px 10px 15px;; background-color:#fff; margin-bottom:20px;}
	#boardview .boxview .title{border-bottom:1px solid #c1c1c1; font-weight: 600; font-size:15px; padding:20px 15px;}
	#boardview .boxview .content{padding:20px 15px; }
	#boardview .boxview .content *{color:#848484; font-size:14px;}
	#boardview .board_row tr:first-child th, #boardview .board_row tr:first-child td{border-top:0}
	#boardview .board_row tr th{padding:20px 15px; font-weight: 600; font-size: 15px;}
	#boardview .board_row.move tr th{padding:10px 15px; font-size: 13px;}
	#boardview .boxview{padding:20px 15px;     color: #848484; font-size: 14px;}
	.tablelayer{border-radius: 20px;border: 1px solid #fefefe;padding: 0 15px 0px 15px;background-color: #fff;margin-bottom: 20px;}
	#boardview .board_row tr td{border-bottom:0}
	#boardview .board_row tr th{border-bottom:0}
	#boardview .board_row tr:first-child td{border-bottom:1px solid #ededed}
	#boardview .board_row tr:first-child th{border-bottom:1px solid #ededed}
	
	#boardview .btn .box_btn a {
	    border-radius: 8px;
	}

	
	/* 목록버튼 */
	.box_btn.fs15 > * {
	    font-size: 15px !important;
	}
	.box_btn.white7 * {
	    border-color: #e5e5e5;
	    background: #fff;
	    color: #333 !important;
	}
	.box_btn.h50 > * {
	    height: 50px;
	    padding: 0;
	    line-height: 48px;
	}
	.box_btn.w135 > * {
	    width: 135px;
	}
	.box_btn > * {
	    display: inline-block;
	    margin: 0;
	    padding: 8px 12px;
	    border: 1px solid #333;
	    outline: none;
	    background: #333;
	    color: #fff !important;
	    font-size: 12px;
	    font-family: 'Poppins', Malgun Gothic, '맑은 고딕', Dotum, '돋움', sans-serif;
	    font-weight: normal;
	    text-align: center;
	    vertical-align: middle;
	    line-height: 1.4;
	    white-space: nowrap;
	    cursor: pointer;
	    -webkit-appearance: none;
	    transition: all .2s ease;
	}
	

    </style>
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
                <a href="" class="h5 text-white">공지 상세보기</a>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row mb-3">
        <div class="col-12">
        </div>
     <div class="button-container">
		<a href="/board/notice" class=" btn btn-primary mt-1 btn-sm">목록</a>
	</div>   
    </div>
    <div class="row mb-3">
        <div class="col-12">
            
<!-- 공지사항 상세정보  -->
	<div id="boardview" class="wrap_inner">

		<div class="tablelayer">
			<table class="board_row">
				<colgroup>
					<col>
					<col style="width:7.7%;">
				</colgroup>
				<tbody>
					<tr>
						<th class="tal">${board.title }</th>
						<td class="tar date">${board.createDate }</td>

					</tr>
				</tbody>
			</table>
			<div class="boxview">
				${board.content }
			</div>
		</div>
		<div class="tablelayer" style="padding-top:10px; padding-bottom:10px;">

			<table class="board_row move" style="width: 100%">
				<colgroup>
					<col style="width:10%;">
					<col>
					<col style="width:*%;">
				</colgroup>
				<tbody> 
						<tr class="prev">
							<th scope="row">이전글</th>
							<td>
								<a href="/board/detail?no=${dto.prevBoardNo }" title="이전글">${dto.prevBoardTitle }</a>
							</td>
						</tr>
						<tr class="next">
							<th scope="row">다음글</th>
							<td>
								<a href="/board/detail?no=${dto.nextBoardNo }" title="다음글">${dto.nextBoardTitle }</a>
							</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
	 		<sec:authorize access="hasRole('ROLE_MANAGER')">
				<div class="button-container">
					<input type="hidden" name="no" value="${board.no }" />
					<a href="/board/delete?no=${board.no }" class=" btn btn-danger mt-1 float-end btn-sm"  style=" margin-right: 7px;" onclick="return confirmDelete();">삭제</a>
				</div>  
				<div class="button-container">
					<a href="#" class=" btn btn-warning mt-1 float-end btn-sm" style=" margin-right: 7px;" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</a>
				</div>     
			</sec:authorize>
		</div>
	</div>
</div>

<!-- 수정 모달 창 -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="container" >
        	<div class="container py-3">
			   	<div class="modal-header">
			   		<h3>공지사항 수정하기</h3>
			   	</div>
	            <div class="row g-5">
	                <div class="col-lg-13">
	                    <div class=" rounded h-100 d-flex align-items-center p-5" >
	                        <form method="post" action="/board/modify">
	                            <div class="row g-3">
	                                <div class="col-12" >
	                                	<input type="hidden" name="no" value="${board.no }" />
	                                    <select class="form-select bg-light border-0" name="main" style="height: 55px;">
	                                        <option value="0" ${board.main == '0' ? 'selected' : ''}>주요 공지사항</option>
	                                        <option value="1" ${board.main == '1' ? 'selected' : ''}>일반 공지사항</option>
	                                    </select>
	                                </div>
	                                <div class="col-xl-12">
	                                    <input type="text" class="form-control bg-light border-0" name="title" placeholder="제목" style="height: 55px;" value="${board.title}">
	                                </div>
	                        		<textarea id="summernote" name="content" >${board.content }</textarea>
	                            </div>
					   			<div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-warning">수정</button>
					   			</div>
	                        </form>
	                    </div>
	                </div>
            	</div>
        	</div>
   		</div>
    </div>
  </div>
</div>

<!-- 수정 모달 창 -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="container" >
        	<div class="container py-3">
			   	<div class="modal-header">
			   		<h3>공지사항 수정하기</h3>
			   	</div>
	            <div class="row g-5">
	                <div class="col-lg-13">
	                    <div class=" rounded h-100 d-flex align-items-center p-5" >
	                        <form method="post" action="/board/modify">
	                            <div class="row g-3">
	                                <div class="col-12" >
	                                	<input type="hidden" name="no" value="${board.no }" />
	                                    <select class="form-select bg-light border-0" name="main" style="height: 55px;">
	                                        <option value="0" ${board.main == '0' ? 'selected' : ''}>주요 공지사항</option>
	                                        <option value="1" ${board.main == '1' ? 'selected' : ''}>일반 공지사항</option>
	                                    </select>
	                                </div>
	                                <div class="col-xl-12">
	                                    <input type="text" class="form-control bg-light border-0" id="title" name="title" placeholder="제목" style="height: 55px;" value="${board.title}">
	                                </div>
	                        		<textarea id="summernote" name="content" >${board.content }</textarea>
	                            </div>
					   			<div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-warning">수정</button>
					   			</div>
	                        </form>
	                    </div>
	                </div>
            	</div>
        	</div>
   		</div>
    </div>
  </div>
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

<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<!-- Template Javascript -->
<script src="/resources/js/main.js"></script>

<script>
//썸머노트 
$(document).ready(function() {
    $('#summernote').summernote({
        height: 300,
        lang: "ko-KR"
    });
    
    // 수정 폼 제출 시 이벤트 처리
    $('#modifyForm').submit(function() {
        var title = $('input[name="title"]').val();
        var content = $('#summernote').summernote('code'); // 썸머노트의 내용 가져오기

        if (title.trim() === '' || content.trim() === '' || content.trim() === '<p><br></p>') {
            alert('제목과 내용을 모두 입력하세요.'); // 제목 또는 내용을 입력하지 않았을 때 알림창 띄우기
            return false; // 폼 제출을 중단
        }
    });
    
});

// 모달이 열릴 때마다 제목 입력값 초기화
$('#modifyModal').on('show.bs.modal', function (e) {
    $('#title').val('');
});

// 수정 버튼 클릭 시 이벤트 처리
$('#modifySubmit').click(function() {
    var title = $('#title').val();

    if (title.trim() === '') {
        alert('제목을 입력하세요.'); // 제목이 입력되지 않았을 때 알림창 띄우기
        return false; // 폼 제출을 중단
    }
});

function confirmDelete() {
    return confirm('정말로 삭제하시겠습니까? (되돌릴 수 없습니다.)');
}



</script>


</body>

</html>