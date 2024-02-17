<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선수 목록</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.5/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    
</head>
<body>
<div class="container mt-5">
    <h2>선수 목록</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>이름</th>
                <th>생년월일</th>
                <th>종류</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="player" items="${players}">
                <tr>
                    <td>${player.name}</td>
                    <td>${player.birthDate}</td>
                    <td>
                        <a href="#" class="btn btn-primary edit-player-btn" data-playerid="${player.player_Id}">선수 정보 수정</a>
                        <a href="#" class="btn btn-info edit-record-btn" data-playerid="${player.player_Id}">선수 기록 수정</a>
                        <a href="#" class="btn btn-success edit-award-btn" data-playerid="${player.player_Id}">선수 수상 추가</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div id="dynamicContent"></div>

<script>
$(document).ready(function() {
    var rootPath = "${root}";

    // 이벤트 위임을 사용하여 동적 요소에도 이벤트 리스너 적용
    $('body').on('click', '.edit-player-btn, .edit-record-btn, .edit-award-btn', function(e) {
        e.preventDefault();
        var playerId = $(this).data('playerid');
        var actionType;

        if ($(this).hasClass('edit-player-btn')) {
            actionType = 'editPlayer';
        } else if ($(this).hasClass('edit-record-btn')) {
            actionType = 'editPlayerRecord';
        } else if ($(this).hasClass('edit-award-btn')){
            actionType = 'insertAwardForm';
        }

        $.ajax({
            url: rootPath + "/admin/" + actionType + "?player_id=" + playerId,
            type: "GET",
            success: function(response) {
                $("#dynamicContent").html(response);
            },
            error: function(xhr, status, error) {
                alert("오류 발생: " + error);
            }
        });
    });
});

</script>



</body>
</html>
