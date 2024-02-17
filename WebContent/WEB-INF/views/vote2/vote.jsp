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
	    <link rel="stylesheet" href="${root }/css/vote.css">
	</head>
	<body>
	  	<c:import url="/WEB-INF/views/include/header.jsp"/>
	   
	     <div class="team-logos">
	        <img src="${root }/img/구단 로고/축구/FC안양.png" alt="Team Logo 1">
	        <img src="${root }/img/구단 로고/축구/경남FC.png" alt="Team Logo 2">
	    </div>
	
	    <button class="vote-button">투표하기</button>
	
	 <div class="comments-container">
	    <div class="comment-form">
	        <textarea placeholder="댓글을 작성해주세요."></textarea>
	        <button type="button">검색</button>
	    </div>
	    <div class="comments-list">
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
	    <div class="pagination">
	        <!-- 페이지 네이션 -->
	        <a href="#">&lt;</a>
	        <a href="#">1</a>
	        <a href="#">2</a>
	        <a href="#">&gt;</a>
	    </div>
	</div>
	
	
	
	
	</body>
	</html>