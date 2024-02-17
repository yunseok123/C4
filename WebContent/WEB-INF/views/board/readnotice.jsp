<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="${root}/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div class="container mt-5">
    <h2>${notice.title}</h2>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">${notice.title}</h5>
            <p class="card-text">${notice.content}</p>
            <p class="text-muted">작성일: ${notice.notice_date}</p>
        </div>
    </div>
    <a href="${root}/board/main?board_info_idx=1" class="btn btn-primary mt-3">목록으로 돌아가기</a>
</div>

</body>
</html>
