<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<!DOCTYPE html>
<html>
<head>
    <title>수상 경력 입력</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>수상 경력 입력</h2>
    <form action="${root}/admin/insertAward" method="post" class="form-horizontal">
        <input type="hidden" name="playerId" value="${playerId}"/>
        <div class="form-group">
            <label class="control-label col-sm-2" for="awardName">수상 이름:</label>
            <div class="col-sm-10">
                <input type="text" name="awardName" class="form-control" id="awardName" placeholder="수상 이름 입력"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="awardYear">수상 연도:</label>
            <div class="col-sm-10">
                <input type="number" name="awardYear" class="form-control" id="awardYear" placeholder="수상 연도 입력"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
        </div>
    </form>
</div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
