<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html lang="ko">
<head>

      <link rel="stylesheet" href="${root }/css/commlist.css">
     </head>
<body>
       <c:import url="/WEB-INF/views/include/header.jsp"/>
  
     <div class="comments-container">
    <div class="comment-form">
		 <select class="select-sport">
                <option value="baseball">야구</option>
                <option value="soccer">축구</option>
                <option value="volleyball">배구</option>
            </select>
        <textarea placeholder="검색어를 입력하세요."></textarea>
        <button type="button">검색</button>
    </div>
    <div class="comments-list">
        <div class="comment">
            <span class="comment-name"><b>닉네임</b></span>
            <span class="comment-content"><b>글내용</b></span>
            <span class="comment-date"><b>작성일</b></span>
        </div>
           <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
           <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
           <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
          <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        <div class="comment">
            <span class="comment-name">김철수</span>
            <span class="comment-content">정말 좋은 글입니다.</span>
            <span class="comment-date">2023-12-06</span>
        </div>
        
        <!-- 추가 댓글 -->
    </div>
</div>
<div class="footer-container">
    <div class="pagination-container">
        <div class="pagination">
            <!-- 페이지네이션 -->
            <a href="#">&lt;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">&gt;</a>
        </div>
    </div>
    <div class="button-container">
    <button type="button" class="create-comment-button" onclick="location.href='${root }/community/commWrite'">글 작성</button>
    </div>
</div>

</body>
</html>
