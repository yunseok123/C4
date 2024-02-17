let selectedSeats = [];

document.addEventListener('DOMContentLoaded', function() {
// 좌석 버튼에 대한 이벤트 리스너 설정
    document.querySelectorAll('.seat').forEach(function(seat) {
        seat.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            toggleSeatSelection(this);
        });
    });
    // "예매 다시하기" 버튼에 대한 이벤트 리스너 설정
    document.querySelector('.reset-selection-button').addEventListener('click', function() {
        resetSeatSelection();
    });
});

function toggleSeatSelection(seat) {
    const seatNumber = seat.textContent;
    const index = selectedSeats.indexOf(seatNumber);
    
    if (index > -1) {
        selectedSeats.splice(index, 1);
        seat.classList.remove('selected');
    } else {
        selectedSeats.push(seatNumber);
        seat.classList.add('selected');
    }

    updateSelectedSeatsDisplay();
}

function updateSelectedSeatsDisplay() {
    const selectedSeatsDiv = document.querySelector('.selected-seats');
    selectedSeatsDiv.textContent = selectedSeats.join(', ');
}


function resetSeatSelection() {
    // 선택된 좌석 목록 비우기
    selectedSeats = [];

    // 모든 좌석 버튼에서 'selected' 클래스 제거
    document.querySelectorAll('.seat').forEach(function(seat) {
        seat.classList.remove('selected');
    });

    // 선택된 좌석 목록 업데이트
    updateSelectedSeatsDisplay();
}