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
            <a href="test" class="nav-item nav-link">캘린더</a>
            <sec:authorize access="isAnonymous()">
            <a href="/concept" class="nav-item nav-link">Concept</a>
            <a href="about" class="nav-item nav-link">News</a>
            <a href="about" class="nav-item nav-link">보도자료</a>
            <a href="/trainerIntro" class="nav-item nav-link">강사 소개</a>
            <a href="about" class="nav-item nav-link">오시는길</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">이용권</a>
                <div class="dropdown-menu m-0">
                    <a href="blog" class="dropdown-item">이용권 구매하기</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업</a>
                <div class="dropdown-menu m-0">
                    <a href="blog" class="dropdown-item">수업 예약</a>
                    <a href="detail" class="dropdown-item">그룹수업 시간표</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">문의</a>
                <div class="dropdown-menu m-0">
                    <a href="price" class="dropdown-item">공지사항</a>
                    <a href="feature" class="dropdown-item">자주 묻는 질문(F&Q)</a>
                    <a href="team" class="dropdown-item">1대1 문의</a>
                </div>
            </div>
            
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                <div class="dropdown-menu m-0">
                    <a href="price" class="dropdown-item">내 정보 조회</a>
                    <a href="feature" class="dropdown-item">내 이용권</a>
                    <a href="team" class="dropdown-item">내 쿠폰</a>
                    <a href="team" class="dropdown-item">구매내역</a>
                </div>
            </div>
            </sec:authorize>
        </div>
        <button type="button" class="btn text-primary ms-3" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
        <sec:authorize access="isAnonymous()">
        	<a href="login" class="btn btn-primary py-2 px-4 ms-3">로그인</a>
        	<a href="/user/register" class="btn btn-primary py-2 px-4 ms-3">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated">
        	<a href="/user/logout" class="btn btn-primary py-2 px-4 ms-3">로그아웃</a>
        </sec:authorize>
    </div>
</nav>