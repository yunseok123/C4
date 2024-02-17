<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<link rel="stylesheet" href="${root }/css/read.css"/>
<!-- Bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {

        $("#submitReply").click(function() {
            var replyText = $("#replyText").val();
            if (replyText.trim() === '') {
                alert('댓글을 입력해주세요.');
                return;
            }
            $.ajax({
                url: '${root}/reply',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    reply_text: replyText, 
                    reply_content_idx: ${community_id} 
                }),
                success: function(response) {
                    var replyHtml = '<div class="card mt-2"><div class="card-body">' +
                                    '<p class="card-text">' + response.reply_text + '</p>' +
                                    '</div></div>';
                    $("#replySection").append(replyHtml);
                    $("#replyText").val(''); 
                    alert('댓글이 성공적으로 추가되었습니다.'); 
                    
                   
                    updateReplyList();
                },
                error: function(error) {
                    console.log(error);
                    alert('댓글 추가에 실패했습니다.'); 
                }
            });
        });

      
        function updateReplyList() {
            $.ajax({
                url: '${root}/replies?reply_content_idx=${community_id}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $("#replySection").empty(); 
                    response.reverse();
                    $.each(response, function(index, reply) {
                        var replyHtml = '<div class="card mt-2"><div class="card-body">' +
                                        '<p class="card-subtitle text-muted">작성자: ' + reply.user_nickname + '</p>' +
                                        '<p class="card-text">' + reply.reply_text + '</p>' +
                                        '</div></div>';
                        $("#replySection").append(replyHtml); 
                    });
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }

       
        updateReplyList();
    });

</script>
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="board_writer_name">작성자</label>
						<input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="${readContentBean.community_writer_name }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_date">작성날짜</label>
						<input type="text" id="board_date" name="board_date" class="form-control" value="${readContentBean.community_date }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_subject">제목</label>
						<input type="text" id="board_subject" name="board_subject" class="form-control" value="${readContentBean.community_subject }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_content">내용</label>
						<textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContentBean.community_text }</textarea>
					</div>
					<div class="form-group">
					
						<c:if test="${readContentBean.community_file != null }">
							<label for="board_file">첨부 이미지</label>
							<img src="${root }/upload/${readContentBean.community_file}" width="100%"/>
						</c:if>	
										
					</div>
					<div class="form-group">
						<div class="text-right">
							<a href="${root }/board/main?board_info_idx=${board_info_idx}" class="btn btn-primary">목록보기</a>
	
							<c:if test="${loginUserBean.user_idx == readContentBean.community_writer_idx }">								
								<a href="${root }/board/modify?board_info_idx=${board_info_idx}&community_id=${community_id}" class="btn btn-info">수정하기</a>
								<a href="${root }/board/delete?board_info_idx=${board_info_idx}&community_id=${community_id}" class="btn btn-danger">삭제하기</a>
							</c:if>
							
						</div>
					</div>
					
					<div class="reply-form">
							<h4>댓글 작성</h4>
							<textarea id="replyText" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
							<button id="submitReply" type="button" class="btn btn-primary mt-2">댓글 달기</button>
						</div>
						

						<div class="reply-section mt-4">
							<h4>댓글</h4>
							<div id="replySection"></div>
						</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>



</body>
</html>
