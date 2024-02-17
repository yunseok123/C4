<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>Calendar</title>
    <link rel="stylesheet" href="${root }/css/calendar.css">
    <script defer src="calendar.js"></script>
    <!-- Include other CSS files as needed -->
</head>
<body>


<div class="calendar">
    <!-- Calendar Left -->
    <div class="calendar_left">
        <div class="calendar_header">
            <img src="${root }/img/before.svg" id="prevMonth" alt="Previous Month">
            <div style="display: block; width: 200px;">
            	<div id="currentYear" class="month_before_present">Year</div>
           		<div id="currentMonth" class="month_before_present">Month</div>
            </div>
            <img src="${root }/img/next.svg" id="nextMonth" alt="Previous Month">

            <!-- <i class="material-icons" id="nextMonth">navigate_next</i> -->
        </div>
        <div class="calendar_days"></div>
        <div class="calendar_dates"></div>
    </div>

    <!-- Calendar Right -->
    <div class="calendar_right">
        <div class="list">
            <ul id="eventList"></ul>
        </div>
        <form id="addEventForm">
            <div id="eventDescription">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Made By C4</div>
            <div>
            <select id="Select_team">
            	<option value="Team_ALL">전체 보기</option>
                <option value="Team_KT">KT</option>
                <option value="Team_KIA">KIA</option>
            </select>
            </div>
<!--             <button type="submit">Add Event</button> -->
        </form>
    </div>
</div>



<script>
	//날짜값 불러오기 
    document.addEventListener('DOMContentLoaded', function() {
        const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        

        const daysContainer = document.querySelector('.calendar_days');
        const datesContainer = document.querySelector('.calendar_dates');
        const currentMonthElement = document.getElementById('currentMonth');
        const currentYearElement = document.getElementById('currentYear');
        const eventList = document.getElementById('eventList');
        let currentMonth = new Date().getMonth();
        let currentYear = new Date().getFullYear();
    
        function generateCalendar(month, year) {
            // Clear previous dates
            datesContainer.innerHTML = '';
            daysContainer.innerHTML = '';
    
            // Set current month calendar_header

			currentMonthElement.textContent = monthNames[currentMonth];
			currentYearElement.textContent = currentYear;
            // Generate days of the week
            const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            daysOfWeek.forEach(day => {
                const dayElement = document.createElement('div');
                dayElement.className = 'day_item';
                dayElement.textContent = day;
                daysContainer.appendChild(dayElement);
            });
    
            // Find the first day of the month
            let firstDay = new Date(year, month).getDay();
    
            // Optionally, add placeholders for days before the first day of the month
            for (let i = 0; i < firstDay; i++) {
                const placeholder = document.createElement('div');
                placeholder.className = 'date_item'; // Use the same class but keep it empty or style differently
                datesContainer.appendChild(placeholder);
            }
    
            // 1달에 며칠 있는지
            let daysInMonth = new Date(year, month + 1, 0).getDate(); //30,31,28
    
            // Generate the dates of the month
            for (let i = 1; i <= daysInMonth; i++) {
                const dateElement = document.createElement('div');
                dateElement.className = 'date_item';
                
                
                // data-data에 해당 날자값 넣기
                const formattedDate = year+ "-" +String(month + 1).padStart(2, '0')+"-"+i;
                dateElement.setAttribute('data-date', formattedDate);

                
                dateElement.textContent = i;
                dateElement.addEventListener('click', function() {
                    // Remove the 'present' class from all date items
                    const allDateItems = document.querySelectorAll('.date_item');
                    allDateItems.forEach(item => {
                        item.classList.remove('present');
                    });
                    eventList.innerHTML = ''
                    dateElement.classList.add('present');
                
                
                
                const clickedDate = dateElement.getAttribute('data-date');
                let matchFound = false;
                document.querySelectorAll('.date_item').forEach(function(dateElement) {
                    dateElement.addEventListener('click', function() {
                        const clickedDate = dateElement.getAttribute('data-date');
                        eventList.innerHTML = ''; // Clear existing events list
                        let matchFound = false;

                        // Iterate over each .game_Schedule to find a matching date
                        document.querySelectorAll('.game_Schedule').forEach(function(schedule) {
                            // Assume .date_Schedule contains a span with the actual date
                            const scheduleDate = schedule.querySelector('.date_Schedule span').textContent.trim();

                            if (scheduleDate === clickedDate) {
                                matchFound = true;
/*   schedule.style.backgroundColor = 'red'; */
                                
                                // Assuming team names are within .team-names span
                                const homeTeamName = schedule.querySelector('.team-names span:nth-child(1)').textContent;
                                const awayTeamName = schedule.querySelector('.team-names span:nth-child(3)').textContent;

                                // Create and add the event element to the list
                                const eventElement = document.createElement('li');
                                eventElement.textContent = homeTeamName +" VS " + awayTeamName;
                                eventList.appendChild(eventElement);
                            } else {
                                // Optionally reset non-matching items' background
                                schedule.style.backgroundColor = ''; // Reset to default or another color
                            }
                        });

                        if (!matchFound) {
                            // If no matches were found, display a message indicating so
                            const noEventElement = document.createElement('li');
                            noEventElement.textContent = "경기 일정이 없습니다.";
                            eventList.appendChild(noEventElement);
                        }
                    });
                });


                });
                
                
                datesContainer.appendChild(dateElement);
            }


        }
    
        function nextMonth() {
            if (currentMonth === 11) {
                currentMonth = 0;
                currentYear += 1;
            } else {
                currentMonth += 1;
            }
            generateCalendar(currentMonth, currentYear);
        }
    
        function prevMonth() {
            if (currentMonth === 0) {
                currentMonth = 11;
                currentYear -= 1;
            } else {
                currentMonth -= 1;
            }
            generateCalendar(currentMonth, currentYear);
        }
            //month 클릭시  흰 원 칠해지기
        function switch_month() {
            const currentMonthElement = document.getElementById('currentMonth');
            if (currentMonthElement.classList.contains('month_before_present')) {
                currentMonthElement.classList.remove('month_before_present');
                currentMonthElement.classList.add('month_after_present');
            } else {
                currentMonthElement.classList.remove('month_after_present');
                currentMonthElement.classList.add('month_before_present');
            }
        }
        
        document.getElementById('currentMonth').addEventListener('click', switch_month);

        document.getElementById('prevMonth').addEventListener('click', prevMonth);
        document.getElementById('nextMonth').addEventListener('click', nextMonth);
        

        // Initialize the calendar
        generateCalendar(currentMonth, currentYear);
        
        


    });
    
</script>


</body>
</html>
