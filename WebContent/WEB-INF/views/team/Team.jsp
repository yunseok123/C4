<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"l
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/css/team.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <div style="width: 60%; margin: auto;">
      <div class="select">
         <a href="${root}/team/${team.team_ID}">팀</a> <a
            href="${root}/team/${team.team_ID}/Stadium_info">경기장</a>
      </div>
      <div class="team-intro-container">
         <div class="team-logo">
            <img src="${root }/img/구단 로고/야구/${team.team_LogoURL}" height="60" alt="${team.team_Name} Logo"/>
            <!-- 동적으로 팀 로고 표시 -->
         </div>
         <div class="team-description">
            <p>${team.team_Description}</p>
         </div>
      </div>



      <div id="sidebar">
         <ul>
            <li onclick="showRoster('')">전체선수보기</li>
            <li onclick="showRoster('투수')">투수</li>
            <li onclick="showRoster('포수')">포수</li>
            <li onclick="showRoster('내야수')">내야수</li>
            <li onclick="showRoster('외야수')">외야수</li>
         </ul>
      </div>

      <div id="player-list-container">
         <div id="player-list">
            <c:forEach items="${player}" var="player">
               <div class="player-card">
                  <div class="player-image">

                     <a
                        href="${root}/player/player_info?player_id=${player.player_Id}">
                        <img src="${player.playerImg}" alt="${player.name}">
                     </a>


                  </div>
                  <div class="player-info">
                     <h4>${player.name}</h4>
                     <!-- 선수 이름 -->
                     <p>포지션: ${player.player_Id}</p>
                     <!-- 선수 포지션 -->
                     <p>등번호: ${player.jerseyNumber}</p>
                     <!-- 선수 등번호 -->
                     <!-- 추가적인 선수 정보 -->
                  </div>
               </div>
            </c:forEach>


         </div>
         <nav aria-label="Player pagination">
            <ul class="pagination justify-content-center">
               <c:if test="${currentPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="${root}/team/Team?team_id=${team.team_ID}&page=${currentPage - 1}"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
               </c:if>
               <c:forEach begin="1" end="${totalPages}" var="i">
                  <li class="page-item ${currentPage == i ? 'active' : ''}"><a
                     class="page-link"
                     href="${root}/team/Team?team_id=${team.team_ID}&page=${i}">${i}</a>
                  </li>
               </c:forEach>
               <c:if test="${currentPage < totalPages}">
                  <li class="page-item"><a class="page-link"
                     href="${root}/team/Team?team_id=${team.team_ID}&page=${currentPage + 1}"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
               </c:if>
            </ul>
         </nav>

      </div>
   </div>

<script>
  function showRoster(position) {
    if (position === '') {
      // position이 빈 문자열이면 페이지를 다시 불러옵니다.
      window.location.reload();
      return; // 함수의 나머지 부분이 실행되지 않도록 함수 실행을 종료합니다.
    }

    $('nav[aria-label="Player pagination"]').hide();

    $.ajax({
      url: '${root}/team/${team.team_ID}/playersByPosition/' + position,
      success: function(data) {
        $('#player-list-container').html(data);
      }
    });
  }
</script>




</body>
</html>