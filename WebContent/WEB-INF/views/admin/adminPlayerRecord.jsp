<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 검색</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-between align-items-center mb-3">
        <div class="col">
            <h2>선수 검색</h2>
        </div>
        <div class="col text-right">
            <!-- 우측 상단에 선수 추가 버튼 -->
<a href="${root}/admin/insertPlayerForm";"<%--  data-url="${root}/admin/insertplayerForm" --%> class="add-player-btn" id="addPlayerButton">선수 등록</a>
        </div>
    </div>
    
    <form id="searchForm">
        <div class="form-group">
            <label for="playerName">선수 이름:</label>
            <input type="text" class="form-control" id="playerName" name="playerName" placeholder="선수 이름 입력">
        </div>
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
    <div id="searchResults" class="mt-3"></div>
</div>



<script>
$(document).ready(function() {
    var rootPath = "${pageContext.request.contextPath}";

    $("#searchForm").submit(function(e) {
        e.preventDefault(); // 폼 기본 제출 이벤트 방지
        var playerName = $("#playerName").val(); // 입력 필드에서 선수 이름 가져오기

        $.ajax({
            url: rootPath + "/admin/players", // AJAX 요청 URL
            type: "GET", // HTTP 메소드
            data: {name: playerName}, // 요청과 함께 보낼 데이터
            success: function(response) {
                // 성공적으로 응답을 받았을 때의 처리 로직
                // 예: 검색 결과를 페이지에 표시
                $("#searchResults").html(response);
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 처리 로직
                console.error(error);
            }
        });
    });
});
</script>

</body>
</html>

