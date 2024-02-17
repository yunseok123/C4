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
        <h2 class="mb-4">문의 사항 관리</h2>
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
						<tr class="question-item" data-questionid="${question.questionid}">
                        <td>${question.questionid}</td>
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
    <!-- Bootstrap JS and its dependencies -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
$(document).ready(function() {
    $('.question-item').click(function() {
        var questionId = $(this).data('questionid'); // data-questionid 속성에서 문의 ID를 가져옵니다.
        $.ajax({
            url: '${root}/admin/questionRead', // AJAX 요청을 보낼 URL
            type: 'GET',
            data: { questionid: questionId }, // 요청과 함께 보낼 데이터
            success: function(response) {
                // AJAX 호출이 성공하면 응답을 처리합니다.
                // 예를 들어, 응답을 메인 콘텐트 영역에 표시할 수 있습니다.
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                alert('문의 사항을 불러오는 데 실패했습니다.');
                console.error(error);
            }
        });
    });
});
</script>
    
</body>
</html>
