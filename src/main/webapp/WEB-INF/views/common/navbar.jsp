<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
	<a href="/" class="navbar-brand p-0">
	    <h1 class="m-0"><i class="fa fa-user-tie me-2"></i>HELF</h1>
	</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <a href="/" class="nav-item nav-link ${menu eq '홈' ? 'active' : '' }">홈</a>
            <sec:authorize access="hasRole('ROLE_USER')">
	            <a href="/order/list" class="nav-item nav-link">이용권</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MANAGER')">
            	<div class="nav-item dropdown">
	            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">이용권</a>
		            <div class="dropdown-menu m-0">
		            	<a href="/membership/create-form" class="dropdown-item">이용권 생성</a>
		                <a href="/membership/list-manager" class="dropdown-item">이용권 관리</a>
		                <a href="/membership/refund-manager" class="dropdown-item">환불 관리</a>
					</div>
				</div>
            </sec:authorize>

            <sec:authorize access="isAnonymous()">
            	<a href="/concept" class="nav-item nav-link">Concept</a>
            	<a href="/branch" class="nav-item nav-link">오시는길</a>
            	<a href="/trainerIntro" class="nav-item nav-link">강사 소개</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">문의</a>
                <div class="dropdown-menu m-0">
                    <a href="/board/notice" class="dropdown-item">공지사항</a>
                    <a href="/board/faq" class="dropdown-item">자주 묻는 질문(F&Q)</a>
                    <a href="/inquiry/inquiries" class="dropdown-item">1대1 문의</a>
                </div>
            </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER') || hasRole('ROLE_TRAINER')">
            <div class="nav-item dropdown">
                <div class="dropdown-menu m-0">
                    <sec:authorize access="hasRole('ROLE_USER')">
                    <a href="/user/userMypage" class="dropdown-item">내 정보 조회</a>
                    <a href="/lesson/user-my-lesson" class="dropdown-item">내 수업 조회</a>
                    <a href="/membership/list" class="dropdown-item">내 이용권</a>
                    <a href="/membership/order-list" class="dropdown-item">구매내역</a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_TRAINER')">
                        <a href="/user/trainerMypage" class="dropdown-item">내 정보 조회</a>
                        <a href="/lesson/trainer-my-lesson" class="dropdown-item">내 수업 조회</a>
                        <a href="/checkin/attendance" class="dropdown-item">출퇴근 내역</a>
                    </sec:authorize>
                </div>
            </div>
             </sec:authorize>
            <sec:authorize access="isAuthenticated">
	            <sec:authorize access="hasRole('ROLE_USER')">
	            <div class="nav-item dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업(고객)</a>
	                <div class="dropdown-menu m-0">
	                    <a href="/group-lesson/list" class="dropdown-item">그룹 수업</a>
	                    <a href="/personal-lesson/consultation" class="dropdown-item">개인 PT 신청</a>
	                    <a href="/trainerIntro" class="dropdown-item">강사 리뷰 보기</a>
	                </div>
	            </div>
	            </sec:authorize>
	            <sec:authorize access="hasRole('ROLE_TRAINER')">
	            <div class="nav-item dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업(트레이너)</a>
	                <div class="dropdown-menu m-0">
	                    <a href="/group-lesson/list" class="dropdown-item">그룹 수업</a>
	                    <a href="/personal-lesson/list" class="dropdown-item">PT 신청내역</a>
	                </div>
	            </div>
	            </sec:authorize>
	            <sec:authorize access="hasRole('ROLE_MANAGER')">
	            	<div class="nav-item dropdown">
	               		<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업</a>
	                	<div class="dropdown-menu m-0">
	                    	<a href="/group-lesson/list" class="dropdown-item">그룹 수업 조회</a>
	                    	<a href="" class="dropdown-item">개인 수업 조회</a>
	                	</div>
	                	<div class="dropdown-menu m-0">
	                    	<a href="/group-lesson/list" class="dropdown-item">그룹 수업 조회</a>
	                    	<a href="" class="dropdown-item">개인 수업 조회</a>
	                	</div>
	            	</div>
	            </sec:authorize>
	            <div class="nav-item dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">문의</a>
	                <div class="dropdown-menu m-0">
	                    <a href="/board/notice" class="dropdown-item">공지사항</a>
	                    <a href="/board/faq" class="dropdown-item">자주 묻는 질문(F&Q)</a>
	                    <a href="/inquiry/inquiries" class="dropdown-item">1대1 문의</a>
	                </div>
	            </div>
	            <sec:authorize access="hasRole('ROLE_USER') || hasRole('ROLE_TRAINER')">
	            	<div class="nav-item dropdown">
	                	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
	                	<div class="dropdown-menu m-0">
	                    	<sec:authorize access="hasRole('ROLE_USER')">
	                    		<a href="/user/userMypage" class="dropdown-item">내 정보 조회</a>
			                    <a href="/lesson/user-my-lesson" class="dropdown-item">내 수업 조회</a>
			                    <a href="/membership/list" class="dropdown-item">내 이용권</a>
			                    <a href="/membership/order-list" class="dropdown-item">구매내역</a>
	                    	</sec:authorize>
	                    	<sec:authorize access="hasRole('ROLE_TRAINER')">
		                        <a href="/user/trainerMypage" class="dropdown-item">내 정보 조회</a>
		                        <a href="/lesson/trainer-my-lesson" class="dropdown-item">내 수업 조회</a>
		                        <a href="/checkin/attendance" class="dropdown-item">출퇴근 내역</a>
		                        <a href="/salary/salary-detail?id=<sec:authentication property="principal.id" />" class="dropdown-item">급여 내역</a>
	                    	</sec:authorize>
	                	</div>
	            	</div>
	            </sec:authorize>
	             <sec:authorize access="hasRole('ROLE_MANAGER')">
	             <div class="nav-item dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객&인사관리</a>
	                <div class="dropdown-menu m-0">
	                    <a href="/management/customer-list" class="dropdown-item">고객관리</a>
	                    <a href="/management/trainer-list" class="dropdown-item">인사관리</a>
	                    <a href="/salary/salary-list" class="dropdown-item">급여관리</a>
	                    <a href="/checkin/check-in" class="dropdown-item">입장화면</a>
	                </div>
	            </div>
            </sec:authorize>
            </sec:authorize>
        </div>
        <button type="button" class="btn text-primary ms-3" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
        <sec:authorize access="isAnonymous()">
        	<a href="/user/loginform" class="btn btn-primary py-2 px-4 ms-3">로그인</a>
        	<a href="/user/registerform" class="btn btn-primary py-2 px-4 ms-3">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated">
        	<a href="/user/logout" class="btn btn-primary py-2 px-4 ms-3">로그아웃</a>
        </sec:authorize>
    </div>
</nav>