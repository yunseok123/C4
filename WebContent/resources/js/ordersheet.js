  
  window.onload = function() {
    // 팝업 창을 표시합니다.
    alert("선수 마킹 체크해주신 분들은 꼭 배송 메모에 선수 이름과 등번호를 꼭 적어주시길 바랍니다.");
}

function showPopup() {
    alert("선수 마킹 체크해주신 분들은 꼭 배송 메모에 선수 이름과 등번호를 꼭 적어주시길 바랍니다.");
}
  
    function searchPostalCode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('postalCodeInput').value = data.zonecode;
                    document.getElementById('roadAddressInput').value = data.roadAddress;
                }
            }).open();
        }

        function updateAmountInput() {
            var finalPriceElement2 = document.getElementById('finalPrice2');
            var amountInput = document.getElementById('amount');
            if (finalPriceElement2 && amountInput) {
                var finalPrice = finalPriceElement2.innerText.replace(/[^0-9]/g, '');
                amountInput.value = finalPrice;
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            var urlParams = new URLSearchParams(window.location.search);
            var totalPrice = urlParams.get('totalPrice'); // totalPrice 파라미터 읽기

            var finalPriceElement = document.getElementById('finalPrice');
            var subtotalPriceElement = document.getElementById('subtotalPrice');
            var finalPriceHidden = document.getElementById('finalPriceHidden');

            if (totalPrice) {
                finalPriceElement.innerText = totalPrice + '원';
                subtotalPriceElement.innerText = totalPrice + '원';
                finalPriceHidden.value = totalPrice;
            }

            updateAmountInput();

            var orderForm = document.querySelector('form[modelAttribute="order"]');
            orderForm.addEventListener('submit', function(e) {
                var postalCodeInput = document.getElementById('postalCodeInput');
                var roadAddressInput = document.getElementById('roadAddressInput');
                
                if (!postalCodeInput.value || !roadAddressInput.value) {
                    e.preventDefault(); // 폼 제출을 중단합니다.
                    alert('필수 정보를 입력해주세요.'); // 사용자에게 경고를 표시합니다.
                    return false; // 함수 실행을 중단합니다.
                }
            });
        });