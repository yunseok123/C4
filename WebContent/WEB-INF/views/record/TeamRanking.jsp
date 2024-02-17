<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
 <c:set var="root" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/TeamRanking.css">
</head>
<body>
  <c:import url="/WEB-INF/views/include/header.jsp"/>

<div class="ranking-container">

     <c:forEach var="team" items="${topTeams}" varStatus="status">
        <div class="team">
            <div class="position">${status.index + 1}</div>
             <a href="${root}/team/Team?team_id=${team.team_ID}">           
            <img src="${root }/img/구단 로고/야구/${team.team_LogoURL}" height="60" alt="${team.team_Name} Logo"/>
            </a>
            <div class="details">
                <span class="team-name">${team.team_Name}</span><br/>
                <span>승률 <fmt:formatNumber value="${team.winRate}" pattern="0.000"/></span><br/>
            </div>
        </div>
    </c:forEach>
</div>
 <section class="wrapper">
        <!-- Row attribute -->
        <main class="row attribute">
            <ul>
                <li>순위</li>
                <li>팀명</li>
                <li><span class="attribute-hide">#</span>경기수</li>
                <li>승</li>
                <li>패</li>
                <li>무</li>
                <li>승률</li>
                <li>게임차</li>
            </ul>
        </main>
        
        <!-- Teams List -->
        <c:forEach var="team" items="${teamBeanList}" varStatus="status">
            <article class="row BlueC">
                <ul>
                    <li><a href="#">${status.index + 1}등</a></li>
                    <li><a href="${root}/team/Team?team_id=${team.team_ID}">${team.team_Name}</a></li>
                    <li>${team.entries}</li>
                    <li>${team.wins}</li>
                    <li>${team.losses}</li>
                    <li>${team.draws}</li>
                     <li><fmt:formatNumber value="${team.winRate}" pattern="0.000"/></li>
               <li>${team.gamesBehind}</li> <!-- 여기에 문자열 형태의 경기 수 차이를 표시 -->
                </ul>
                <ul class="more-content">
                    <!-- 여기에 추가 정보를 포함시키거나, 필요 없다면 이 부분을 삭제하세요 -->
                    <li>어항 속에 갇힌 고기들보다 어쩌면 내가 좀 더 멍청할지 몰라</li>
                </ul>
            </article>
        </c:forEach>
    </section>
</body>
</html>