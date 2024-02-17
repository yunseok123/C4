<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html lang="ko">
<head>
      <link rel="stylesheet" href="${root }/css/comm.css">
     </head>
<body>     
       <c:import url="/WEB-INF/views/include/header.jsp"/>

    <div class="board-container">
    <h1 class="board-title">제목: 국제사회</h1>
    <div class="board-meta">
        <span class="board-author">작성자: 임유진</span>
        <div class="board-info">
            <span class="board-date">2024-01-07</span>
            <span class="board-views">조회수:1</span>
        </div>
    </div>
    <div class="board-content">
        정신차려 임유진 <br>
        
    </div>
    <hr class="separator"> <!-- Horizontal line before previous post -->
    <div class="nav-previous">
        이전글 <span class="nav-arrow">&#9650;</span> <!-- Upward arrow for previous post -->
    </div>
    <hr class="separator"> <!-- Horizontal line after previous post -->
    <div class="nav-next">
        다음글 <span class="nav-arrow">&#9660;</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>안녕</h4> <!-- Downward arrow for next post -->
    </div>
</div>


        <!-- 푸터 영역 -->
        <div class="footer-bar">
            <!-- 푸터 내용 -->
        </div>
    </div>
</body>
</html>
</body>
</html>