// displaySchedule 함수 호출하여 일정 표시
displaySchedule();
 
 // 예메하기 버튼 클릭 이벤트
        document.getElementById('reserve-button').addEventListener('click', function() {
            var scheduleContainer = document.getElementById('schedule-container');
            var discountContainer = document.getElementById('discount-container');
            var SeatContainer =document.getElementById('Seat-Container');
            var calendarContainer = document.getElementById('calendar-container');
            var currentDate = document.getElementById('current-date'); // 현재 날짜 요소
            
            if (scheduleContainer.style.display === "none") {
                scheduleContainer.style.display = "flex";
                discountContainer.style.display = "none"; // 요금/할인 섹션 숨기기
                SeatContainer.style.display = "none"; // 요금/할인 섹션 숨기기
                calendarContainer.style.display = "none";
                currentDate.style.display = "none"; // 날짜 요소도 숨김
            } else {
                scheduleContainer.style.display = "none";
            }
        });

        // 요금/할인 버튼 클릭 이벤트
        document.getElementById('discount-button').addEventListener('click', function() {
            var scheduleContainer = document.getElementById('schedule-container');
            var discountContainer = document.getElementById('discount-container');
            var SeatContainer =document.getElementById('Seat-Container');
            var calendarContainer = document.getElementById('calendar-container');
            var currentDate = document.getElementById('current-date'); // 현재 날짜 요소
            
            if (discountContainer.style.display === "none") {
                discountContainer.style.display = "block";
                scheduleContainer.style.display = "none"; // 예메하기 섹션 숨기기
                SeatContainer.style.display = "none"; // 요금/할인 섹션 숨기기
                calendarContainer.style.display = "none";
                currentDate.style.display = "none"; // 날짜 요소도 숨김
            } else {
                discountContainer.style.display = "none";
            }
        });
        
           document.getElementById('Seat-button').addEventListener('click', function() {
            var scheduleContainer = document.getElementById('schedule-container');
            var discountContainer = document.getElementById('discount-container');
            var SeatContainer =document.getElementById('Seat-Container');
            var calendarContainer = document.getElementById('calendar-container');
            var currentDate = document.getElementById('current-date'); // 현재 날짜 요소
            
            if (SeatContainer.style.display === "none") {
                discountContainer.style.display = "none";
                scheduleContainer.style.display = "none"; // 예메하기 섹션 숨기기
                SeatContainer.style.display = "block"; // 요금/할인 섹션 숨기기
                calendarContainer.style.display = "none";
                currentDate.style.display = "none"; // 날짜 요소도 숨김
            } else {
                SeatContainer.style.display = "none";
            }
        });
           
        // 경기일정 버튼 클릭 이벤트
           document.getElementById('calendar-button').addEventListener('click', function() {
               var calendarContainer = document.getElementById('calendar-container');
               var currentDate = document.getElementById('current-date'); // 현재 날짜 요소
               var scheduleContainer = document.getElementById('schedule-container');
               var discountContainer = document.getElementById('discount-container');
               var SeatContainer = document.getElementById('Seat-Container');

               if (calendarContainer.style.display === "none") {
                   calendarContainer.style.display = "block";
                   currentDate.style.display = "block"; // 날짜 요소도 보이게 설정
                   scheduleContainer.style.display = "none"; // 예매하기 섹션 숨기기
                   discountContainer.style.display = "none"; // 할인표 섹션 숨기기
                   SeatContainer.style.display = "none"; // 좌석도 섹션 숨기기
               } else {
                   calendarContainer.style.display = "none";
                   currentDate.style.display = "none"; // 날짜 요소도 숨김
               }
           });
        
         document.getElementById('reserve').addEventListener('click', function() {
        // 페이지를 'reservation.html'로 이동
        window.location.href = 'reservation';
    });


var currentDate = document.getElementById('current-date');
        var calendarBody = document.getElementById('calendar-body');

        // 1월, 2월, 3월 달력 데이터
        var calendars = {
                "1월": `
                   <tr>
               <td></td>
               <td class="">1</td>
               <td class="">2</td>
               <td class="">3</td>
               <td class="">4</td>
               <td class="">5</td>
               <td class="saturday">6</td>
            </tr>
            <tr>
               <td class="sunday">7</td>
               <td class="">8</td>
               <td class="">9</td>
               <td class="">10</td>
               <td class="">11</td>
               <td class="">12</td>
               <td class="saturday">13</td>
            </tr>
            <tr>
               <td class="sunday">14</td>
               <td class="">15</td>
               <td class="">16</td>
               <td class="">17</td>
               <td class="">18</td>
               <td class="">19</td>
               <td class="saturday">20</td>
            </tr>
            <tr>
               <td class="sunday">21</td>
               <td class="">22</td>
               <td class="">23</td>
               <td class="">24</td>
               <td class="">25</td>
               <td class="">26</td>
               <td class="saturday">27</td>
            </tr>
            <tr>
               <td class="sunday">28</td>
               <td class="">29</td>
               <td class="">30</td>
               <td class="">31</td>
               <td></td>
               <td></td>
               <td></td>
            </tr>`,
                "2월": `
                   <tr>
               <td></td>
               <td class=""></td>
               <td class=""></td>
               <td class=""></td>
               <td class="">1</td>
               <td class="">2</td>
               <td class="saturday">3</td>
            </tr>
            <tr>
               <td class="sunday">4</td>
               <td class="">5</td>
               <td class="">6</td>
               <td class="">7</td>
               <td class="">8</td>
               <td class="">9</td>
               <td class="saturday">10</td>
            </tr>
            <tr>
               <td class="sunday">11</td>
               <td class="">12</td>
               <td class="">13</td>
               <td class="">14</td>
               <td class="">15</td>
               <td class="">16</td>
               <td class="saturday">17</td>
            </tr>
            <tr>
               <td class="sunday">18</td>
               <td class="">19</td>
               <td class="">20</td>
               <td class="">21</td>
               <td class="">22</td>
               <td class="">23</td>
               <td class="saturday">24</td>
            </tr>
            <tr>
               <td class="sunday">25</td>
               <td class="">26</td>
               <td class="">27</td>
               <td class="">28</td>
               <td class="">29</td>
               <td></td>
               <td></td>
            </tr>`,
                "3월": `
                   <tr>
               <td></td>
               <td class=""></td>
               <td class=""></td>
               <td class=""></td>
               <td class=""></td>
               <td class="">1</td>
               <td class="saturday">2</td>
            </tr>
            <tr>
               <td class="sunday">3</td>
               <td class="">4</td>
               <td class="">5</td>
               <td class="">6</td>
               <td class="">7</td>
               <td class="">8</td>
               <td class="saturday">9</td>
            </tr>
            <tr>
               <td class="sunday">10</td>
               <td class="">11</td>
               <td class="">12</td>
               <td class="">13</td>
               <td class="">14</td>
               <td class="">15</td>
               <td class="saturday">16</td>
            </tr>
            <tr>
               <td class="sunday">17</td>
               <td class="">18</td>
               <td class="">19</td>
               <td class="">20</td>
               <td class="">21</td>
               <td class="">22</td>
               <td class="saturday">23</td>
            </tr>
            <tr>
               <td class="sunday">24</td>
               <td class="">25</td>
               <td class="">26</td>
               <td class="">27</td>
               <td class="">28</td>
               <td class="">29</td>
               <td class="saturday">30</td>
            </tr>
            <tr>
               <td class="sunday">31</td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>`
            };

        var months = ["1월", "2월", "3월"];
        var currentMonthIndex = 0;
        
        function updateCalendar() {
            var month = months[currentMonthIndex];
            document.getElementById('month-display').textContent = `2024년 ${month}`; // 날짜 표시 부분만 업데이트
            calendarBody.innerHTML = calendars[month];
        }

        document.getElementById('prev-month').addEventListener('click', function() {
            if (currentMonthIndex > 0) {
                currentMonthIndex--;
                updateCalendar();
            }
        });

        document.getElementById('next-month').addEventListener('click', function() {
            if (currentMonthIndex < months.length - 1) {
                currentMonthIndex++;
                updateCalendar();
            }
        });

        updateCalendar();