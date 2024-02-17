<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/33.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header2.jsp" />

	<div class="login-form">
		<c:if test="${fail == true }">
			<div class="alert alert-danger">
				<h3>로그인 실패</h3>
				<p>아이디 비밀번호를 확인해주세요</p>
			</div>
		</c:if>
		<h2>로그인</h2>
		<form:form action="${root }/user/login_pro" method="post" modelAttribute="tempLoginUserBean">
			<div class="form-field">
				<form:label path="user_id">아이디</form:label>
				<form:input path="user_id" class="form-control" placeholder="아이디를 입력하세요"/>
				<form:errors path="user_id" style="color:red" />
			</div>
			<div class="form-field">
				<form:label path="user_password">비밀번호</form:label>
				<form:password path="user_password" class="form-control" placeholder="비밀번호를 입력하세요"/>
				<form:errors path="user_password" style="color:red" />
			</div>
			<div class="form-group text-right">
				<form:button type="submit" class="login-btn">로그인</form:button>
			</div>
			<div class="options">
			
			<a href="${root }/user/join" id="signup-link">회원가입</a>
		</div>
		</form:form>
</div>


	
	<script src="${root }/js/Login.js"></script>

</body>
</html>
