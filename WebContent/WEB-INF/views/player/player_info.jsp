<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:set var="root" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 및 회원가입 페이지</title>
    <link rel="stylesheet" href="${root }/css/player_info.css">
      
</head>
<body>
   	<c:import url="/WEB-INF/views/include/header.jsp"/>
   
    <div class="player-info-section">
         <div class="player-info-frame">
        <div class="player-details">
            <p><strong>이름</strong>: ${players.name} (${players.position}) </p> 
            <p><strong>키</strong>:${players.tall}cm
           	<p><strong>몸무게</strong> ${players.height}kg</p>
            <p><strong>출생</strong>: ${players.birthDate}</p>
            <p><strong>경력</strong>: ${players.highSchool}</p>
            <p><strong>계약금</strong>: ${players.signingBonus}</p>
            <p><strong>연봉</strong>: ${players.salary}</p>
            <p><strong>입단 년도</strong>: ${players.joinYear}</p>
            <p><strong>드레프트 순위</strong>: ${players.draftRank}</p>
            
        </div>

        
        <div class="player-photo">
            <img src="${players.playerImg}" alt="선수 사진">
        </div>
    </div>
     
      <div class="player-info-content1">
      <h2>수상 내역</h2>
      <c:forEach var="award" items="${awards}">
     
          <ul>
              <li>${award.awardYear }: ${award.awardName }</li>
              <!-- 추가 수상 내역 -->
          </ul>
          </c:forEach>
      </div>

</div>
</body>
</html>