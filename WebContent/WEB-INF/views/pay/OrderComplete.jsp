<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   
 <c:set var="root" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 및 회원가입 페이지</title>
    <link rel="stylesheet" href="${root }/css/OrderComplete.css">
          
</head>
<body>
         	<c:import url="/WEB-INF/views/include/header.jsp"/>

    <div class="cart-container">
        <div class="cart-header">
            <h1>주문완료</h1>
            <span class="progress-bar">
                01. 주문 확인 > 02. 주문서 작성/결제 > <span class="point"> 03. 주문완료</span>
            </span>
        </div>
        <hr>
       <!DOCTYPE html>
<html lang="ko">

<body>
 
    <div class="form-container">
    	<h1 class="form-main"><span class="point-main">상품 주문</span>이 완료 되었습니다.</h1>
    	
        </div>
<button onclick="window.location.href='${root }/main'" class="form-back"><  &nbsp      돌아가기</button>


    
</body>
</html>
