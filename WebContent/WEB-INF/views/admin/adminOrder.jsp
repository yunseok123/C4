<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var='root' value='${pageContext.request.contextPath}'/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 관리 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2>주문 관리</h2>
    
    <table class="table">
        <thead class="thead-light">
            <tr>
                <th>#</th>
                <th>주문자</th>
                <th>주문 상품</th>
                <th>총액</th>
                <th>주문 상태</th>
                <th>주문 날짜</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.ordererName}</td>
                    <td>${order.productName}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.orderStatus}</td>
                    <td>${order.orderDate}</td>
                    <td>
                        <button class="btn btn-primary btn-sm detail-btn" data-toggle="modal" data-target="#orderDetailModal" data-order-id="${order.orderId}">상세 보기</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Order Detail Modal -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailModalLabel">주문 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- AJAX 호출을 통해 받은 주문 상세 정보가 동적으로 채워집니다 -->
            </div>
            <div class="modal-footer">
                <!-- 주문 상태 수정 드롭다운 -->
                <select class="form-control" id="orderStatusSelect">
					<option value="입고 대기">입고 대기</option>
                    <option value="배송 준비">배송 준비</option>
                    <option value="배송 중">배송 중</option>                
                    <option value="주문 완료">주문 완료</option>
                    <option value="배송 완료">배송 완료</option>
                </select>
                <button type="button" class="btn btn-warning update-order-status-btn">상태 변경</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>








<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    var selectedOrderId; // 전역 변수로 selectedOrderId 선언

    $('.detail-btn').click(function() {
        var rootPath = "${root}";
        selectedOrderId = $(this).data('order-id'); // 클릭한 버튼의 data-order-id 값을 저장

        $.ajax({
            url: rootPath + '/admin/orderDetail?orderId=' + selectedOrderId,
            type: 'GET',
            success: function(order) {
                $('#orderDetailModalLabel').text('주문 상세 정보 - 주문 ID: ' + order.orderId);
                var modalBody = $('#orderDetailModal .modal-body');
                modalBody.html(
                    '<p>주문 날짜: ' + order.orderDate + '</p>' +
                    '<p>주문자 이름: ' + order.ordererName + '</p>' +
                    '<p>주문 상품: ' + order.productName + ' (수량: ' + order.orderItemQuantity + ', 가격: ' + order.productPrice + ')</p>' +
                    '<p>주문 상품 사이즈 : ' + order.sizes +'</p>' +
                    '<p>총액: ' + order.orderItemPrice + '</p>' +
                    '<p>주문 상태: ' + order.orderStatus + '</p>' +
                    '<p>주문자 우편번호: ' + order.postalCode + '</p>' +
                    '<p>배송 주소: ' + order.shippingAddress +'('+ order.detailAddress +')</p>' +
                    '<p>연락처: ' + order.cellphoneNumber +'</p>' +
                    '<p>주문자 이메일: ' + order.email + '</p>' +
                    '<p>주문자 남긴메세지: ' + order.message + '</p>' +
                    '<p>주문자 환불계좌: ' + order.refundAccount + '</p>'
                );
                $('#orderDetailModal').on('shown.bs.modal', function() {
                    $('#orderStatusSelect').val(order.orderStatus); // 주문 상태 드롭다운 설정
                });
                $('#orderDetailModal').modal('show'); // 모달 표시
            },
            error: function(error) {
                console.log('Error: ', error);
            }
        });
    });

    $('.update-order-status-btn').click(function() {
        var orderStatus = $('#orderStatusSelect').val();
        $.ajax({
            url: "${root}/admin/updateOrderStatus",
            type: 'POST',
            data: {
                orderId: selectedOrderId, // 수정된 부분: 여기서 selectedOrderId 사용
                orderStatus: orderStatus
            },
            success: function(response) {
                alert('주문 상태가 성공적으로 업데이트되었습니다.');
                $('#orderDetailModal').modal('hide');
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                alert('주문 상태 업데이트에 실패하였습니다. 오류 메시지: ' + xhr.responseText);
            }
        });
    });
});
</script>



</body>
</html>
