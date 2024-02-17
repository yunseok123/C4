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
            <form:form action="${root}/admin/updateTeam" method="post" modelAttribute="team">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">팀명</label>
                    <div class="col-sm-10">
                        <form:input path="teamName" class="form-control" value="${team.team_Name}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">승</label>
                    <div class="col-sm-10">
                        <form:input path="wins" class="form-control" value="${team.wins}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">패</label>
                    <div class="col-sm-10">
                        <form:input path="losses" class="form-control" value="${team.losses}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">무</label>
                    <div class="col-sm-10">
                        <form:input path="draws" class="form-control" value="${team.draws}"/>
                    </div>
                </div>
                <form:hidden path="team_ID" value="${team.team_ID}"/>
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
