<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="currentPage" value="${requestScope.page}" />

<!DOCTYPE html>
<html>
<head>
<title>타율 TOP 5</title>
<link rel="stylesheet" href="${root }/css/playerranking.css">
<script>
function toggleRanking(selectedTab) {
    var battingTab = document.querySelector('.tab-batting');
    var pitchingTab = document.querySelector('.tab-pitching');
    var battingRank = document.getElementById('battingRank');
    var pitchingRank = document.getElementById('pitchingRank');

    if (selectedTab === 'batting') {
        battingTab.classList.add('active');
        pitchingTab.classList.remove('active');
        battingRank.style.display = 'grid';
        pitchingRank.style.display = 'none';
    } else {
        pitchingTab.classList.add('active');
        battingTab.classList.remove('active');
        battingRank.style.display = 'none';
        pitchingRank.style.display = 'grid';
    }
}
</script>





</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <div style="width: 60%; margin: auto;">
   <div class="selects">

      <a href="${root}/record/PlayerRanking"
         class="select${requestScope.page == 'playerRanking' ? ' active' : ''}">개인순위</a>
      <a href="${root}/record/TeamRanking"
         class="select${requestScope.page == 'teamRanking' ? ' active' : ''}">팀순위</a>
   </div>

<div class="tabs">
    <div class="tab-batting active" onclick="toggleRanking('batting')">시즌타자순위</div>
    <div class="tab-pitching" onclick="toggleRanking('pitching')">시즌투수순위</div>
</div>

   <div id="battingRank" class="table-container">
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               타율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>타율</th>
               
               </tr>
            </thead>
            <tbody>
               <c:forEach var="player" items="${topBattingAveragePlayers}" varStatus="status">
                        <c:if test="${status.index < 5}">
                       <tr class="rank1">
                        
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${player.player_Id}">                      
                     ${player.name }</a></td>
                  <td>${player.teamName }</td>
                  <td>${player.battingAverage }</td>
               
                  
               </c:if>
            
            
            </c:forEach>   
            </tbody>
         </table>
      </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               홈런 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>홈런</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="Player" items="${topHomeRunPlayers }" varStatus= "status">
                 <c:if test="${status.index < 5}">
               <tr class="rank2">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.homerun }</td>
               </c:if>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               타점 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>타점</th>
               </tr>
            </thead>
            <tbody>
             <c:forEach var="Player" items="${topRBIPlayers }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.rbi }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
         
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               득점 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>득점</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topScorePlayers }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.score }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               안타 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>안타</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topPlayersByhit }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.hits }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               장타율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>장타율</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topslgplayer }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.slg }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
   </div>
   <div id="pitchingRank" class="table-container">
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               승리 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>승리</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="player" items="${topWinPlayers}" varStatus="status">
                        <c:if test="${status.index < 5}">
                       <tr class="rank1">
                        
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${player.player_Id}">                      
                  ${player.name }</a></td>
                  <td>${player.teamName }</td>
                  <td>${player.win }</td>
               </c:if>
            
            
            </c:forEach>   
            </tbody>
         </table>
      </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               방어율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>방어율</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="Player" items="${topERAPlayers }" varStatus= "status">
                 <c:if test="${status.index < 5}">
               <tr class="rank2">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td><fmt:formatNumber value="${Player.era }" pattern="0.00"/></td>
               </c:if>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               탈삼진 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>탈삼진</th>
               </tr>
            </thead>
            <tbody>
             <c:forEach var="Player" items="${topSOPlayers }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.so }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
         
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               세이브 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>세이브</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topSavePlayer }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.save }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               홀드 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>홀드</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topHoldPlayer }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  <td>${Player.teamName }</td>
                  <td>${Player.hold }</td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
         <table class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               승률 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
               <tr class="rank-subject">
                  <th>순위</th>
                  <th>선수명</th>
                  <th>팀</th>
                  <th>승률</th>
               </tr>
            </thead>
       <c:forEach var="Player" items="${topWinRatePlayer }" varStatus="status">
                 <c:if test="${status.index < 5}">
               <tr class="rank3">
                  <td>${status.index+1}</td>
                                                             
                  <td> <a href="${root}/player/player_info?player_id=${Player.player_Id}">                      
                  ${Player.name }</a></td>
                  
                  <td>${Player.teamName }</td>
                  <td><fmt:formatNumber value="${Player.winRate }" pattern="0.000"/></td>
               </tr>
         </c:if>
         </c:forEach>
         </tbody>
         </table>
         </div>
   </div>
   <div class="full-records-button-container">
    <a href="${root}/record/AllRecords" class="full-records-button">전체 기록실 바로가기</a>
</div>
    </div>
</body>
</html>