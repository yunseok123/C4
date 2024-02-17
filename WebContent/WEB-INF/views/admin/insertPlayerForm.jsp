<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/market.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">선수 등록</h2>

    <form action="${root}/admin/insertPlayer" method="post">
        <div class="form-group">
            <label for="name">선수명:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="position">포지션:</label>
            <input type="text" class="form-control" id="position" name="position" required>
        </div>
        <div class="form-group">
            <label for="tall">키:</label>
            <input type="number" class="form-control" id="tall" name="tall" required>
        </div>
        <div class="form-group">
            <label for="height">몸무게:</label>
            <input type="number" class="form-control" id="height" name="height" required>
        </div>
         <div class="form-group">
            <label for="height">선수 경력:</label>
            <input type="text" class="form-control" id="highSchool" name="highSchool" required>
        </div>
         
         <div class="form-group">
            <label for="height">생일:</label>
            <input type="text" class="form-control" id="birthDate" name="birthDate" required>
        </div>
         <div class="form-group">
            <label for="height">이미지 URL:</label>
            <input type="text" class="form-control" id="playerImg" name="playerImg" required>
        </div>
         <div class="form-group">
            <label for="height">걔약 보너스:</label>
            <input type="number" class="form-control" id="signingBonus" name="signingBonus" required>
        </div>
         <div class="form-group">
            <label for="height">연봉:</label>
            <input type="number" class="form-control" id="salary" name="salary" required>
        </div>
         <div class="form-group">
            <label for="height">입단년도:</label>
            <input type="number" class="form-control" id="joinYear" name="joinYear" required>
        </div>
        <div class="form-group">
            <label for="height">등번호:</label>
            <input type="number" class="form-control" id="jerseyNumber" name="jerseyNumber" required>
        </div>
        
         <div class="form-group">
            <label for="height">지명순위:</label>
            <input type="number" class="form-control" id="draftRank" name="draftRank" required>
        </div>
        
        
        
        
        <!-- 팀 선택 드롭다운 -->
        <div class="form-group">
            <label for="team">팀:</label>
            <select class="form-control" id="teamId" name="teamId">
                <option value="1">LG</option>
                <option value="2">KT</option>
                <option value="3">SSG</option>                
                <option value="4">NC</option>
                <option value="5">DOOSAN</option>
                <option value="6">KIA</option>
                <option value="7">LOTTE</option>
                <option value="8">SAMSUNG</option>
                <option value="9">HANWHA</option>
                <option value="10">KIMWOOM</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">선수 등록</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
