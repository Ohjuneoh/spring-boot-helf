<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
	<a href="home" class="navbar-brand p-0">
	    <h1 class="m-0"><i class="fa fa-user-tie me-2"></i>HELF</h1>
	</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <a href="home" class="nav-item nav-link active">홈</a>
            <a href="about" class="nav-item nav-link">About</a>
            <a href="service" class="nav-item nav-link">Services</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Blog</a>
                <div class="dropdown-menu m-0">
                    <a href="blog" class="dropdown-item">Blog Grid</a>
                    <a href="detail" class="dropdown-item">Blog Detail</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                <div class="dropdown-menu m-0">
                    <a href="price" class="dropdown-item">Pricing Plan</a>
                    <a href="feature" class="dropdown-item">Our features</a>
                    <a href="team" class="dropdown-item">Team Members</a>
                    <a href="testimonial" class="dropdown-item">Testimonial</a>
                    <a href="quote" class="dropdown-item">Free Quote</a>
                </div>
            </div>
            <a href="contact" class="nav-item nav-link">Contact</a>
        </div>
        <button type="button" class="btn text-primary ms-3" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
        <a href="https://htmlcodex.com/startup-company-website-template" class="btn btn-primary py-2 px-4 ms-3">로그인</a>
        <a href="https://htmlcodex.com/startup-company-website-template" class="btn btn-primary py-2 px-4 ms-3">회원가입</a>
    </div>
</nav>