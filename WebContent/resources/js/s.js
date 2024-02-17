  function searchPostalCode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 우편번호와 주소 정보를 입력 필드에 설정
                    document.getElementById('postalCodeInput').value = data.zonecode;
                    document.getElementById('roadAddressInput').value = data.roadAddress;
                }
            }).open();
        }
        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            var totalAmount = urlParams.get('totalAmount');
            var subtotalPrice = urlParams.get('subtotalPrice');


            var finalPriceElement = document.getElementById('finalPrice'); 
            var subtotalPriceElement = document.getElementById('subtotalPrice'); 

            if (totalAmount && finalPriceElement) {
                finalPriceElement.innerText = totalAmount;
            }

            if (subtotalPrice && subtotalPriceElement) {
                subtotalPriceElement.innerText = subtotalPrice;
            }
        }
