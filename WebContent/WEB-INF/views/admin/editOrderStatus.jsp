<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="root" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
    <title>주문 상태 변경</title>
    <!-- 필요한 CSS 라이브러리 포함 -->
</head>
<body>
    <h2>주문 상태 변경</h2>
    <form action="${root}/admin/updateOrderStatus" method="post">
        <input type="hidden" name="orderId" value="${orderDetails.orderId}" />
        <select name="orderStatus" class="form-control">
            <option value="입고 대기">입고 대기</option>
            <option value="배송 준비">배송 준비</option>
            <option value="배송 중">배송 중</option>
            <option value="배송 완료">배송 완료</option>
            <option value="주문 완료">주문 완료</option>
        </select>
        <button type="submit" class="btn btn-primary">상태 변경</button>
    </form>
</body>
</html>
