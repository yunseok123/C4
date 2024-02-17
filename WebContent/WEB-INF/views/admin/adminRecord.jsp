<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .team-info { margin-bottom: 20px; }
    </style>
</head>
<body>

     <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

    <div class="container mt-5">
        <h2>팀 수정</h2>
        <div class="row" role="row">
            <c:forEach var="team" items="${teamBeanList}" varStatus="status">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">팀명: ${team.team_Name}</h5>
                            <p class="card-text">승리: ${team.wins}</p>
                            <p class="card-text">패배: ${team.losses}</p>
                            <p class="card-text">무승부: ${team.draws}</p>
<a href="#" class="btn btn-primary team-edit-btn" data-teamid="${team.team_ID}">수정</a>
	                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
                </main>
    
    <!-- Bootstrap and JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.5/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
 var rootPath = "${root}";
$(document).ready(function() {
	$(".team-edit-btn").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        var teamId = $(this).data("teamid"); // 데이터 속성에서 팀 ID 가져오기
        $.ajax({
            url: rootPath + "/admin/editTeam?team_id=" + teamId, // 수정된 코드
            type: "GET",
            success: function(response) {
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });
});

     
</script>
    
</body>
</html>
	