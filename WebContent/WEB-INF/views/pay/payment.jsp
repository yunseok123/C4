<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script>
var appRoot = 'http://localhost:9090' + '${pageContext.request.contextPath}';
</script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>결제하기</title>
    <!-- 토스페이먼츠 결제창 SDK 추가 -->
    <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
    <script>
        function initiatePayment() {
        	var amount = ${amount}; 

            // 클라이언트 키로 객체 초기화
            var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
            var tossPayments = TossPayments(clientKey);

            // 결제창 띄우기
            tossPayments.requestPayment('카드', {
                amount: amount, // 서버에서 받은 금액 사용
                orderId: '7_XR8395y-HtJQb7Wb55L', // 주문 ID
                orderName: '테스트 결제', // 주문명
                customerName: '김토스', // 구매자 이름
                successUrl: 'http://localhost:8080/finalProject/pay/payment_success',
                failUrl: appRoot + '/pay/payment_fail',
            }).catch(function (error) {
                // 에러 처리
                console.error(error);
            });
        }

        // 페이지 로드 시 결제창 초기화
        window.onload = initiatePayment;
    </script>
</body>
</html>
