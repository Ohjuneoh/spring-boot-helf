<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="kr">
<style>
body {
  position: relative;
}
</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topnavbar Start -->
   	<jsp:include page="common/topnavbar.jsp">
		<jsp:param name="menu" value="홈"/>
	</jsp:include>
    <!-- Topnavbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative p-0 h-10 ">
		<jsp:include page="common/navbar.jsp">
			<jsp:param name="menu" value="홈"/>
		</jsp:include>
    <!-- Navbar End -->
        <div class="container-fluid bg-primary py-3 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">REGISTER</h1>
                    <a href="" class="h5 text-white">회원가입</a>
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
    
    <%-- 회원가입 카테고리 --%>
    <div class="container-fluid wow fadeInUp d-flex justify-content-center" data-wow-delay="0.1s" style="padding-bottom: 0px;">
    
        <div class="container p2 ">
            <div class="row g-5" style="margin-bottom: 1px;">
                <div class="col-lg-7" > 
                    <div class="section-title position-relative pb-3 mb-5" id="register-form">
                        <h5 class="fw-bold text-primary text-uppercase" style="font-size: 40px;">HELF FRIEND 회원가입</h5>
                        <h1 class="mb-0" style="font-size: 15px;">회원가입 유형을 선택해주세요. </h1>
                        <h1 class="mb-0" style="font-size: 15px;">회원정보는 동의 없이 공개 및 유출되지 않으며 개인정보 보호정책에 의해 보호 받고 있습니다.</h1>
                    </div>
                </div>
            </div>
 			<div class="row g-5">
        		<div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s" id="user-img">
            		<div class="team-item bg-light rounded overflow-hidden">
               		 	<div class="team-img position-relative overflow-hidden">
                    		<img class="img-fluid w-100" src="/resources/img/회원.jpg" alt="">
                		</div>
                		<div class="text-center py-4">
                    		<h4 class="text-primary" style="font-size:40px;">회원</h4>
                		</div>
            		</div>
        		</div>
       			 <div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s" id="trainer-img">
            		<div class="team-item bg-light rounded overflow-hidden">
                		<div class="team-img position-relative overflow-hidden">
                   			<img class="img-fluid w-100" src="/resources/img/트레이너.jpg" alt="">
                		</div>
               	 		<div class="text-center py-4">
                    		<h4 class="text-primary" style="font-size:40px;">트레이너</h4>
                		</div>
            		</div>
        		</div>
    		</div>
        </div>
    </div>
   
    <%-- 회원가입 폼 --%>       
    <div class="container-fluid py-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 1px;">
        <div class="container">
        
        	<%-- 회원 폼 --%>
		   	<form:form action="/user/register/user" id="registerform-user" style="display: none" method="post" modelAttribute="addUserForm" >
				<div class="row mb-3">
					<div class="col-12">
						<div class="d-grid gap-2 mb-5">
							<a href="/oauth2/authorization/kakao" onclick="kakao_login_call()" style="margin: 0 auto;">
							    <img src="https://atimg.sonyunara.com/attrangs/banner/kakao-pc.jpg" style="width: 1100px;">
							</a>
						</div>
					</div>
				</div>
				<div class="row g-3">
					<div class="mb-4">
						<h3>회원 회원가입</h3>
					</div>
					
					<div class="row" >
						<h5>아이디</h5>
						    <div class="col-sm-6 input-wrapper">
						         <form:input type="text" class="form-control bg-light border-0" id="user-id" path="id" placeholder="4-12자, 영어소문자를 입력하세요." style="height: 55px; width: 620px;" />
						    	 <div class="check_font" id="user-id_check"></div>
						    	<div class="id_input_re_1" style="color: green; display: none;">사용 가능한 아이디입니다.</div>
						    	<div class="id_input_re_2" style="color: red; display: none;">아이디가 이미 존재합니다.</div>
						    </div>
						    <div class="col-sm-6 button-wrapper">
						        <input id="user-check-duplicate" type="button" value="중복체크" class="btn btn-primary disabled" style="height: 53px; width: 100px;" />
						    </div>
					</div>
					
					<div class="row">
						<div class="col-12">
					        <!-- <form:errors path="id" class="text-danger"></form:errors>  --> 
						</div>
					</div>
					 
				    <div class="col-12">
				    	<h5>비밀번호</h5>
				        <form:input type="password" class="form-control bg-light border-0" id="user-password" path="password" placeholder="4-12자, 영문+숫자+특수문자를 꼭 포함하여 입력하세요." style="height: 55px;" />
				   		<div class="check_font" id="user-password_check"></div>
				    </div>
				    
				    <div class="col-12">
					    <h5>이메일</h5> 
					    <div class="row">
						    <div class="col-md-6">
						        <form:input type="text" class="form-control bg-light border-0" id="user-email" path="email1" placeholder="특수문자를 제외하고 입력하세요." style="height: 55px;"/>
						    	<div class="check_font" id="user-email-check"></div>
							</div>
							<div class="col-md-6">
							    <form:select class="form-select bg-light border-0" id="user-email-2" path="email2" style="height: 55px; width: 200px;">
						            <option selected value="@naver.com">@naver.com</option>
						            <option value="@gamil.com">@gamil.com</option>
								    <option value="@kakao.com">@kakao.com</option>
								    <option value="@hanmail.net">@hanmail.net</option>
								    <option value="@nate.com">@nate.com</option>
								    <option value="@outlook.com">@outlook.com</option>
								    <option value="@yahoo.com">@yahoo.com</option>
							    </form:select>
						    </div>
					    </div>
				    </div>
				    
				    <div class="col-12">
				    <h5>이름</h5>
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="user-name" path="name" placeholder="홍길동 (한글만 입력하세요.)" style="height: 55px;" />
					    			<div class="check_font" id="user-name_check">
					    				<form:errors path="name" class="text-danger"></form:errors>
					    			</div>
				    		</div>
						    <div class="col-md-3">
						        <form:select class="form-select bg-light border-0" id="user-gender" path="gender" style="height: 55px; width: 100px;">
						            <option selected disabled>성별</option>
						            <option value="MAN">남자</option>
						            <option value="WOMAN">여자</option>
						        </form:select>
				    		</div>
				    	</div>  
				    </div>
				    
				    <div class="col-12">
				    <h5>전화번호</h5>
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="user-tel" path="tel" placeholder="010-1111-1234 (특수문자는 '-'만 입력가능합니다. )" style="height: 55px;" />
				    			<div class="check_font" id="user-tel_check"></div>
				    		</div>
						    <div class="col-md-6">
							    <form:select class="form-select bg-light border-0" id="user-mobileCarrier" path="mobileCarrier" style="height: 55px; width: 100px;">
						            <option selected disabled>통신사</option>
						            <option value="SK">SK</option>
						            <option value="LG">LG</option>
								    <option value="KT">KT</option>
								    <option value="MVNO">알뜰폰</option>
							    </form:select>
						    </div>
				    	</div>  
				    </div>
				    
					<p>
					  <a class="form-select bg-light border-0" data-bs-toggle="collapse" href="#user-collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					    <strong style="color: red;">[필수]</strong> 이용약관
					  </a>
					</p>
					
						<div class="collapse" id="user-collapseExample">
							<label>
							    <input type="checkbox" id="user-agreeCheckbox-1" class="normal" name="agree1"/>
							    <strong style="color: red;">[필수]</strong> HELF 홈페이지 이용약관에 동의합니다.
							</label>
								
							<div class="container">
								<div class="row">
									<div class="col-md-6">
											<div id="list-example-1" class="list-group">
											  <a class="list-group-item list-group-item-action" href="#list-item-1">여러분을 환영합니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-2">회원으로 가입하시면 HELF 서비스를 보다 편리하게 이용할 수 있습니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-3">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-4">HELF 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</a>
											</div>
									</div>
								  	<div class="col-md-6">
										<div data-bs-spy="scroll" data-bs-target="#list-example-1" data-bs-offset="0" class="scrollspy-example" tabindex="0" style="max-height: 200px; overflow-y: auto; padding: 10px; border: 1px solid white;">
										  <h4 id="list-item-1">여러분을 환영합니다.</h4>
										  <p>HELF 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 HELF 서비스의 이용과 관련하여 HELF 서비스를 제공하는 HELF헬스장과 이를 이용하는 HELF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 HELF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
											HELF 서비스를 이용하시거나 HELF 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</p>
										 
										  <h4 id="list-item-2">회원으로 가입하시면 HELF 서비스를 보다 편리하게 이용할 수 있습니다.</h4>
										  <p>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, HELF 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 HELF 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 HELF 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 HELF 회원가입 방법 등에서 확인해 주세요.
											HELF는 단체에 속한 여러 구성원들이 공동의 계정으로 HELF 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
											따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 HELF 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
											단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 HELF 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.</p>
										 
										  <h4 id="list-item-3">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</h4>
										  <p>HELF는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. HELF가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.
											HELF는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.</p>
										  
										  <h4 id="list-item-4">HELF 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</h4>
										  <p>HELF는 여러분이 HELF 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 HELF 서비스를 보다 안전하게 이용하고 HELF 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 HELF 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.
		
											회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
											타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
											관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
											자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
											자동화된 수단을 활용하는 등 HELF 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, HELF 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 HELF 서비스 이용에 불편을 초래하고 더 나아가 HELF의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
											HELF의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 HELF 서비스 회원으로 가입을 시도 또는 가입하거나, HELF 서비스에 로그인을 시도 또는 로그인하거나, HELF 서비스 상에 게시물을 게재하거나, HELF 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), HELF 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, HELF 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 HELF 서비스의 제공 취지에 부합하지 않는 방식으로 HELF 서비스를 이용하거나 이와 같은 HELF 서비스에 대한 어뷰징(남용) 행위를 막기 위한 HELF의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
											HELF의 동의 없이 자동화된 수단에 의해 HELF 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, HELF 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. HELF 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 HELF 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
											HELF는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.</p>
										</div>
									</div>
								</div>
							</div>
	
	
							<label>
							    <input type="checkbox" id="user-agreeCheckbox-2" class="normal" name="agree2"/>
							    <strong style="color: red;">[필수]</strong> 개인정보 수집 및 이용약관에 동의합니다.
							</label>
							  
								<div class="container">
								<div class="row">
									<div class="col-md-6">
											<div id="list-example-2" class="list-group">
											  <a class="list-group-item list-group-item-action" href="#list-item-5">1. 수집하는 개인정보</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-6">2. 수집한 개인정보의 이용</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-7">3. 개인정보의 보관기간</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-8">4. 개인정보 수집 및 이용 동의를 거부할 권리</a>
											</div>
									</div>
								  	<div class="col-md-6">
										<div data-bs-spy="scroll" data-bs-target="#list-example-2" data-bs-offset="0" class="scrollspy-example" tabindex="0" style="max-height: 200px; overflow-y: auto; padding: 10px; border: 1px solid white;">
										  <h4 id="list-item-5">1. 수집하는 개인정보</h4>
										  <p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 HELF 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, HELF는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에 HELF가 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. - 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. - 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다. 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다. - HELF 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다. 구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며, HELF에서 제공하는 위치기반 서비스에 대해서는 'HELF 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다. 이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.</p>
										 
										  <h4 id="list-item-6">2. 수집한 개인정보의 이용</h4>
										  <p>HELF 및 HELF 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다. - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. - 법령 및 HELF 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다. - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다. - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다. - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다. - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</p>
										 
										  <h4 id="list-item-7">3. 개인정보의 보관기간</h4>
										  <p>회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다. 이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다. - 부정 가입 및 이용 방지 부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관 탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관 - QR코드 복구 요청 대응 QR코드 등록 정보:삭제 시점으로부터6개월 보관 - 스마트플레이스 분쟁 조정 및 고객문의 대응 휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년 - HELF 플러스 멤버십 서비스 혜택 중복 제공 방지 암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관 - 지식iN eXpert 재가입 신청 및 부정 이용 방지 eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관 전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. HELF는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다. - 전자상거래 등에서 소비자 보호에 관한 법률 계약 또는 청약철회 등에 관한 기록: 5년 보관 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 - 전자문서 및 전자거래 기본법 공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관 - 전자서명 인증 업무 인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관 - 통신비밀보호법 로그인 기록: 3개월 참고로 HELF는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.</p>
										  
										  <h4 id="list-item-8">4. 개인정보 수집 및 이용 동의를 거부할 권리</h4>
										  <p>이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</p>
		
											회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
											타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
											관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
											자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
											자동화된 수단을 활용하는 등 HELF 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, HELF 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 HELF 서비스 이용에 불편을 초래하고 더 나아가 HELF의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
											HELF의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 HELF 서비스 회원으로 가입을 시도 또는 가입하거나, HELF 서비스에 로그인을 시도 또는 로그인하거나, HELF 서비스 상에 게시물을 게재하거나, HELF 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), HELF 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, HELF 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 HELF 서비스의 제공 취지에 부합하지 않는 방식으로 HELF 서비스를 이용하거나 이와 같은 HELF 서비스에 대한 어뷰징(남용) 행위를 막기 위한 HELF의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
											HELF의 동의 없이 자동화된 수단에 의해 HELF 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, HELF 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. HELF 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 HELF 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
											HELF는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.</p>
										</div>
									</div>
								</div>
							</div>
							
							  <input type="checkbox" id="user-check-all" />
		 					  <label for="check_all">전체 동의합니다.</label>
						</div>
										    
				    <div class="col-12" >
				        <button id="user-button-register" class="btn btn-dark w-100 py-3" type="submit">가입하기</button>
				    </div>
				</div>
		 	</form:form>
		 	
            <%-- 트레이너 폼 --%>
			<form:form action="/user/register/trainer" id="registerform-trainer" style="display: none" method="post" modelAttribute="addUserForm" >
				<div class="row mb-3">

				</div>
				<div class="row g-3">
					<div class="mb-4">
						<h3>트레이너 회원가입</h3>
					</div>
					
					<div class="row" >
						<h5>아이디</h5>
						    <div class="col-sm-6 input-wrapper">
						         <form:input type="text" class="form-control bg-light border-0" id="trainer-id" path="id" placeholder="4-12자, 영어소문자를 입력하세요." style="height: 55px; width: 620px;" />
						    	 <div class="check_font" id="trainer-id_check"></div>
						    	<div class="id_input_re_1" style="color: green; display: none;">사용 가능한 아이디입니다.</div>
						    	<div class="id_input_re_2" style="color: red; display: none;">아이디가 이미 존재합니다.</div>
						    </div>
						    <div class="col-sm-6 button-wrapper">
						        <input id="trainer-check-duplicate" type="button" value="중복체크" class="btn btn-primary" style="height: 53px; width: 100px;" />
						    </div>
					</div>
				
				    <div class="col-12">
				    	<h5>비밀번호</h5>
				        <form:input type="password" class="form-control bg-light border-0" id="trainer-password" path="password" placeholder="4-12자, 영문+숫자+특수문자를 꼭 포함하여 입력하세요." style="height: 55px;" />
				   		<div class="check_font" id="trainer-password_check"></div>
				    </div>
				    
				    <div class="col-12">
					    <h5>이메일</h5> 
					    <div class="row">
						    <div class="col-md-6">
						        <form:input type="text" class="form-control bg-light border-0" id="trainer-email" path="email1" placeholder="특수문자를 제외하고 입력하세요." style="height: 55px;"/>
						    	<div class="check_font" id="trainer-email-check"></div>
							</div>
							<div class="col-md-6">
							    <form:select class="form-select bg-light border-0" id="trainer-email-2" path="email2" style="height: 55px; width: 200px;">
						            <option selected value="@naver.com">@naver.com</option>
						            <option value="@gamil.com">@gamil.com</option>
								    <option value="@kakao.com">@kakao.com</option>
								    <option value="@hanmail.net">@hanmail.net</option>
								    <option value="@nate.com">@nate.com</option>
								    <option value="@outlook.com">@outlook.com</option>
								    <option value="@yahoo.com">@yahoo.com</option>
							    </form:select>
						    </div>
					    </div>
				    </div>
				    
				    <div class="col-12">
				    <h5>이름</h5>
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="trainer-name" path="name" placeholder="홍길동 (한글만 입력하세요.)" style="height: 55px;" />
					    			<div class="check_font" id="trainer-name_check">
					    				<form:errors path="name" class="text-danger"></form:errors>
					    			</div>
				    		</div>
						    <div class="col-md-3">
						        <form:select class="form-select bg-light border-0" id="trainer-gender" path="gender" style="height: 55px; width: 100px;">
						            <option selected disabled>성별</option>
						            <option value="MAN">남자</option>
						            <option value="WOMAN">여자</option>
						        </form:select>
				    		</div>
				    	</div>  
				    </div>
				    
				    <div class="col-12">
				    <h5>전화번호</h5>
				    	<div class="row">
				    		<div class="col-md-6">
					        	<form:input type="text" class="form-control bg-light border-0" id="trainer-tel" path="tel" placeholder="010-1111-1234 (특수문자는 '-'만 입력가능합니다. )" style="height: 55px;" />
				    			<div class="check_font" id="trainer-tel_check"></div>
				    		</div>
						    <div class="col-md-6">
							    <form:select class="form-select bg-light border-0" id="trainer-mobileCarrier" path="mobileCarrier" style="height: 55px; width: 100px;">
						            <option selected disabled>통신사</option>
						            <option value="SK">SK</option>
						            <option value="LG">LG</option>
								    <option value="KT">KT</option>
								    <option value="MVNO">알뜰폰</option>
							    </form:select>
						    </div>
				    	</div>  
				    </div>
				    
					<p>
					  <a class="form-select bg-light border-0" data-bs-toggle="collapse" href="#trainer-collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					    <strong style="color: red;">[필수]</strong> 이용약관
					  </a>
					</p>
					
						<div class="collapse" id="trainer-collapseExample">
							<label>
							    <input type="checkbox" id="trainer-agreeCheckbox-1" class="normal" name="agree1"/>
							    <strong style="color: red;">[필수]</strong> HELF 홈페이지 이용약관에 동의합니다.
							</label>
								
							<div class="container">
								<div class="row">
									<div class="col-md-6">
											<div id="list-example-1" class="list-group">
											  <a class="list-group-item list-group-item-action" href="#list-item-1">여러분을 환영합니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-2">회원으로 가입하시면 HELF 서비스를 보다 편리하게 이용할 수 있습니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-3">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-4">HELF 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</a>
											</div>
									</div>
								  	<div class="col-md-6">
										<div data-bs-spy="scroll" data-bs-target="#list-example-1" data-bs-offset="0" class="scrollspy-example" tabindex="0" style="max-height: 200px; overflow-y: auto; padding: 10px; border: 1px solid white;">
										  <h4 id="list-item-1">여러분을 환영합니다.</h4>
										  <p>HELF 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 HELF 서비스의 이용과 관련하여 HELF 서비스를 제공하는 HELF헬스장과 이를 이용하는 HELF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 HELF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
											HELF 서비스를 이용하시거나 HELF 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</p>
										 
										  <h4 id="list-item-2">회원으로 가입하시면 HELF 서비스를 보다 편리하게 이용할 수 있습니다.</h4>
										  <p>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, HELF 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 HELF 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 HELF 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 HELF 회원가입 방법 등에서 확인해 주세요.
											HELF는 단체에 속한 여러 구성원들이 공동의 계정으로 HELF 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
											따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 HELF 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
											단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 HELF 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.</p>
										 
										  <h4 id="list-item-3">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</h4>
										  <p>HELF는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. HELF가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.
											HELF는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.</p>
										  
										  <h4 id="list-item-4">HELF 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</h4>
										  <p>HELF는 여러분이 HELF 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 HELF 서비스를 보다 안전하게 이용하고 HELF 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 HELF 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.
		
											회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
											타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
											관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
											자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
											자동화된 수단을 활용하는 등 HELF 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, HELF 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 HELF 서비스 이용에 불편을 초래하고 더 나아가 HELF의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
											HELF의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 HELF 서비스 회원으로 가입을 시도 또는 가입하거나, HELF 서비스에 로그인을 시도 또는 로그인하거나, HELF 서비스 상에 게시물을 게재하거나, HELF 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), HELF 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, HELF 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 HELF 서비스의 제공 취지에 부합하지 않는 방식으로 HELF 서비스를 이용하거나 이와 같은 HELF 서비스에 대한 어뷰징(남용) 행위를 막기 위한 HELF의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
											HELF의 동의 없이 자동화된 수단에 의해 HELF 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, HELF 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. HELF 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 HELF 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
											HELF는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.</p>
										</div>
									</div>
								</div>
							</div>
	
	
							<label>
							    <input type="checkbox" id="trainer-agreeCheckbox-2" class="normal" name="agree2"/>
							    <strong style="color: red;">[필수]</strong> 개인정보 수집 및 이용약관에 동의합니다.
							</label>
							  
								<div class="container">
								<div class="row">
									<div class="col-md-6">
											<div id="list-example-2" class="list-group">
											  <a class="list-group-item list-group-item-action" href="#list-item-5">1. 수집하는 개인정보</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-6">2. 수집한 개인정보의 이용</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-7">3. 개인정보의 보관기간</a>
											  <a class="list-group-item list-group-item-action" href="#list-item-8">4. 개인정보 수집 및 이용 동의를 거부할 권리</a>
											</div>
									</div>
								  	<div class="col-md-6">
										<div data-bs-spy="scroll" data-bs-target="#list-example-2" data-bs-offset="0" class="scrollspy-example" tabindex="0" style="max-height: 200px; overflow-y: auto; padding: 10px; border: 1px solid white;">
										  <h4 id="list-item-5">1. 수집하는 개인정보</h4>
										  <p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 HELF 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, HELF는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에 HELF가 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. - 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. - 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다. 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다. - HELF 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다. 구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며, HELF에서 제공하는 위치기반 서비스에 대해서는 'HELF 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다. 이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.</p>
										 
										  <h4 id="list-item-6">2. 수집한 개인정보의 이용</h4>
										  <p>HELF 및 HELF 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다. - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. - 법령 및 HELF 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다. - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다. - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다. - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다. - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</p>
										 
										  <h4 id="list-item-7">3. 개인정보의 보관기간</h4>
										  <p>회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다. 이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다. - 부정 가입 및 이용 방지 부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관 탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관 - QR코드 복구 요청 대응 QR코드 등록 정보:삭제 시점으로부터6개월 보관 - 스마트플레이스 분쟁 조정 및 고객문의 대응 휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년 - HELF 플러스 멤버십 서비스 혜택 중복 제공 방지 암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관 - 지식iN eXpert 재가입 신청 및 부정 이용 방지 eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관 전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. HELF는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다. - 전자상거래 등에서 소비자 보호에 관한 법률 계약 또는 청약철회 등에 관한 기록: 5년 보관 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 - 전자문서 및 전자거래 기본법 공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관 - 전자서명 인증 업무 인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관 - 통신비밀보호법 로그인 기록: 3개월 참고로 HELF는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.</p>
										  
										  <h4 id="list-item-8">4. 개인정보 수집 및 이용 동의를 거부할 권리</h4>
										  <p>이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</p>
		
											회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
											타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
											관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
											자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
											자동화된 수단을 활용하는 등 HELF 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, HELF 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 HELF 서비스 이용에 불편을 초래하고 더 나아가 HELF의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
											HELF의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 HELF 서비스 회원으로 가입을 시도 또는 가입하거나, HELF 서비스에 로그인을 시도 또는 로그인하거나, HELF 서비스 상에 게시물을 게재하거나, HELF 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), HELF 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, HELF 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 HELF 서비스의 제공 취지에 부합하지 않는 방식으로 HELF 서비스를 이용하거나 이와 같은 HELF 서비스에 대한 어뷰징(남용) 행위를 막기 위한 HELF의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
											HELF의 동의 없이 자동화된 수단에 의해 HELF 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, HELF 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. HELF 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 HELF 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
											HELF는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.</p>
										</div>
									</div>
								</div>
							</div>
							
							  <input type="checkbox" id="trainer-check-all" />
		 					  <label for="check_all">전체 동의합니다.</label>
						</div>
										    
				    <div class="col-12" >
				        <button id="trainer-button-register" class="btn btn-dark w-100 py-3" type="submit">다음으로</button>
				    </div>
				</div>
		 	</form:form>
		 	
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footernavbar.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
   
   <script type="text/javascript"></script>
   <script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
   
   <script>
		// 회원가입 폼 선택(회원/트레이너)
	   $('#user-img').on('click', function() {
	   		$('#trainer-img').hide();
	   		$('#registerform-trainer').hide();
	   		$('#register-form').hide();
	   		$('#registerform-user').show();
	   		$(this).hide();
	   	});

	    $('#trainer-img').on('click', function() {
		   	$('#user-img').hide();
		   	$('#registerform-user').hide();
		   	$('#register-form').hide();
		   	$('#registerform-trainer').show();
		   	$(this).hide();
	   	});
	    
	    
	    
	    /* 유저 시작 */
	    // 이용약관 체크박스
			// 전체동의&해제 
		$("#user-check-all").change(function() {
			$("#user-collapseExample :checkbox.normal").prop("checked", $(this).prop("checked"))
		});
	    	// 각각의 이용약관에 체크했을 때, 전체동의에 체크&해제된다.
		$("#user-collapseExample :checkbox.normal").change(function() {
			let allChecked = true;

			$("#user-collapseExample :checkbox.normal").each(function(index, checkbox) { 
				allChecked = allChecked && $(checkbox).prop("checked");
			});
			
			$("#user-check-all").prop("checked", allChecked);
		});

		// 이용약관 부트스트랩
		var scrollSpy = new bootstrap.ScrollSpy(document.body, {
			  target: '#list-example'
		});

		var firstScrollSpyEl = document.querySelector('[data-bs-spy="scroll"]')
		firstScrollSpyEl.addEventListener('activate.bs.scrollspy', function () {
		})
		
		
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z]{4,12}$/;
		// 비밀번호 정규식
		var pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{4,12}$/;
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일 검사 정규식
		var mailJ = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?-?([0-9]{3,4})?-?([0-9]{4})$/;
		
		
		let idValid = false;
		let idDupChecked = false;
		let passwordValid = false;
		let emailValid = false;
		let nameValid = false;
		let telValid = false;
		
		// 아이디 유효성검사
		$("#user-id").keyup(function() {
			$('div.id_input_re_1').hide();
   			$('div.id_input_re_2').hide();
   			idDupChecked = false;
   			
			if (idJ.test($(this).val())) {
					console.log(idJ.test($(this).val()));
					$("#user-id_check").text('');
					idValid = true;
					$("#user-check-duplicate").removeClass("disabled") // 중복체크버튼 활성화
			} else {
				$('#user-id_check').text('형식에 맞게 아이디를 입력해주세요.');
				$('#user-id_check').css('color', 'red');
				idValid= false;
				$("#user-check-duplicate").addClass("disabled")		// 중복체크버튼 비활성화
			}
			updateCheckButtonState(); // 버튼 상태 업데이트 호출
		});
		
		// 비밀번호 유효성검사
		$("#user-password").keyup(function() {
			if (pwJ.test($(this).val())) {
					console.log(pwJ.test($(this).val()));
					$("#user-password_check").text('');
					passwordValid = true;
			} else {
				$('#user-password_check').text('형식에 맞게 비밀번호를 입력해주세요.');
				$('#user-password_check').css('color', 'red');
				passwordValid = false;
			}
		});
		
		// 이메일 유효성검사
		$("#user-email").keyup(function() {
			let email = $(this).val() + $("#user-email-2").val();
			
			if (mailJ.test(email)) {
					console.log(mailJ.test(email));
					$("#user-email-check").text('');
					emailValid = true;
			} else {
				$('#user-email-check').text('형식에 맞게 이메일을 입력해주세요.');
				$('#user-email-check').css('color', 'red');
				emailValid = false;
			}
		});
		

		// 이름 유효성검사
		$("#user-name").keyup(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#user-name_check").text('');
					nameValid = true;
			} else {
				$('#user-name_check').text('형식에 맞게 이름을 입력해주세요.');
				$('#user-name_check').css('color', 'red');
				nameValid = false;
			}
		});

		// 전화번호 유효성검사
		$("#user-tel").keyup(function() {
			if (phoneJ.test($(this).val())) {
					console.log(phoneJ.test($(this).val()));
					$("#user-tel_check").text('');
					telValid = true;
			} else {
				$('#user-tel_check').text('형식에 맞게 전화번호를 입력해주세요.');
				$('#user-tel_check').css('color', 'red');
				telValid = false;
			}
		});
		
		// 유효성검사 통과못했을 때, 제출 막는다.
		$("#registerform-user").submit(function(event) {
			
			// 성별 선택하지 않았을때
			let genderVaild = $("#user-gender").val();
			
			if (!genderVaild) {
				alert("성별을 선택하세요.");
				return false;
			}
			
			// 통신사 선택하지 않았을때
			let mobileCarrierVaild = $("#user-mobileCarrier").val();
			
			if (!mobileCarrierVaild) {
				alert("통신사를 선택하세요.");
				return false;
			}
			
			// 이용약관 체크하지 않았을때
			let userAgree1Valid = $("#user-agreeCheckbox-1").prop('checked');
			
			if (!userAgree1Valid) {
				alert("이용약관을 체크하세요.");
				return false;
			}
			
			let userAgree2Valid = $("#user-agreeCheckbox-2").prop('checked');
			
			if (!userAgree2Valid) {
				alert("이용약관을 체크하세요.");
				return false;
			}
			
			// 아이디를 올바르게 입력하지 않았을 때
			if(!idValid) {
				alert("아이디를 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
			// 아이디 중복체크를 하지 않았을 때
			if(!idDupChecked) {
				alert("아이디 중복체크를 수행하세요.");
				event.preventDefault();
				return false;
			}
			
			// 비밀번호 올바르게 입력하지 않았을 때
			if(!passwordValid) {
				alert("비밀번호를 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
			
			// 이름 올바르게 입력하지 않았을 때
			if(!nameValid) {
				alert("이름을 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
		
			// 이메일 올바르게 입력하지 않았을 때
			if(!emailValid) {
				alert("이메일을 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}			
			return true;
		});
		
		
	 	// 아이디 중복검사 
		$(document).ready(function() {
			
		    $("#user-check-duplicate").click(function() {
		    	
		        var userId = $("#user-id").val();
		        var data = { userId: userId };
		
		        $.ajax({
		            type: "post",
		            url: "idChk",
		            data: data,
		            success: function(result) {
		                if (result != 'fail') {
		                    $('.id_input_re_1').css("display", "inline-block");
		                    $('.id_input_re_2').css("display", "none");
		                    idDupChecked = true;
		                } else {
		                    $('.id_input_re_2').css("display", "inline-block");
		                    $('.id_input_re_1').css("display", "none");
		                    idDupChecked = false;
		                }
		            }
		        });
		    });
		});
		/* 유저 끝 */
		
		
		
		/* 트레이너 시작 */
	    // 이용약관 체크박스
	    	// 각각 체크했을 때, 전체동의에 체크&해제된다.
		$("#trainer-collapseExample :checkbox.normal").change(function() {
			let allChecked = true;

			$("#trainer-collapseExample :checkbox.normal").each(function(index, checkbox) { 
				allChecked = allChecked && $(checkbox).prop("checked");
			});
			
			$("#trainer-check-all").prop("checked", allChecked);
		});
	    
		// 전체동의&해제 
		$("#trainer-check-all").change(function() {
			$("#trainer-collapseExample :checkbox.normal").prop("checked", $(this).prop("checked"))
		});

			
		// 이용약관 부트스트랩
		var scrollSpy = new bootstrap.ScrollSpy(document.body, {
			  target: '#list-example'
		});

		var firstScrollSpyEl = document.querySelector('[data-bs-spy="scroll"]')
		firstScrollSpyEl.addEventListener('activate.bs.scrollspy', function () {
		})
		
		
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z]{4,12}$/;
		// 비밀번호 정규식
		var pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{4,12}$/;
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일 검사 정규식
		var mailJ = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?-?([0-9]{3,4})?-?([0-9]{4})$/;
		
		
		let tIdValid = false;
		let tIdDupChecked = false;
		let tPasswordValid = false;
		let tEmailValid = false;
		let tNameValid = false;
		let tTelValid = false;
		
		// 아이디 유효성검사
		$("#trainer-id").keyup(function() {
			$('div.id_input_re_1').hide();
   			$('div.id_input_re_2').hide();
   			idDupChecked = false;
   			
			if (idJ.test($(this).val())) {
					console.log(idJ.test($(this).val()));
					$("#trainer-id_check").text('');
					tIdValid = true;
					$("#trainer-check-duplicate").removeClass("disabled")	// 중복체크버튼 활성화
			} else {
				$('#trainer-id_check').text('형식에 맞게 아이디를 입력해주세요.');
				$('#trainer-id_check').css('color', 'red');
				tIdValid= false;
				$("#trainer-check-duplicate").addClass("disabled")			// 중복체크버튼 비활성화
			}
			updateCheckButtonState(); // 버튼 상태 업데이트 호출
		});
		
		// 비밀번호 유효성검사
		$("#trainer-password").keyup(function() {
			if (pwJ.test($(this).val())) {
					console.log(pwJ.test($(this).val()));
					$("#trainer-password_check").text('');
					tPasswordValid = true;
			} else {
				$('#trainer-password_check').text('형식에 맞게 비밀번호를 입력해주세요.');
				$('#trainer-password_check').css('color', 'red');
				tPasswordValid = false;
			}
		});
		
		// 이메일 유효성검사
		$("#trainer-email").keyup(function() {
			let email = $(this).val() + $("#user-email-2").val();
			
			if (mailJ.test(email)) {
					console.log(mailJ.test(email));
					$("#trainer-email-check").text('');
					tEmailValid = true;
			} else {
				$('#trainer-email-check').text('형식에 맞게 이메일을 입력해주세요.');
				$('#trainer-email-check').css('color', 'red');
				tEmailValid = false;
			}
		});
		

		// 이름 유효성검사
		$("#trainer-name").keyup(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#trainer-name_check").text('');
					tNameValid = true;
			} else {
				$('#trainer-name_check').text('형식에 맞게 이름을 입력해주세요.');
				$('#trainer-name_check').css('color', 'red');
				tNameValid = false;
			}
		});

		// 전화번호 유효성검사
		$("#trainer-tel").keyup(function() {
			if (phoneJ.test($(this).val())) {
					console.log(phoneJ.test($(this).val()));
					$("#trainer-tel_check").text('');
					tTelValid = true;
			} else {
				$('#trainer-tel_check').text('형식에 맞게 전화번호를 입력해주세요.');
				$('#trainer-tel_check').css('color', 'red');
				tTelValid = false;
			}
		});
		
		// 유효성검사 통과못했을 때, 제출 막는다.
		$("#registerform-trainer").submit(function(event) {
			
			// 성별 선택하지 않았을때
			let tgenderVaild = $("#trainer-gender").val();
			
			if (!tgenderVaild) {
				alert("성별을 선택하세요.");
				return false;
			}
			
			// 통신사 선택하지 않았을때
			let tmobileCarrierVaild = $("#trainer-mobileCarrier").val();
			
			if (!tmobileCarrierVaild) {
				alert("통신사를 선택하세요.");
				return false;
			}
			
			// 이용약관 체크하지 않았을때
			let tuserAgree1Valid = $("#trainer-agreeCheckbox-1").prop('checked');
			
			if (!tuserAgree1Valid) {
				alert("이용약관을 체크하세요.");
				return false;
			}
			
			let tuserAgree2Valid = $("#trainer-agreeCheckbox-2").prop('checked');
			
			if (!tuserAgree2Valid) {
				alert("이용약관을 체크하세요.");
				return false;
			}
			
			// 아이디를 올바르게 입력하지 않았을 때
			if(!tIdValid) {
				alert("아이디를 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
			// 아이디 중복체크를 하지 않았을 때
			if(!tIdDupChecked) {
				alert("아이디 중복체크를 수행하세요.");
				event.preventDefault();
				return false;
			}
			
			// 비밀번호 올바르게 입력하지 않았을 때
			if(!tPasswordValid) {
				alert("비밀번호를 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
			
			// 이름 올바르게 입력하지 않았을 때
			if(!tNameValid) {
				alert("이름을 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}
		
			// 이메일 올바르게 입력하지 않았을 때
			if(!tEmailValid) {
				alert("이메일을 올바르게 입력하세요.");
				event.preventDefault();
				return false;
			}			
			return true;
		});
		

		
	 // 아이디 중복검사 
		$(document).ready(function() {
			
		    $("#trainer-check-duplicate").click(function() {
		        var userId = $("#trainer-id").val();
		        var data = { userId: userId };
		
		        $.ajax({
		            type: "post",
		            url: "idChk",
		            data: data,
		            success: function(result) {
		                if (result != 'fail') {
		                    $('.id_input_re_1').css("display", "inline-block");
		                    $('.id_input_re_2').css("display", "none");
		                    tIdDupChecked = true;
		                } else {
		                    $('.id_input_re_2').css("display", "inline-block");
		                    $('.id_input_re_1').css("display", "none");
		                    tIdDupChecked = false;
		                }
		            }
		        });
		    });
		});
		/* 트레이너 끝 */
	
		

		</script>
	
</body>
</html>