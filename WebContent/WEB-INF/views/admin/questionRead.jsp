<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script

	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 상단 메뉴 부분 -->

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body content">
						<div class="form-board">
							<label for="">작성자</label> <input type="text" id="usernickname"
								name="usernickname" class="form-control"
								value="${questionBean.usernickname }" disabled="disabled" />
						</div>

						<div class="form-group">
							<label for="board_date">작성날짜</label>
							<fmt:formatDate value="${questionBean.questiondate}"
								pattern="yyyy-MM-dd" var="formattedDate" />
							<input type="text" id="questiondate" name="questiondate"
								class="form-control" value="${formattedDate}"
								disabled="disabled" />
						</div>

						<div class="form-group">
							<label for="board_subject">제목</label> <input type="text"
								id="questiontitle" name="questiontitle" class="form-control"
								value="${questionBean.questiontitle }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="questiontext" name="questiontext"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${questionBean.questiontext }</textarea>
						</div>
						<div class="form-group"></div>
						
					<div class="form-group">
						<div class="text-right">
						<a href="${root }/admin/adminQuestion" class="btn btn-primary">목록보기</a>
	
								<a href="javascript:void(0)" class="btn btn-danger reply-button" data-questionid="${questionid}">답글달기</a>
								<a href="${root }/admin/questionDelete?questionid=${questionid}" class="btn btn-danger">삭제</a>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="questiontext" name="questiontext"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${questionBean.answertext }</textarea>
						</div>
						</div>
						
					</div>
				</div>
				<div id="replyFormContainer" style="display: none;"></div>
				
			</div>
		</div>
		<div class="col-sm-3"></div>
	
		
	</div>
	</div>
<script>
$(document).ready(function() {
    $('.reply-button').click(function() {
        var questionId = $(this).data('questionid'); // 버튼에서 문의 ID를 가져옵니다.

        // 기존 내용을 숨기고 답글 폼 컨테이너를 준비합니다.
        $('.content').hide(); // 기존 내용 숨기기
        $('#replyFormContainer').empty().show(); // 답글 폼 컨테이너를 비우고 보이게 설정

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: '${root}/admin/questionAnswer', // AJAX 요청 URL
            type: 'GET',
            data: { questionid: questionId },
            success: function(response) {
                // 답글 작성 폼을 답글 폼 컨테이너에 삽입합니다.
                $('#replyFormContainer').html(response); // 폼을 삽입하고 보이게 합니다.
            },
            error: function(xhr, status, error) {
                alert('답글 작성 폼을 불러오는 데 실패했습니다.');
                console.error(error);
            }
        });
    });
});
</script>




	

</body>
</html>
