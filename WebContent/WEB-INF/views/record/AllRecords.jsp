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
<link rel="stylesheet" href="${root }/css/AllRecords.css">
</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <div style="width: 80%; margin: auto;">
   <div class="selects">
      <a href="${root}/record/TeamRanking"
         class="select${requestScope.page == 'teamRanking' ? ' active' : ''}">팀순위</a>
      <a href="${root}/record/PlayerRanking"
         class="select${requestScope.page == 'playerRanking' ? ' active' : ''}">개인순위</a>
   </div>


   <div class="selects">
        <button class="tab-batting" onclick="toggleRanking('batting')">시즌타자순위</button>
        <button class="tab-pitching" onclick="toggleRanking('pitching')">시즌투수순위</button>
    </div>

   <div id="battingRank" class="table-container">
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
            <table id="playerRankingTable" class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               타율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
             <tr class="rank-subject">
                 <th>순위</th>
                 <th>선수명</th>
                 <th>팀</th>
               <th><span class="sortable" onclick="sortTable(3)">타율</span></th>
               <th><span class="sortable" onclick="sortTable(4)">경기수</span></th>
               <th><span class="sortable" onclick="sortTable(5)">타석</span></th>
               <th><span class="sortable" onclick="sortTable(6)">타수</span></th>
               <th><span class="sortable" onclick="sortTable(7)">득점</span></th>
               <th><span class="sortable" onclick="sortTable(8)">안타</span></th>
               <th><span class="sortable" onclick="sortTable(9)">2루타</span></th>
               <th><span class="sortable" onclick="sortTable(10)">3루타</span></th>
               <th><span class="sortable" onclick="sortTable(11)">홈런</span></th>
               <th><span class="sortable" onclick="sortTable(12)">타점</span></th>
               <th><span class="sortable" onclick="sortTable(13)">장타율</span></th>
               <th><span class="sortable" onclick="sortTable(14)">출루율</span></th>
               <th><span class="sortable" onclick="sortTable(15)">OPS</span></th>

             </tr>
         </thead>
            <tbody>
               <c:forEach var="player" items="${allRecordsBat}" varStatus="status">
                       <tr class="rank1">
                        
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${player.player_Id}">                      
                    ${player.name }</a></td>
                  <td>${player.teamName }</td>
                  <td><fmt:formatNumber value="${player.battingAverage }" pattern="0.000"/></td>
                  <td>${player.gameplayed}</td>
                  <td>${player.atBats}</td>
                  <td>${player.bats}</td>
                  <td>${player.score}</td>
                  <td>${player.hits}</td>
                  <td>${player.hit2}</td>
                  <td>${player.hit3}</td>
                  <td>${player.homerun}</td>
                  <td>${player.rbi}</td>
                  <td><fmt:formatNumber value="${player.slg}" pattern="0.000"/></td>
                  <td><fmt:formatNumber value="${player.obp}" pattern="0.000"/></td>
                  <td><fmt:formatNumber value="${player.ops}" pattern="0.000"/></td>                  
                  </c:forEach>   
               </tbody>
            </table>
         </div>
      </div>
      
<div id="playerRankingTableEraWhip" class="table-container">
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
            <table id="pitchingTableEraWhip" class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               타율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
           <tr class="rank-subject">
                 <th>순위</th>
                 <th>선수명</th>
                 <th>팀</th>
               <th><span class="sortable" onclick="togglePitchingTable('era')">ERA</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('gameplayed')">게임플레이</span></th>                                
               <th><span class="sortable" onclick="togglePitchingTable('win')">승리</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('lose')">패배</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('hold')">홀드</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('save')">세이브</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('so')">탈삼진</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('inning')">이닝</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('bb')">볼넷</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('hit_against')">피안타</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('whip')">WHIP</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('kk9')">KK/9</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('bb9')">BB/9</span></th>

             
             </tr>
         </thead>
            <tbody>
               <c:forEach var="player" items="${allRecordsPit1}" varStatus="status">
                       <tr class="rank1">                 
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${player.player_Id}">                      
                    ${player.name }</a></td>
                  <td>${player.teamName }</td>
                  <td><fmt:formatNumber value="${player.era }" pattern="0.00"/></td>
                  <td>${player.gameplayed}</td>                  
                  <td>${player.win }</td>
                  <td>${player.lose }</td>
                  <td>${player.hold }</td>                  
                  <td>${player.save }</td>
                  <td>${player.so }</td>
                  <td><fmt:formatNumber value="${player.innging }" pattern="0.0"/></td>
                  <td>${player.bb }</td>
                  <td>${player.hit_against }</td>                  
                  <td>${player.whip }</td>
                  <td><fmt:formatNumber value="${player.inngingk }" pattern="0.000"/></td>
                  <td><fmt:formatNumber value="${player.inngingbb }" pattern="0.000"/></td>            
                  </c:forEach>
                  
               </tbody>
            </table>
         </div>
      </div>
      
      
   <div id="playerRankingTableOther" class="table-container">
      <div class="TableContainer">
         <!-- TableContainer 클래스를 div로 감싸 화면 가운데로 정렬 -->
            <table id="pitchingTableOther" class="top-players">
            <!-- top-players 클래스 적용 -->
            <caption>
               타율 TOP 5 <a href="#" class="caption-button">+</a>
            </caption>
            <thead>
             <tr class="rank-subject">
                 <th>순위</th>
                 <th>선수명</th>
                 <th>팀</th>
               <th><span class="sortable" onclick="togglePitchingTable('era')">ERA</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('gameplayed')">게임플레이</span></th>                             
               <th><span class="sortable" onclick="togglePitchingTable('win')">승리</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('lose')">패배</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('hold')">홀드</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('save')">세이브</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('so')">탈삼진</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('inning')">이닝</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('bb')">볼넷</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('hit_against')">피안타</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('whip')">WHIP</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('kk9')">KK/9</span></th>
               <th><span class="sortable" onclick="togglePitchingTable('bb9')">BB/9</span></th>

             
             </tr>
         </thead>
            <tbody>
               <c:forEach var="player" items="${allRecordsPit2}" varStatus="status">
                       <tr class="rank1">                 
                  <td>${status.index+1}</td>
                  <td> <a href="${root}/player/player_info?player_id=${player.player_Id}">                      
                    ${player.name }</a></td>
                  <td>${player.teamName }</td>
                  <td><fmt:formatNumber value="${player.era }" pattern="0.00"/></td>
                  <td>${player.gameplayed}</td>                  
                  <td>${player.win }</td>
                  <td>${player.lose }</td>
                  <td>${player.hold }</td>                  
                  <td>${player.save }</td>
                  <td>${player.so }</td>
                  <td><fmt:formatNumber value="${player.innging }" pattern="0.0"/></td>
                  <td>${player.bb }</td>
                  <td>${player.hit_against }</td>                  
                  <td>${player.whip }</td>
                  <td><fmt:formatNumber value="${player.inngingk }" pattern="0.000"/></td>
                  <td><fmt:formatNumber value="${player.inngingbb }" pattern="0.000"/></td>            
                  </c:forEach>
                  
               </tbody>
            </table>
         </div>
      </div>            
      

        <script src="${root }/js/AllRecord.js"></script>

</div>


   </body>
</html>
      