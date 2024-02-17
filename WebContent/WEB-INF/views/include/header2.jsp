<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">

<title>Match Point</title>
<link rel="stylesheet" href="${root }/css/header.css"/>


<style>
/* CSS 파일에 추가 */
.hidden {
   display: none;
}
</style>
</head>
<body>

   <div class="header">
      <button onclick="window.location.href='${root }/main'"
         class="logo-button">
         <img src="${root }/img/Match Point.png" alt="Match Point Logo"
            height="30">
      </button>

    
 <div>
<ul class="navbar-navml-auto">
    <c:choose>
        <c:when test="${loginUserBean.userLogin == true }">
            <li class="nav-item">
                <span class="nav-link" style="color:black">${loginUserBean.user_nickname}님</span> <!-- 닉네임 표시 -->
            </li>
            <li class="nav-item">
               <a href="${root }/user/modify" class="nav-link" style="color:black">정보수정</a>
                     <%--  <a href="${root }/mypage/mypagemain" class="nav-link" style="color:black">마이페이지</a> --%>
            </li>
            <li class="nav-item">
                <a href="${root }/user/logout" class="nav-link" style="color:black">로그아웃</a>
            </li>
        </c:when>
        
        <c:otherwise>
            <li class="nav-item">
                <a href="${root }/user/Login" class="nav-link" style="color:black">로그인</a>
            </li>
        </c:otherwise>
    </c:choose>
</ul>
</div>
   </div>


   <div class="header_navbar">
      <div class="top-nav">
      <div><a href="${root }/ticket/Ticketing">경기예매</a></div>
       
      <div> <a href="${root}/record/PlayerRanking">기록실</a></div> 
      <div> <a href="javascript:void(0);" onclick="toggleTeamLogos(event)">TEAM</a></div>
      <div> <a href="${root }/product/Market">MARKET</a></div> 
    
      <div>
      <c:forEach var='obj' items="${topMenuList }">
                  
                     <a class="navlink" href="${root }/board/main?board_info_idx=${obj.board_info_idx}">
                        ${obj.board_info_name }
                     </a>
               
               </c:forEach>
      </div>

      </div>
   </div>



   <div id="logoDiv" class="logo" style="visibility: hidden;">
    <c:forEach var="team" items="${teamBeanList}">
        <a href="${root}/team/Team?team_id=${team.team_ID}">
        
            <img src="${root }/img/구단 로고/야구/${team.team_LogoURL}" height="60" alt="${team.team_Name} Logo"/>
        </a>
    </c:forEach>
   </div>

   <script src="js/header.js"></script>

   <script>
      function toggleTeamLogos(event) {
         event.preventDefault();
         var logoDiv = document.getElementById("logoDiv");
         if (logoDiv.style.visibility === "hidden"
               || logoDiv.style.visibility === "") {
            logoDiv.style.visibility = "visible";
         } else {
            logoDiv.style.visibility = "hidden";
         }
      }
   </script>

</body>
</html>