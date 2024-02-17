<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<script>
    // URL에서 amount 파라미터 값을 추출하는 함수
    function getQueryParam(param) {
        var search = window.location.search.substring(1);
        var variables = search.split('&');
        for (var i = 0; i < variables.length; i++) {
            var pair = variables[i].split('=');
            if (decodeURIComponent(pair[0]) == param) {
                return decodeURIComponent(pair[1]);
            }
        }
        return null;
    }

    var amount = getQueryParam('amount'); // URL에서 amount 값을 추출
    var paymentUrl = "${root}/pay/payment?amount=" + amount; // 결제 페이지 URL에 amount 값을 포함
    location.href = paymentUrl; // 결제 페이지로 리다이렉션
</script>
