// 모달 가져오기
var modal = document.getElementById("optionModal");

// 옵션/수량 변경 버튼 가져오기
var btns = document.getElementsByClassName("quantity-button");

// URL에서 파라미터 값을 가져오는 함수
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

// 파라미터에서 상품 가격과 선택된 사이즈 가져오기
var productPrice = parseInt(getParameterByName('total_price'), 10);
var selectedSize = getParameterByName('productSize');

// 각 버튼에 대해 클릭 이벤트 리스너 추가
Array.from(btns).forEach(function(btn) {
    btn.onclick = function() {
        modal.style.display = "block";
    };
});

// '취소' 버튼 클릭시 모달 닫기
var resetBtn = document.getElementsByClassName("reset-btn")[0];
resetBtn.onclick = function() {
    modal.style.display = "none";
};

// 모달 밖을 클릭하면 모달 닫기
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};
document.addEventListener('DOMContentLoaded', function() {
    // '전체 상품 주문' 버튼 클릭 이벤트
    var orderButton = document.querySelector('.order-button');
    if (orderButton) {
        orderButton.addEventListener('click', function(event) {
            // 디폴트 값 설정
            var defaultQuantity = 1; // 디폴트 수량
            var defaultTotalPrice = document.getElementById('finalPrice1').textContent.replace(/[^0-9]/g, ""); // 화면에 표시된 합계 금액

            // hidden input 필드에 값 설정
            document.getElementById('hiddenQuantity').value = updatedQuantity;
            document.getElementById('hiddenTotalPrice').value = defaultTotalPrice;

            // 선택된 사이즈가 없는 경우, '사이즈없음'으로 설정
            var sizeInput = document.getElementById('hiddenProductSize');
            if (!sizeInput.value) {
                sizeInput.value = '사이즈없음';
            }

            // 폼 제출 로직 필요 없음 (기본 동작 사용)
        });
    }
});

// 페이지 로드 시 실행되는 함수
document.addEventListener('DOMContentLoaded', function() {



    var quantityInput = document.getElementById('quantity');
    var sizeSelect = document.getElementById('size');

    // 사이즈 선택 옵션 처리
    updateSizeOptionDisplay(selectedSize);

    // 모달 열기
    Array.from(btns).forEach(function(button) {
        button.addEventListener('click', function() {
            modal.style.display = "block";
        });
    });
    
    

    // 수량 조절
    document.querySelector('.quantity-btn.up').addEventListener('click', function() { changeQuantity(true); });
    document.querySelector('.quantity-btn.down').addEventListener('click', function() { changeQuantity(false); });

    // '확인' 버튼 클릭 이벤트
   document.querySelector('.submit-btn').addEventListener('click', function(event) {
    var size = selectedSize !== '사이즈없음' ? document.getElementById('size').value : '사이즈없음';
    var quantity = parseInt(document.getElementById('quantity').value);
    var totalPrice = productPrice * quantity;

    // 사이즈 및 수량 정보, 가격을 업데이트
    updateSizeAndQuantityInfo(size, quantity, totalPrice);

    modal.style.display = "none";
    event.preventDefault(); // 폼의 기본 제출 동작 방지
});

});

function updateSizeAndQuantityInfo(size, quantity, totalPrice) {
    // '사이즈없음'인 경우 사이즈 표시를 업데이트하지 않음
    if(size !== '사이즈없음') {
        document.getElementById('productSize1').textContent = '사이즈: ' + size;
    }
    document.querySelector('.product-quantity p').textContent = quantity;
    document.getElementById('subtotalPrice1').textContent = totalPrice.toLocaleString() + "원";
    document.getElementById('finalPrice1').textContent = totalPrice.toLocaleString() + "원";
    document.getElementById('subtotalPrice2').textContent = totalPrice.toLocaleString() + "원";
    document.getElementById('finalPrice2').textContent = totalPrice.toLocaleString() + "원";

    document.getElementById('hiddenProductSize').value = size;
    document.getElementById('hiddenQuantity').value = quantity;
    document.getElementById('hiddenTotalPrice').value = totalPrice;
}
function changeQuantity(increase) {
    var quantityInput = document.getElementById('quantity');
    var currentValue = parseInt(quantityInput.value, 10);
    var newValue = increase ? currentValue + 1 : currentValue - 1;
    newValue = Math.max(1, newValue); // 최소 값은 1
    quantityInput.value = newValue;
    updatePriceDisplay(newValue);
}

function updatePriceDisplay(quantity) {
    var totalPrice = productPrice * quantity;
    document.querySelector('.modal .price-row .price').textContent = totalPrice.toLocaleString() + "원";
}

function updateSizeOptionDisplay(selectedSize) {
    var sizeSelectContainer = document.querySelector('.select-container');
    var sizeLabel = document.querySelector('.form-row label[for="size"]');
    if(selectedSize === '사이즈없음') {
        if(sizeSelectContainer) sizeSelectContainer.style.display = 'none';
        if(sizeLabel) sizeLabel.style.display = 'none';
        document.getElementById('size').disabled = true;
    } else {
        if(sizeSelectContainer) sizeSelectContainer.style.display = '';
        if(sizeLabel) sizeLabel.style.display = '';
        document.getElementById('size').disabled = false;
    }
}
function changeQuantity(increase) {
    var quantityInput = document.getElementById('quantity');
    var currentValue = parseInt(quantityInput.value, 10);
    var newValue = increase ? currentValue + 1 : currentValue - 1;
    newValue = Math.max(1, newValue); // 최소 값은 1
    quantityInput.value = newValue;
    updatePriceDisplay(newValue);
    updateTotalProductsLabel(newValue); // "총 N개의 상품" 텍스트 업데이트
}

function updateTotalProductsLabel(quantity) {
    var totalProductsLabel = document.getElementById('totalProductsLabel');
    if (totalProductsLabel) {
        totalProductsLabel.textContent = `총 ${quantity}개의 상품`;
    }
}