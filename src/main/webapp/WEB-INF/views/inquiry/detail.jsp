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
	#boardview .inquiry_row tr:first-child th, #boardview .board_row tr:first-child td{border-top:0}
	#boardview .inquiry_row tr th{padding:20px 15px; font-weight: 600; font-size: 15px;}
	#boardview .inquiry_row.move tr th{padding:10px 15px; font-size: 13px;}
	#boardview .boxview{padding:20px 15px;     color: #848484; font-size: 14px;}
	.tablelayer{border-radius: 20px;border: 1px solid #fefefe;padding: 0 15px 0px 15px;background-color: #fff;margin-bottom: 20px;}
	#boardview .inquiry_row tr td{border-bottom:0}
	#boardview .inquiry_row tr th{border-bottom:0}
	#boardview .inquiry_row tr:first-child td{border-bottom:1px solid #ededed}
	#boardview .inquiry_row tr:first-child th{border-bottom:1px solid #ededed}
	
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
<script>
/* 작성자만 문의글 볼 수 있게 제한 */
validUser();

function validUser(){
	<c:if test="${error ne null}">
	let hasError = ${error};
	if (hasError) {
		alert("문의글은 작성자만 확인이 가능합니다")
	    window.history.back();
	}
	</c:if>
}
</script>
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
                <h1 class="display-4 text-white animated zoomIn">INQUIRY</h1>
                <a href="" class="h5 text-white">1:1문의 상세보기</a>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row mb-3">
        <div class="col-12">
	        <sec:authorize access="hasRole('ROLE_USER')">
	        	<c:if test="${inquiry.isAnswer eq 'N' }">
		        	<div class="button-container">
						<input type="hidden" name="no" value="${inquiry.no }" />
						<a href="/inquiry/delete?no=${inquiry.no }" class="btn btn-danger mt-1 float-end btn-sm"  style=" margin-right: 7px;" onclick="return confirmDelete();">삭제</a>
					</div>  
					<div class="button-container">
						<a href="#" class=" btn btn-warning mt-1 float-end btn-sm" style=" margin-right: 7px;" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</a>
					</div>    
				</c:if>
	        </sec:authorize>	
		    <div class="button-container">
				<a href="/inquiry/inquiries" class=" btn btn-primary mt-1 btn-sm">목록</a>
			</div>  
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-12">
			<!-- 문의 상세정보  -->
			<div id="boardview" class="wrap_inner">
				<div class="tablelayer">
					<table class="inquiry_row">
						<colgroup>
							<col>
							<col style="width:8%;">
						</colgroup>
						<tbody>
							<tr>
								<th class="tal">${inquiry.title }</th>
								<td><fmt:formatDate value="${inquiry.createDate }" pattern="yyyy-MM-dd" /></td>
    							 <td></td>
							</tr>
						</tbody>
					</table>
					<div class="boxview">
						${inquiry.content }
					</div>
					<c:if test="${inquiry.filename != null}">
						<div class="mb-3">
							<img src="/resources/img/photo/${inquiry.filename }" class="img-thumbnail">
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<div class="button-container">
			</div>  
		</div>
		<div class="col-12">
			
			<div id="boardview" class="wrap_inner">
				<h3>답변</h3>
				
				<div id="replyList">
					<c:forEach var="answer" items="${answers }">
						<div class="tablelayer p-3">
							<p>${answer.content }</p>
						</div>
						<sec:authorize access="hasRole('ROLE_MANAGER')">
						<div class="text-end">
							<a href="/inquiry/deleteAnswer?inquiryNo=${inquiry.no}&answerNo=${answer.no}" class=" btn btn-danger mt-1  btn-sm"  style=" margin-right: 7px;" onclick="return confirmDelete();">삭제</a>
						</div>
						</sec:authorize>						
					</c:forEach>
				</div>
				
				<c:if test="${inquiry.isAnswer eq 'N' }">
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<div id="answer-box">
							<div class="tablelayer p-3 mb-3">
								<textarea id="reply" class="form-control"></textarea>
							</div>	
							<div class="text-end">
								<button type="button" id="replyBtn" class="btn btn-primary mt-1 btn-sm">작성</button>
							</div>
						</div>
					</sec:authorize>
				</c:if>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
document.querySelector("#replyBtn").addEventListener("click", function(){
	let inquiryNo = document.querySelector("#inquiry_no").value;
	let replyValue = document.querySelector("#reply").value;
	
	let data = {no: inquiryNo, content: replyValue}
	
	$.ajax({
        type: "post",
        url: "addReply?no=${inquiry.no}",
        data:  data,
        success: function(result) {
        	$("#answer-box").remove();
        	console.log("success")
            console.log(result);
        	
        	let replyArea = document.querySelector("#replyList");
        	replyArea.innerHTML = "";
        	
        	for(let i = 0; i < result.length; i++){
        		let reply = `
        			<div class="tablelayer p-3">
	        			<p>\${result[i].content}</p>
	        		</div>
        			<div class="text-end">
	        			<a href="/inquiry/deleteAnswer?inquiryNo=${inquiry.no}&answerNo=\${result[i].no}" 
	        					class=" btn btn-danger mt-1 float-end btn-sm"  
	        					style=" margin-right: 7px;" onclick="return confirmDelete();">삭제</a>
        			</div>
        		`
        		replyArea.innerHTML += reply
        	}
        	
        }
    });
})
</script>

<!-- 수정 모달 창 -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="container" >
        	 <div class="container py-3">
			   	<div>
			   		<h3>1:1문의 수정하기</h3>
			   	</div>
	            <div class="row g-5">
	                <div class="col-lg-13">
	                        <form method="post" action="/inquiry/inquiryUpdate" enctype="multipart/form-data">
	                            <div class="row g-3">
	                                <div class="col-12" >
	                                	<input type="hidden" name="no" value="${inquiry.no }" id="inquiry_no"/>
	                                    <select class="form-select bg-light border-0" name="type" style="height: 55px;">
	                                        <option value="수업" ${inquiry.title == '수업' ? 'selected' : ''}>수업 관련</option>
	                                        <option value="헬스장" ${inquiry.title == '헬스장' ? 'selected' : ''}>헬스장 관련</option>
	                                        <option value="웹사이트" ${inquiry.title == '웹사이트' ? 'selected' : ''}>웹사이트 관련</option>
	                                        <option value="기타" ${inquiry.title == '기타' ? 'selected' : ''}>기타</option>
	                                    </select>
	                                </div>
	                                <div class="col-xl-12">
	                                    <input type="text" class="form-control bg-light border-0" name="title" value="${inquiry.title }"  style="height: 55px;"/>
	                                </div>
	                                <div>
	                                	<label class="attr-value-option"><input type="checkbox" name="secret" value="Y" onchange="kboard_toggle_password_field(this)" checked> 비밀글</label>
										<input type='file' name="photofile" style="margin-left: 20px;"/>
	                                </div>
	                        			<textarea id="summernote" name="content">
	                        				${inquiry.content }
	                        			</textarea>
	                                <div class="col-12">
	                                    <button class="btn btn-dark w-100 py-3" type="submit">수정하기</button>
	                                </div>
	                            </div>
	                        </form>
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
});

function confirmDelete() {
    return confirm('정말로 삭제하시겠습니까? (되돌릴 수 없습니다.)');
}




</script>


</body>

</html>