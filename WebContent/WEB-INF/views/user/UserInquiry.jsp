<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>문의 사항 관리</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
        }
        .table {
            width: auto;
            margin: auto;
        }
        
    </style>
</head>
<body>
    <div class="container">

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>문의 번호</th>
                    <th>상품 이름</th>
                    <th>문의 상태</th>
                    <th>사용자 닉네임</th>
                    <th>제목</th>
                    <th>날짜</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="question" items="${questionsDetail}">  
                <tr>               
                   <td>
<a href="javascript:void(0)" onclick="showQuestionDetail(${question.questionid})">
    ${question.questionid}
</a>

</td>
                        <td>${question.productname}</td>
                        <td class="<c:if test="${question.questionstatus == '답변완료'}">status-complete</c:if>">${question.questionstatus}</td>
                        <td>${question.usernickname}</td>
                        <td>${question.questiontitle}</td>
                        <td>${question.questiondate}</td>
                        <td>${question.questiontext}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
  <div id="questionDetailContent" style="margin-top:0px;">
  
  
  </div>

    <!-- Bootstrap JS and its dependencies -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
var root = '${root}';

function showQuestionDetail(questionId) {
    $.ajax({
        url: root + '/product/userQuestionRead?questionid=' + questionId,
        type: 'GET',
        success: function(response) {
            // 상세 정보를 페이지 내 지정된 영역에 표시
            $('#questionDetailContent').html(response);
            // 스크롤을 상세 정보 영역으로 이동 (옵션)
            $('html, body').animate({
                scrollTop: $("#questionDetailContent").offset().top
            }, 500);
        },
        error: function(xhr, status, error) {
            console.error("Error: " + status + " " + error);
        }
    });
}
</script>

    
</body>
</html>
