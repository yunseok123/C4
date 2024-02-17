<!-- 티켓 상태 수정 모달 -->
<div class="modal fade" id="ticketStatusUpdateModal" tabindex="-1" role="dialog" aria-labelledby="ticketStatusUpdateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ticketStatusUpdateModalLabel">티켓 상태 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 티켓 상태 수정 드롭다운 -->
        <div class="form-group">
          <label for="ticketStatusSelect">티켓 상태:</label>
          <select class="form-control" id="ticketStatusSelect">
            <option value="입고대기">입고대기</option>
            <option value="배송중">배송중</option>
            <option value="배송완료">배송완료</option>
            <option value="취소">취소</option>
            <option value="사용완료">사용완료</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="updateTicketStatus">상태 수정</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
