	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Admin Dashboard</title>
	    <!-- Bootstrap CSS -->
	    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
	    <div class="container mt-5">
	    <h2>선수이름:${player.name }</h2>    
	            <form:form action="${root}/admin/updateRecord" method="post" modelAttribute="record">
	                <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">게임 플레이</label>
	                    <div class="col-sm-10">
	                        <form:input path="gameplayed" class="form-control" value="${record.gameplayed}"/>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">타석</label>
	                    <div class="col-sm-10">
	                        <form:input path="atBats" class="form-control" value="${record.atBats}"/>
	                    </div>
	               </div>
	              <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">타수</label>
	                    <div class="col-sm-10">
	                        <form:input path="bats" class="form-control" value="${record.bats}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">안타</label>
	                    <div class="col-sm-10">
	                        <form:input path="hits" class="form-control" value="${record.hits}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">2루타</label>
	                    <div class="col-sm-10">
	                        <form:input path="hit2" class="form-control" value="${record.hit2}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">3루타</label>
	                    <div class="col-sm-10">
	                        <form:input path="hit3" class="form-control" value="${record.hit3}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">홈런</label>
	                    <div class="col-sm-10">
	                        <form:input path="homerun" class="form-control" value="${record.homerun}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">타점</label>
	                    <div class="col-sm-10">
	                        <form:input path="rbi" class="form-control" value="${record.rbi}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">득점</label>
	                    <div class="col-sm-10">
	                        <form:input path="score" class="form-control" value="${record.score}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">희생 플라이</label>
	                    <div class="col-sm-10">
	                        <form:input path="sf" class="form-control" value="${record.sf}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">희생 번트</label>
	                    <div class="col-sm-10">
	                        <form:input path="sac" class="form-control" value="${record.sac}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">볼넷</label>
	                    <div class="col-sm-10">
	                        <form:input path="bb" class="form-control" value="${record.bb}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">승리</label>
	                    <div class="col-sm-10">
	                        <form:input path="win" class="form-control" value="${record.win}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">패배</label>
	                    <div class="col-sm-10">
	                        <form:input path="lose" class="form-control" value="${record.lose}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">탈삼진</label>
	                    <div class="col-sm-10">
	                        <form:input path="so" class="form-control" value="${record.so}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">세이브</label>
	                    <div class="col-sm-10">
	                        <form:input path="save" class="form-control" value="${record.save}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">홀드</label>
	                    <div class="col-sm-10">
	                        <form:input path="hold" class="form-control" value="${record.hold}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">자책점</label>
	                    <div class="col-sm-10">
	                        <form:input path="earnedruns" class="form-control" value="${record.earnedruns}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">이닝</label>
	                    <div class="col-sm-10">
	                        <form:input path="innging" class="form-control" value="${record.innging}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">피안타</label>
	                    <div class="col-sm-10">
	                        <form:input path="hit_against" class="form-control" value="${record.hit_against}"/>
	                    </div>
	               </div>
	               <div class="form-group row">
	                    <label class="col-sm-2 col-form-label">퀄리티 스타트</label>
	                    <div class="col-sm-10">
	                        <form:input path="qs" class="form-control" value="${record.qs}"/>
	                    </div>
	               </div>
	               <form:hidden path="player_Id" value="${player.player_Id}"/>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">수정 완료</button>
                    </div>
                </div>
	               
	            </form:form> 
	    </div>
	    <!-- Bootstrap and JQuery -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.5/dist/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</body>
	</html>
