function toggleDropdown() {
    var customOptions = document.querySelector('.custom-select-wrapper .custom-options');
    customOptions.style.display = customOptions.style.display === 'block' ? 'none' : 'block';
}

  function updateTotalPrice() {
        var selectElement = document.querySelector('select[name="optionSnoInput"]');
        var optionPrice = parseInt(selectElement.options[selectElement.selectedIndex].getAttribute('data-price') || 0, 10);
        var totalPrice = basePrice + optionPrice;

        document.querySelector('.goods_total_price').textContent = totalPrice.toLocaleString('ko-KR') + '원';
        document.querySelector('.total_price').innerHTML = totalPrice.toLocaleString('ko-KR') + '<b>원</b>';
        document.querySelector('input[name="total_price"]').value = totalPrice;  // 이 부분을 추가
        
        document.querySelector('.end_price').style.display = 'block'; // 총 합계 금액을 바로 표시
    }

    document.addEventListener('DOMContentLoaded', function() {
        updateTotalPrice(); // 페이지 로드 시 초기 가격 업데이트
        // 기타 탭 전환 및 옵션 선택 로직
    });

function selectOption(option) {
    var text = option.textContent;
    var value = option.getAttribute('data-value');
    var selectElement = document.querySelector('select[name="optionSnoInput"]');
    
    selectElement.value = value;
    document.querySelector('.custom-select-display .current-option').textContent = text;
    toggleDropdown();
    updateTotalPrice(); // 가격 업데이트
}

// 탭 전환 및 옵션 선택 리스너 설정
document.addEventListener('DOMContentLoaded', function() {
    // 탭 전환 로직 유지
    var tabs = document.querySelectorAll('.tabs li');
    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelectorAll('.tab-content').forEach(content => {
                content.style.display = content.id === tab.getAttribute('data-tab') ? 'block' : 'none';
            });
            tabs.forEach(t => t.classList.remove('current'));
            tab.classList.add('current');
        });
    });

    // 옵션 선택 로직 유지
    document.querySelectorAll('.custom-option').forEach(option => {
        option.addEventListener('click', () => selectOption(option));
    });

    // 초기 가격 설정 및 가격 표시 요소 바로 표시하기
    updateTotalPrice(); // 초기 가격 업데이트
    document.querySelector('.end_price').style.display = 'block'; // 총 가격 표시 요소 바로 표시
});

function goToQuestionDetail(questionId) {
    var rootPath = document.querySelector('.root-path').textContent; // '.root-path' 클래스를 가진 요소에서 루트 경로를 가져옵니다.
    window.location.href = `${rootPath}/product/read?questionid=${questionId}`;
}

function checkStockBeforePurchase() {
    // 상품의 재고 수량을 변수로 가져옵니다.
    var stock = parseInt("${product.stock}", 10); // ${product.stock} 부분은 서버 사이드 템플릿에서 실제 재고 수량으로 대체됩니다.

    // 재고가 0일 경우
    if (stock === 0) {
        // 사용자에게 메시지를 표시합니다.
        alert("현재 재고가 없어 주문 처리가 오래 걸릴 수 있습니다. 그래도 주문하시겠습니까?");
        // 추가 로직 필요 시 여기에 작성
    } else {
        // 재고가 있는 경우 폼 제출
        document.getElementById("frmView").submit();
    }
}

// 폼 제출 방지 기본 동작
document.getElementById("frmView").addEventListener("submit", function(event){
    event.preventDefault(); // 폼의 기본 제출 동작을 방지
    checkStockBeforePurchase(); // 재고 확인 함수 호출
});
