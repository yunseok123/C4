<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var='root' value='${pageContext.request.contextPath}' />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>경기 관리 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<h2>경기 관리</h2>
			</div>
			<div class="col-md-6 text-right">
				<button class="btn btn-success insert-btn">경기 등록</button>
			</div>
		</div>

		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>경기일</th>
					<th>시작시간</th>
					<th>홈팀</th>
					<th>어웨이팀</th>
					<th>경기장</th>
					<th>점수</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="gameSchedule" items="${gameSchedule}">
					<tr>
						<td>${gameSchedule.gameId}</td>
						<td>${gameSchedule.gameDate}</td>
						<td>${gameSchedule.startTime}</td>
						<td>${gameSchedule.HOMETEAM_NAME}</td>
						<td>${gameSchedule.AWAYTEAM_NAME}</td>
						<td>${gameSchedule.STADIUM_NAME}</td>
						<td>${gameSchedule.score}</td>
						<td>
							<button class="btn btn-primary btn-sm detail-btn"
								data-toggle="modal" data-target="#ScheduleDeleteModal"
								data-gameid="${gameSchedule.gameId}">일정 삭제</button>


						</td>
					</tr>
				</c:forEach>



			</tbody>
		</table>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			// 일정 삭제 버튼 클릭 시
			$(".detail-btn").click(function() {
				var gameId = $(this).data("gameid"); // 삭제할 일정의 게임 ID 가져오기
				var confirmation = confirm("일정을 삭제하시겠습니까?");
				if (confirmation) { // 확인을 누르면
					$.ajax({
						type : "POST",
						url : "${root}/admin/deleteGameSchedule", // 삭제를 처리하는 컨트롤러 주소
						data : {
							gameId : gameId
						}, // 삭제할 일정의 게임 ID를 서버로 전송
						success : function(response) {
							alert("일정이 삭제되었습니다."); // 삭제 완료 메시지 출력
							location.reload(); // 페이지 새로고침
						},
						error : function(xhr, status, error) {
							console.error(xhr.responseText); // 오류 메시지 출력
							alert("일정 삭제 중 오류가 발생했습니다.");
						}
					});
				}
			});
		});
		
		$(document).ready(function() {
			
		    $(".insert-btn").click(function(e) {
		        e.preventDefault(); // 기본 이벤트를 방지
		        $.ajax({
		            url: rootPath+"/admin/insertGameSchedule",
		            type: "GET", // HTTP 요청 방식
		            success: function(response) {
		                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
		                $("main[role='main']").html(response);
		            },
		            error: function(xhr, status, error) {
		                // 오류 처리
		                console.error(error);
		            }
		        });
		    });
		});
	</script>


</body>
</html>
