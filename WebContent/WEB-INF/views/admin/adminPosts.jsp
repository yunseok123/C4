<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html>
<head>
    <title>게시글 관리</title>
    <!-- Bootstrap CSS와 필요한 JavaScript 라이브러리를 포함 -->
</head>
<body>
    <div class="container">
        <h2>게시글 관리</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="content" items="${contentList}">
                    <tr>
                        <td>${content.community_id}</td>
                        <td>${content.community_subject}</td>
                        <td>${content.community_writer_name}</td>
                        <td>${content.community_date}</td>
                        <td>
                            <button class="btn btn-primary" onclick="showPostDetail(${content.community_id})">상세 보기</button>
                            <button class="btn btn-danger" onclick="deletePost(${content.community_id})">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 게시글 상세 정보 모달 -->
<div class="modal fade" id="postDetailModal" tabindex="-1" role="dialog" aria-labelledby="postDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="postDetailModalLabel">게시글 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 게시글 상세 정보가 여기에 표시됩니다. -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


    <script>

    function showPostDetail(community_id) {
    	var rootPath = "${root}";
    
        $.ajax({
            url: rootPath + '/admin/postDetail', // 서버로부터 게시글 상세 정보를 요청하는 URL
            type: 'GET', // HTTP 요청 방식
            data: { community_id: community_id }, // 서버로 전송할 데이터
            success: function(content) {
                console.log(content); // 서버로부터 받은 데이터를 콘솔에 출력
                $('#postDetailModalLabel').text('게시글 상세 정보'); // 모달의 제목 설정
                var modalBody = $('#postDetailModal .modal-body');
                modalBody.html(
                    '<p>글 제목: ' + content.community_subject + '</p>' +
                    '<p>글 내용: ' + content.community_text + '</p>' +
                    '<p>작성자: ' + content.community_writer_name + '</p>' +
                    '<p>작성일: ' + content.community_date + '</p>' +
                    (content.community_file ? '<img src="' + rootPath + '/upload/' + content.community_file + '" width="100%"/>' : '')
                ); // 모달의 본문 내용 설정
                $('#postDetailModal').modal('show'); // 모달 표시
            },
            error: function(error) {
                alert('상세 정보 조회에 실패했습니다.'); // 오류 발생 시 사용자에게 알림
            }
        });
    }


    function deletePost(community_id) {
        if(confirm('해당 게시글을 삭제하시겠습니까?')) {
            $.ajax({
                url: '${root}/admin/deletePost',
                type: 'POST',
                data: { community_id: community_id },
                success: function(response) {
                    if(response === 'success') {
                        alert('게시글이 삭제되었습니다.');
                        location.reload(); // 페이지 새로고침
                    }
                },
                error: function(error) {
                    alert('게시글 삭제에 실패했습니다.');
                }
            });
        }
    }
    </script>
</body>
</html>
