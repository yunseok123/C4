<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 내역</title>
    <!-- 부트스트랩 CSS 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    
    .table {
            width: 500px;
            margin: 500px;
        }
    
    </style>
</head>
<body>
 <c:import url="/WEB-INF/views/include/header.jsp"/>

<div class="container mt-5">
    <h2 class="mb-4">게시글 내역</h2>
    <div class="btn-group" role="group" aria-label="Basic example">
        <!-- <button type="button" class="btn btn-secondary" id="loadpostHistory">게시글 내역</button> -->
<!--   <button type="button" class="btn btn-secondary" id="loadinquiryHistory">문의 내역</button>
 -->    
    </div>
    <div id="purchaseHistoryContent" class="mt-4"	>
        <!-- AJAX로 불러온 내용이 여기에 표시됩니다 -->
    </div>	
</div>


<!-- 부트스트랩 JS 링크 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script>
$(document).ready(function() {
    // 페이지 로드 시 상품 구매 내역을 자동으로 로드
    $.ajax({
        url: "${root}/user/UserInquiry", // 상품 구매 내역을 가져오는 URL
        type: "GET",
        success: function(response) {
            // 서버로부터 응답을 받으면 #purchaseHistoryContent 내용을 업데이트
            $("#purchaseHistoryContent").html(response);
        }
    });

 /*    $("#loadpostHistory").click(function() {
        $.ajax({
            url: "${root}/user/UserPost", // 티켓 구매 내역을 가져오는 URL
            type: "GET",
            success: function(response) {
                // 서버로부터 응답을 받으면 #purchaseHistoryContent 내용을 업데이트
                $("#purchaseHistoryContent").html(response);
            }
        });
    }); */

    $("#loadinquiryHistory").click(function() {
        $.ajax({
            url: "${root}/user/UserInquiry", // 상품 구매 내역을 가져오는 URL
            type: "GET",
            success: function(response) {
                // 서버로부터 응답을 받으면 #purchaseHistoryContent 내용을 업데이트
                $("#purchaseHistoryContent").html(response);
            }
        });
    });
});
</script>


</body>
</html>
