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
            <form:form action="${root}/admin/updatePlayer" method="post" modelAttribute="player">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">선수이름</label>
                    <div class="col-sm-10">
                        <form:input path="name" class="form-control" value="${player.name}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">커리어</label>
                    <div class="col-sm-10">
                        <form:input path="highSchool" class="form-control" value="${player.highSchool}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">포지션</label>
                    <div class="col-sm-10">
                        <form:input path="position" class="form-control" value="${player.position}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">연봉</label>
                    <div class="col-sm-10">
                        <form:input path="salary" class="form-control" value="${player.salary}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">등번호</label>
                    <div class="col-sm-10">
                        <form:input path="jerseyNumber" class="form-control" value="${player.jerseyNumber}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">선수 이미지</label>
                    <div class="col-sm-10">
                        <form:input path="playerImg" class="form-control" value="${player.playerImg}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">계약 보너스</label>
                    <div class="col-sm-10">
                        <form:input path="signingBonus" class="form-control" value="${player.signingBonus}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">입단 년도</label>
                    <div class="col-sm-10">
       					 <form:input path="joinYear" class="form-control" value="${player.joinYear}" readonly="true"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">키</label>
                    <div class="col-sm-10">
                        <form:input path="tall" class="form-control" value="${player.tall}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">몸무게</label>
                    <div class="col-sm-10">
                        <form:input path="height" class="form-control" value="${player.height}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">입단 순위</label>
                    <div class="col-sm-10">
        				<form:input path="draftRank" class="form-control" value="${player.draftRank}" readonly="true"/>
                    </div>
                </div>
               <div class="form-group row">
				    <label class="col-sm-2 col-form-label">팀</label>
				    <div class="col-sm-10">
				        <form:select path="teamId" class="form-control">
				            <form:option value="1">LG</form:option>
				            <form:option value="2">KT</form:option>
				            <form:option value="3">SSG</form:option>
				            <form:option value="4">NC</form:option>
				            <form:option value="5">DOOSAN</form:option>
				            <form:option value="6">KIA</form:option>
				            <form:option value="7">LOTTE</form:option>
				            <form:option value="8">SAMSUNG</form:option>
				            <form:option value="9">HANWHA</form:option>
				            <form:option value="10">KIMWOOM</form:option>
				        </form:select>
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
