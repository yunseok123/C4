var seatCategoryButtons; // 전역 변수로 선언
var selectedSeatsByCategory = {};
var isSeatSelectionValid = false;

window.onload = function() {
   // 초기 화면 설정
   document.getElementById('seatSelectionArea').style.display = 'block';
   document.getElementById('step2-container').style.display = 'none';
   document.getElementById('step3-container').style.display = 'none';
   document.getElementById('step4-container').style.display = 'none';
};

document.addEventListener('DOMContentLoaded', function() {
    seatCategoryButtons = document.querySelectorAll('.seat-category-button');
    var seatCheckboxes = document.querySelectorAll('.seat-checkbox');
    var seatLabels = document.querySelectorAll('.seat-checkbox + label'); // 라벨 선택

    seatCategoryButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var category = this.textContent;
            var allSeatCheckboxes = document.querySelectorAll('.seat-checkbox');
            var matchingSeatCheckboxes = document.querySelectorAll('.seat-checkbox[data-category="' + category + '"]');

            // First, hide all seat checkboxes and labels
            allSeatCheckboxes.forEach(function(seatCheckbox) {
                seatCheckbox.style.display = 'none';
                // Also hide the corresponding label by using the ID of the checkbox to select the label
                var label = document.querySelector('label[for="' + seatCheckbox.id + '"]');
                if (label) {
                    label.style.display = 'none';
                }
            });

            // Then, only display checkboxes and labels that match the selected category
            matchingSeatCheckboxes.forEach(function(seatCheckbox) {
                seatCheckbox.style.display = 'block';
                // Display the corresponding label
                var label = document.querySelector('label[for="' + seatCheckbox.id + '"]');
                if (label) {
                    label.style.display = 'block';
                }
            });
        });
    });


   seatCheckboxes.forEach(seatCheckbox => {
      seatCheckbox.addEventListener('change', function() {
         const category = this.getAttribute('data-category');
         const location = this.getAttribute('data-location');

         if (this.checked) {
            // 선택한 경우 선택된 좌석 정보를 추가
            if (!selectedSeatsByCategory[category]) {
               selectedSeatsByCategory[category] = [];
            }
            selectedSeatsByCategory[category].push(location);
         } else {
            // 선택 취소된 경우 선택된 좌석 정보를 제거
            const index = selectedSeatsByCategory[category].indexOf(location);
            if (index !== -1) {
               selectedSeatsByCategory[category].splice(index, 1);
            }
         }

         updateSeatCount(category, selectedSeatsByCategory[category].length);
      });
   });


   document.getElementById('submitSeatSelection').addEventListener('click', function() {
      // 선택된 좌석이 있는지 확인
      var selectedSeatsCount = document.querySelectorAll('.seat-checkbox:checked').length;
	  var selectedSeatsList = getSelectedSeatsList().join(',');
      // 선택된 좌석이 없으면 사용자에게 알림을 주고 함수 실행을 중단
      if (selectedSeatsCount === 0) {
         alert('최소 한 개 이상의 좌석을 선택해주세요.');
         isSeatSelectionValid = false; // 유효성 검사 실패
      } else {
         submitSeatSelectionAndUpdatePriceTable();
         isSeatSelectionValid = true;
      }
   });


   seatCheckboxes.forEach(seat => {
      seat.addEventListener('click', function() {
         const category = this.getAttribute('data-category');
         this.classList.toggle('selected');
         updateSeatCount(category, this.classList.contains('selected'));
      });
   });

   // 다음으로 버튼을 눌렀을 때 step3 보이도록 추가
   document.getElementById('next-to-step2').addEventListener('click', function() {
      if (!isSeatSelectionValid) {
         alert('먼저 좌석을 확정해주세요.');
         return; // 유효성 검사를 통과하지 않았다면 여기서 함수 실행 중단
      }
      // 페이지 이동 로직
      document.getElementById('seatSelectionArea').style.display = 'none';
      document.getElementById('step2-container').style.display = 'block';

      // 현재 활성화된 단계 버튼의 스타일 변경
      var currentStepButton = document.querySelector('.process-steps button.selected');
      currentStepButton.classList.remove('selected');
      document.getElementById('step2-button').classList.add('selected');

   });
   document.getElementById('next-to-step3').addEventListener('click', function() {
      // step2-container 숨기기
      document.getElementById('step2-container').style.display = 'none';

      // step3-container 표시하기
      document.getElementById('step3-container').style.display = 'block';

      // 활성화된 단계 버튼의 스타일 변경
      var currentStepButton = document.querySelector('.process-steps button.selected');
      currentStepButton.classList.remove('selected');
      document.getElementById('step3-button').classList.add('selected');
   });

   document.querySelector('.reset-selection-button').addEventListener('click', function() {
      // 좌석 선택 초기화 및 모든 체크박스 선택 해제
      resetSeatSelection();
      resetCheckboxSelection();
      resetTotalPrice();
   });

   function resetCheckboxSelection() {
      // 모든 체크박스 선택 해제
      document.querySelectorAll('.seat-checkbox').forEach(function(checkbox) {
         checkbox.checked = false;
      });
   }

   function resetTotalPrice() {
      // 현재 금액을 0으로 초기화
      document.getElementById('currentAmount').textContent = '0';
   }


   function validateForm() {
      var userName = document.getElementById('userName').value.trim();
      var userBirthdate = document.getElementById('userBirthdate').value.trim();
      var userPhone = document.getElementById('userPhone').value.trim();
      var userEmail = document.getElementById('userEmail').value.trim();

      if (!userName) {
         alert('이름을 입력하세요.');
         return false;
      }
      if (!userBirthdate) {
         alert('생년월일을 입력하세요.');
         return false;
      }
      if (!userPhone) {
         alert('전화번호를 입력하세요.');
         return false;
      }
      if (!userEmail) {
         alert('이메일 주소를 입력하세요.');
         return false;
      }
      // 모든 검사를 통과한 경우
      return true;
   }

document.getElementById('next-to-step4').addEventListener('click', function() {
   // 유효성 검사를 수행하고, 모든 필드가 유효한 경우에만 실행
   if (validateForm()) {
      // 유효성 검사를 통과한 후의 데이터를 다시 가져옴
      var userName = document.getElementById('userName').value.trim();
      var userBirthdate = document.getElementById('userBirthdate').value.trim();
      var userPhone = document.getElementById('userPhone').value.trim();
      var userEmail = document.getElementById('userEmail').value.trim();

      // 선택된 좌석 정보 가져오기
      var selectedSeatsInfo = getSelectedSeatsInfo();
      var selectedSeatsList = getSelectedSeatsList(); // 이 부분을 수정하여 함수를 호출

      // 선택된 좌석 정보를 input 요소에 설정
      document.getElementById('step4UserName').value = userName;
      document.getElementById('step4UserBirthdate').value = userBirthdate;
      document.getElementById('step4UserPhone').value = userPhone;
      document.getElementById('step4UserEmail').value = userEmail;
      document.getElementById('seat').value = selectedSeatsInfo;
      document.getElementById('selectedSeatsList').value = selectedSeatsList.join(', '); // 수정된 부분

      // 다음 단계(Step 4)로의 UI 변경
      document.getElementById('step3-container').style.display = 'none';
      document.getElementById('step4-container').style.display = 'block';

      // 단계 버튼의 활성화 상태를 업데이트
      document.querySelectorAll('.process-steps button').forEach(function(button) {
         button.classList.remove('selected');
      });
      document.getElementById('step4-button').classList.add('selected');
   }
});


   function getSelectedSeatsInfo() {
      var selectedSeatsInfo = '';
      for (var category in selectedSeatsByCategory) {
         selectedSeatsInfo += category + ': ' + selectedSeatsByCategory[category].join(', ') + ', ';
      }
      // 마지막 쉼표와 공백 제거
      selectedSeatsInfo = selectedSeatsInfo.slice(0, -2);
      return selectedSeatsInfo;
   }
   function getSelectedSeatsList() {
   var selectedSeatsList = [];
   for (var category in selectedSeatsByCategory) {
      selectedSeatsList = selectedSeatsList.concat(selectedSeatsByCategory[category]);
   }
   return selectedSeatsList;
}

   


});

function submitSeatSelectionAndUpdatePriceTable() {
   var gameId = document.getElementById('gameId').value;

   // 클라이언트 측에서 JSON 데이터 생성
   var seatSelections = {};

   // 각 카테고리별 선택된 좌석 수를 수집
   seatCategoryButtons.forEach(function(button) {
      var category = button.textContent;
      var selectedSeats = document.querySelectorAll('.seat-checkbox[data-category="' + category + '"]:checked');

      // 해당 카테고리의 선택된 좌석 수를 seatSelections 객체에 추가
      var selectedCount = selectedSeats.length;
      if (selectedCount > 0) {
         seatSelections[category] = selectedCount;
      }
   });

   var requestData = {
      "seatSelections": seatSelections, // 각 카테고리별 선택한 좌석 수를 전송
      "gameId": gameId
   };

   // 서버로 요청을 보냄
   fetch('/finalProject//ticket/calculate-total-price', {
      method: 'POST',
      headers: {
         'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestData),
   })
      .then(response => {
         if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
         }
         return response.json();
      })
      .then(data => {
         // 가격 표 업데이트
         updatePriceTable(data, seatCategoryButtons); // seatCategoryButtons 배열 추가
         document.getElementById('amount').value = data.totalPrice;
         document.getElementById('currentAmount').textContent = data.totalPrice.toLocaleString();
         alert("확정 완료");
      })
      .catch(error => console.error('Error:', error));
}


function collectSelectedSeats() {
   var seats = document.querySelectorAll('.seat.selected');
   var seatCounts = {};

   seats.forEach(seat => {
      var category = seat.getAttribute('data-category');
      var seatInfo = {
         category: category,
         price: parseFloat(seat.getAttribute('data-price'))
      };

      if (seatCounts[category]) {
         seatCounts[category].count++;
      } else {
         seatCounts[category] = {
            count: 1
         };
      }
   });

   return seatCounts;
}


function updateSeatCount(category, isSelected) {
   let selectedSeatsDiv = document.querySelector('.selected-seats');
   let existingSpan = selectedSeatsDiv.querySelector(`[data-seat-type="${category}"]`);
   if (isSelected) {
      if (!existingSpan) {
         let newSpan = document.createElement('span');
         newSpan.setAttribute('data-seat-type', category);
         newSpan.textContent = `${category}: 1`;
         selectedSeatsDiv.appendChild(newSpan);
      } else {
         let currentCount = parseInt(existingSpan.textContent.split(': ')[1]);
         existingSpan.textContent = `${category}: ${currentCount + 1}`;
      }
   } else {
      if (existingSpan) {
         let currentCount = parseInt(existingSpan.textContent.split(': ')[1]);
         if (currentCount - 1 == 0) {
            selectedSeatsDiv.removeChild(existingSpan);
         } else {
            existingSpan.textContent = `${category}: ${currentCount - 1}`;
         }
      }
   }
}

function updatePriceTable(data) {
   console.log('Updating price table with data:', data);

   var priceTableContainer = document.getElementById('price-table-container');
   if (priceTableContainer) {
      var priceHTML = `
            <table>
                <tr>
                    <th>카테고리</th>
                    <th>선택 수</th>
                    <th>가격</th>
                </tr>
        `;

      // 각 카테고리 및 선택된 좌석 수 및 가격을 반복해서 표시
      for (var category in data.seatCounts) {
         var selectedCount = data.seatCounts[category];
         var price = data.categories[category];

         priceHTML += `
                <tr>
                    <td>${category}</td>
                    <td>${selectedCount}</td>
                    <td>${(price).toLocaleString()}원</td>
                </tr>
            `;
      }

      var totalPrice = data.totalPrice;

      // 총 가격 표시 행 추가
      priceHTML += `
                <tr>
                    <td><strong>총 가격</strong></td>
                    <td></td>
                    <td><strong>${(totalPrice).toLocaleString()}원</strong></td>
                </tr>
            </table>
        `;

      priceTableContainer.innerHTML = priceHTML;

      // 2. 이동 단계 버튼 색상 변경 문제 해결
      // 현재 활성화된 단계 버튼에 "selected" 클래스 추가
      var stepButtons = document.querySelectorAll('.process-steps button');
      stepButtons.forEach(function(button) {
         button.classList.remove('selected');
      });

      var activeStepButtonId = 'step2-button'; // 현재 활성화된 단계 버튼의 ID를 지정
      document.getElementById(activeStepButtonId).classList.add('selected');
   } else {
      console.error('Price table container not found');
   }
}