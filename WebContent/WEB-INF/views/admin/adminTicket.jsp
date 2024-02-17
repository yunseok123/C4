<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var='root' value='${pageContext.request.contextPath}' />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 관리 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<div class="container mt-5">
		<h2>티켓 관리</h2>

		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>주문자</th>
					<th>경기</th>
					<th>총액</th>
					<th>경기 날짜</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${ticketList}">
					<tr>
						<td>${ticket.orderId}</td>
						<td>${ticket.ordererName}</td>
						<td>${ticket.ticketTitle}</td>
						<td>${ticket.totalPrice}</td>
						<td>${ticket.gameDate}</td>
						<td>
							<button class="btn btn-primary btn-sm detail-btn"
								data-toggle="modal" data-target="#TicketDetailModal"
								data-order-id="${ticket.orderId}">상세 보기</button>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Order Detail Modal -->
	<div class="modal fade" id="TicketDetailModal" tabindex="-1"
		role="dialog" aria-labelledby="TicketDetailModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="TicketDetailModalLabel">티켓 상세 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- AJAX 호출을 통해 받은 주문 상세 정보가 동적으로 채워집니다 -->
				</div>
				<div class="modal-footer">
					<!-- 주문 상태 수정 드롭다운 -->
					<select class="form-control" id="orderStatusSelect">
						<option value="예약 완료">예약 완료</option>
						<option value="배송 준비">배송 준비</option>
						<option value="배송 중">배송 중</option>
						<option value="배송 완료">배송 완료</option>
						<option value="주문 완료">주문 완료</option>
					</select>
					<button type="button"
						class="btn btn-warning update-order-status-btn">상태 변경</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var selectedTicketId; // 전역 변수로 selectedTicketId 선언

							$('.detail-btn')
									.click(
											function() {
												var rootPath = "${root}";
												selectedTicketId = $(this)
														.data('order-id'); // 클릭한 버튼의 data-order-id 값을 저장

												$
														.ajax({
															url : rootPath
																	+ '/admin/ticketDetail?orderId='
																	+ selectedTicketId, // orderId 사용
															type : 'GET',
															success : function(
																	ticket) {
																$(
																		'#TicketDetailModalLabel')
																		.text(
																				'티켓 상세 정보 - 티켓 ID: '
																						+ ticket.orderId);
																var modalBody = $('#TicketDetailModal .modal-body');
																modalBody
																		.html('<p>경기 날짜: '
																				+ ticket.gameDate
																				+ '</p>'
																				+ '<p>시작 시간: '
																				+ ticket.startTime
																				+ '</p>'
																				+ '<p>경기 타이틀: '
																				+ ticket.ticketTitle
																				+ '</p>'
																				+ '<p>선택 좌석: '
																				+ ticket.ticketSeat
																				+ '</p>'
																				+ '<p>총액: '
																				+ ticket.totalPrice
																				+ '</p>'
																				+ '<p>주문자 이름: '
																				+ ticket.ordererName
																				+ '</p>'
																				+ '<p>주문자 연락처: '
																				+ ticket.cellphoneNumber
																				+ '</p>'
																				+ '<p>주문자 이메일: '
																				+ ticket.email
																				+ '</p>'
																				+ '<p>주문 상태:'
																				+ ticket.orderStatus
																				+ '</p>');

																$(
																		'#TicketDetailModal')
																		.modal(
																				'show'); // 모달 표시
															},
															error : function(
																	error) {
																console
																		.log(
																				'Error: ',
																				error);
															}
														});
											});

							$('.update-order-status-btn')
									.click(
											function() {
												var orderStatus = $(
														'#orderStatusSelect')
														.val();
												$
														.ajax({
															url : "${root}/admin/updateOrderStatus",
															type : 'POST',
															data : {
																orderId : selectedTicketId, // 수정된 부분: 여기서 selectedTicketId 사용
																orderStatus : orderStatus
															},
															success : function(
																	response) {
																alert('주문 상태가 성공적으로 업데이트되었습니다.');
																$(
																		'#TicketDetailModal')
																		.modal(
																				'hide');
																location
																		.reload(); // 페이지 새로고침
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert('주문 상태 업데이트에 실패하였습니다. 오류 메시지: '
																		+ xhr.responseText);
															}
														});
											});
						});
	</script>


</body>
</html>
