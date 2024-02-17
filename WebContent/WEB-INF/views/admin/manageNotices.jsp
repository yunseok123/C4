<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>공지사항 관리</h2>
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
            <c:forEach var="notice" items="${noticeList}">
                <tr>
                    <td>${notice.notice_id}</td>
                    <td>${notice.title}</td>
                    <td>${notice.user_idx}</td> <!-- 작성자 ID나 이름으로 수정 필요 -->
                    <td>${notice.notice_date}</td>
                    <td><button class="btn btn-primary" onclick="showNoticeDetail(${notice.notice_id})">상세 보기</button></td>
                    <td><button class="btn btn-danger" onclick="deleteNotice(${notice.notice_id})">삭제</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button class="btn btn-primary mt-3" onclick="location.href='${root}/admin/insertNoticeForm'">공지사항 작성</button>
</div>


<!-- 공지사항 상세보기 모달 -->
<div class="modal fade" id="noticeDetailModal" tabindex="-1" role="dialog" aria-labelledby="noticeDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="noticeDetailModalLabel">공지사항 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 여기에 공지사항 상세 내용이 표시됩니다 -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

 // 공지사항 상세보기 함수
    function showNoticeDetail(notice_id) {
        $.ajax({
            url: '${root}/admin/noticeDetail', // 공지사항 상세 정보를 요청하는 URL
            type: 'GET', // HTTP 요청 방식
            data: { notice_id: notice_id }, // 서버로 전송할 데이터
            success: function(notice) {
                var modalBody = $('#noticeDetailModal .modal-body');
                modalBody.html('<p>제목: ' + notice.title + '</p><p>내용: ' + notice.content + '</p>');
                $('#noticeDetailModal').modal('show'); // 모달 표시
            },
            error: function() {
                alert('공지사항 상세 정보 조회에 실패했습니다.'); // 오류 발생 시 사용자에게 알림
            }
        });
    }

    // 공지사항 상세보기 함수
    window.showNoticeDetail = function(notice_id) {
        $.ajax({
            url: '${root}/admin/noticeDetail',
            type: 'GET',
            data: { notice_id: notice_id },
            success: function(notice) {
                var modalBody = $('#noticeDetailModal .modal-body');
                modalBody.html('<p>제목: ' + notice.title + '</p><p>내용: ' + notice.content + '</p>');
                $('#noticeDetailModal').modal('show');
            }
        });
    };
    
    function deleteNotice(notice_id) {
        if(confirm('해당 공지사항을 삭제하시겠습니까?')) {
            $.ajax({
                url: '${root}/admin/deleteNotice',
                type: 'POST',
                data: { notice_id: notice_id },
                success: function(response) {
                    alert('공지사항이 삭제되었습니다.');
                    window.location.reload(); // 페이지를 새로고침하여 변경된 목록을 보여줌
                },
                error: function(error) {
                    alert('공지사항 삭제 중 오류가 발생했습니다.');
                }
            });
        }
    }

</script>
</body>
</html>
