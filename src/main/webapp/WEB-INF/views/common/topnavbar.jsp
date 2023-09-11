<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="container-fluid bg-dark px-5 d-none d-lg-block">
	<div class="row gx-0">
	    <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
	        <div class="d-inline-flex align-items-center" style="height: 45px;">
	            <small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i>서울시 종로구 율곡로 10길 105 </small>
	            <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>+012 345 6789</small>
	            <small class="text-light"><i class="fa fa-envelope-open me-2"></i>health@helf.com</small>
	        </div>
	    </div>
	    <div class="col-lg-4 text-center text-lg-end">
	        <div class="d-inline-flex align-items-center" style="height: 45px;">
			    <sec:authorize access="isAuthenticated()">
				    <strong>
				    	<small class="text-light" style="margin-right: 50px;">
				    		<sec:authentication property="principal.name" /> 님 환영합니다.
				    	</small>
				    </strong>
			    </sec:authorize>
	        </div>
	    </div>
	</div>
</nav>