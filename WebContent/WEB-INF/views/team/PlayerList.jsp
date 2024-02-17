<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/team.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>


   <div id="player-list">
    <c:forEach items="${players}" var="player">
        <div class="player-card">
            <div class="player-image">
              <a
                href="${root}/player/player_info?player_id=${player.player_Id}">
                <img src="${player.playerImg}" alt="${player.name}">
              `</a>
            </div>
            <div class="player-info">
                <h4>${player.name}</h4> <!-- 선수 이름 -->
                <p>포지션: ${player.position}</p> <!-- 선수 포지션 -->
                <p>등번호: ${player.jerseyNumber}</p> <!-- 선수 등번호 -->
                <!-- 추가적인 선수 정보 -->
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>