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
						<a href="${root }/user/userPosthistory" class="btn btn-primary">목록보기</a>
	
								<a href="${root }/product/xquestionid=${questionid}" class="btn btn-danger">삭제</a>
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





	

</body>
</html>