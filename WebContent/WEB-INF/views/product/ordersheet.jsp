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
    <link rel="stylesheet" href="${root }/css/ordersheet.css">
          
</head>
<body>
         	<c:import url="/WEB-INF/views/include/header.jsp"/>

    <div class="cart-container">
        <div class="cart-header">
            <h1>주문서   작성/결제</h1>
            <span class="progress-bar">
                01. 주문 확인 ><span class="point"> 02. 주문서 작성/결제  </span>> 03. 주문완료
            </span>
        </div>
        <hr>
       <!DOCTYPE html>
<html lang="ko">

<body>
 <form:form modelAttribute="order" action="${root}/product/placeOrder" method="post">
    <div class="form-container">
        <h2>주문자 정보</h2>
        <table class="form-table">
            <tr>
                <th>주문하시는 분</th>
                <td><form:input path="ordererName" class="full-width" required="required" /></td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td>
                    <form:input path="cellphoneNumber" class="phone" required="required" />
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><form:input path="email" class="full-width"  required="required"/></td>
            </tr>
        </table>
        
        <h2>배송지 정보</h2>
        <table class="form-table">
            <tr>
                <th>우편번호</th>
                <td>
                    <form:input path="postalCode" id="postalCodeInput"  required="required" />
                    <button type="button" class="postButton" onclick="searchPostalCode()">우편번호 검색</button>
                </td>
            </tr>
            <tr>
                <th>도로명 주소</th>
                <td><form:input path="shippingAddress" id="roadAddressInput"  required="required" /></td>
            </tr>
            <tr>
                <th>상세 주소</th>
                <td><form:input path="detailAddress" id="additionalAddressInput"  required="required"/></td>
            </tr>
            <tr>
                <th>배송 메모</th>
                <td><form:input path="message" class="full-width"  /></td>
            </tr>
        </table>
        
        <h2>추가 정보</h2>
        <table class="form-table">
            <tr>
                <th>환불 계좌</th>
                <td><form:input path="refundAccount" class="full-width" required="required" /></td>
            </tr>
        </table>

        <h2>결제 정보</h2>
        <table class="form-table">
            <!-- 결제 정보 표시, 실제 애플리케이션에서는 서버에서 계산된 값으로 대체 -->
            <tr>
                <th>상품 합계 금액</th>
                <td><span id="subtotalPrice">100,000</span></td>
            </tr>
            <tr>
                <th>배송비</th>
                <td>0원</td>
            </tr>
            <tr class="total">
                <th>최종 결제금액</th>
                <td><span id="finalPrice">100,000</span></td>
            </tr>
        </table>
    </div>
    <input type="hidden" id="finalPriceHidden" name="finalPriceHidden" value="0" />
    <input type="hidden" name="productId" value="${param.product_id}" />
    <input type="hidden" name="productSize" value="${param.productSize}" />
    <input type="hidden" name="quantity" value="${param.quantity}" />
    <input type="hidden" name="price" value="${param.totalPrice}" />
    <div class="pay-button-container">
        <button type="submit" class="pay-button">결제하기</button>
    </div>
    
</form:form>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${root }/js/ordersheet.js"></script>
 
 
          
    
</body>
</html>
