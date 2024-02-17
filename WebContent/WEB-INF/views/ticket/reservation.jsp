<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 페이지</title>
<link rel="stylesheet" href="${root}/css/reservation.css">
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="process-steps">
		<button type="button" id="step1-button" class="selected">1.
			좌석 선택</button>
		<button type="button" id="step2-button">2. 가격 확인</button>
		<button type="button" id="step3-button">3. 주문자 확인</button>
		<button type="button" id="step4-button">4. 결제하기</button>
	</div>

	<!-- ------------------------------ -->

	<div class="width_size">
	<div id = "seatSelectionArea">
	<div class="Divide_area">
		<div id="area_1">
			&nbsp;
			<div class="screen_direction ">경기 필드</div>
			<div class="direction">↑ ↑ ↑</div>
			<div class="seats">
			<c:forEach var="seatInfo" items="${mergedSeatInfo}">
				<c:forEach var="location"
					items="${seatLocations[seatInfo.seatType]}">
					<div class="seat-label-container">
						<input type="checkbox" class="seat-checkbox" id="seat_${location}"
							data-category="${seatInfo.seatType}" data-location="${location}">
						<label for="seat_${location}">${location}</label>
						<!-- 좌석 위치를 표시 -->
					</div>
				</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div id="area_2">
			<img alt="" src="${root}/img/baseball_play.png">
		</div>
		<div id="area_3">
			<div class="area_select">
				<p>좌석등급</p>
				<c:forEach var="seatInfo" items="${mergedSeatInfo}">
					<div class="seat-category">
						<div class="seat_color"></div>
						<button type="button" class="seat-category-button">${seatInfo.seatType}</button>
						<div class="price-info">
							<%-- (${seatInfo.weekdayPrice} / ${seatInfo.weekendPrice})원 --%> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>


	<!-------------------------- -->

		<div class="selected-seats-info">
			<div class="label">선택한 좌석:</div>
			<div class="selected-seats"></div>
			<div class="amount-price">
				현재 금액: <span id="currentAmount">0</span>원
			</div>
		</div>

		<div class="booking-actions">
			<!-- 좌석 선택완료 버튼 클릭 시 JavaScript 함수를 통해 데이터를 서버로 전송 -->
			<button type="button" class="seat-selection-button"
				id="submitSeatSelection">좌석 확정</button>
			<button type="button" class="next-to-step2" id="next-to-step2">좌석
				선택완료</button>
			<button type="button" class="reset-selection-button">예매 다시하기</button>
		</div>


</div>
	<!-- 가격 정보 표시 영역 -->
	<div id="step2-container"
		style="display: none; max-width: 600px; margin: 20px auto;">
		<h3>가격</h3>
		<div id="price-table-container">
			<!-- 서버로부터 받은 가격 정보를 동적으로 표시할 영역 -->
		</div>
		<button type="button" id="next-to-step3">다음으로</button>
	</div>

	<!-- 주문자 정보 입력 폼 -->
	<div id="step3-container"
		style="display: none; max-width: 600px; margin: 20px auto;">
		<h2>예약자 확인</h2>
		<form class="user-info-form">
			<div class="form-group">
				<label for="userName">이름</label> <input type="text" id="userName"
					name="userName" placeholder="이름" required>
			</div>
			<div class="form-group">
				<label for="userBirthdate">생년월일</label> <input type="text"
					id="userBirthdate" name="userBirthdate"
					placeholder="예) 850101 (YYMMDD)" pattern="\d{6}"
					title="YYMMDD 형식으로 입력해주세요." required>
				<p class="info-text">현장수령 및 고객문의시 본인확인을 위해 정확한 정보를 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="userPhone">전화번호</label> <input type="tel" id="userPhone"
					name="userPhone" placeholder="- 없이 입력하세요" pattern="\d{10,11}"
					title="10~11자리 숫자로 입력해주세요." required>
			</div>
			<div class="form-group">
				<label for="userEmail">이메일</label> <input type="email"
					id="userEmail" name="userEmail" placeholder="이메일 주소" required>
				<small>SMS 문자와 이메일로 예약 정보를 보내드립니다.</small>
			</div>
			<div class="form-actions">
				<button type="button" id="next-to-step4" class="submit-button">다음으로</button>
			</div>
		</form>
	</div>



	<div id="step4-container"
		style="display: none; max-width: 600px; margin: 20px auto;">
		<h2>최종 확인</h2>

		<form class="purchasing_Info-form" method="post"
			action="${root}/ticket/ticketOrder">
			<div class="form-group">
				<label for="userName">이름</label> <input type="text"
					id="step4UserName" name="userName" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="userBirthdate">생년월일</label> <input type="text"
					id="step4UserBirthdate" name="userBirthdate" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="userPhone">전화번호</label> <input type="tel"
					id="step4UserPhone" name="userPhone" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="userEmail">이메일</label> <input type="email"
					id="step4UserEmail" name="userEmail" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="gametitle">선택 경기</label> <input type="text"
					id="ticketTitle" name="ticketTitle" value="${game_title}"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="gameDate">경기 날짜</label> <input type="text" id="gameDate"
					name="gameDate" value="${gameDate}" readonly="readonly" />

				<div class="form-group">
					<label for="startTime">시작 시간</label> <input type="text"
						id="startTime" name="startTime" value="${startTime}"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label for="seat">선택 좌석</label> <input type="text" id="seat"
					name="seat" readonly="readonly" />
			</div>


			<div class="form-group">
				<label for="price">총 금액</label> <input type="text" id="amount"
					name="amount" value="${totalPrice}" readonly="readonly">
			</div>
			<input type="hidden" id="gameId" name="GAME_ID" value="${gameId}">
			<input type="hidden" id="selectedSeatsList" name="selectedSeatsList">
			<div class="form-actions">
				<button type="submit" class="submit-button">결제하기</button>
			</div>
		</form>
	</div>



	<script src="${root}/js/reservation.js"></script>
	<script src="${root }/js/seatSelection.js"></script>
	
	</div>
</body>
</html>
