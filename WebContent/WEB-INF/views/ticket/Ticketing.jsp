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
    <link rel="stylesheet" href="${root }/css/Ticketing.css">
</head>
<body>

         <c:import url="/WEB-INF/views/include/header.jsp"/>
 	<div class="width_size">
    <!--공지-->
<c:import url="/WEB-INF/views/ticket/calendar.jsp"/>

    <!--예메하기-->
<div id="schedule-container" class="game-schedule-container">
   
    <div class="game-info">
       <c:forEach var="game" items="${gameInfo}">
        <div class="game_Schedule">
       
    
        <div class="date_Schedule">
            <span>${game.GAME_DATE}</span>
            
        </div>
        
        <div class="time_Schedule">
        	<span>${game.START_TIME}</span>
        	<span style="font-size: 15px;">(${game.DAY_OF_WEEK})</span>
        </div>
        <div class="teams_Schedule">
            <img src="${root}/img/구단 로고/야구/${game.HOMETEAM_ID}.png" alt="${game.HOMETEAM_NAME}" class="team-logo">
            <span class="vs-text">VS</span>
            <img src="${root}/img/구단 로고/야구/${game.AWAYTEAM_ID}.png" alt="${game.AWAYTEAM_NAME}" class="team-logo">
        </div>
        <div class="team-names">
            <span>${game.HOMETEAM_NAME}</span>
            <span>VS</span>
            <span>${game.AWAYTEAM_NAME}</span>
        </div>
        <a href="${root}/ticket/reservation?GAME_ID=${game.GAME_ID}" class="reserve-link">예약하기</a>

        </div>
        </c:forEach>
    </div>
</div>

 <!--할인표-->
    <div id="discount-container" style="display: none; max-width: 600px; margin: 20px auto;">
        <table border="1">
            <tr>
                <th>구분</th>
                <th>할인</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>성인</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>청소년</td>
                <td>20%</td>
                <td>중 / 고등학생</td>
            </tr>
            <tr>
                <td>어린이</td>
                <td>40%</td>
                <td>초등학생 이하</td>
            </tr>
        </table>
        <!--부정행위 사진-->
       <img class="Cheating" src="${root }/img/부정행위.PNG" alt="부정 사용 금지 안내" style="max-width: 100%; height: auto;">
   
    </div>
    
    <div id="Seat-Container" style="display: none; max-width: 600px; margin: 20px auto; text-align: center;">
    <h2 id="stadium-name">경기장 이름</h2>
    <img id="stadium-image" src="${root }/img/구단 좌석도/배구/KB손해보험.jpg" alt="경기장 사진" style="max-width: 100%; height: auto;">
 
</div>
        <script src="${root }/js/Ticketing.js"></script>
</div>
</body>
</html>
