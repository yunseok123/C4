<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">경기 등록</h2>

    <form action="${root}/admin/insertGame" method="post"> 
        <div class="form-group">
            <label for="name">경기일:</label>
            <div class="input-group date" id="datepicker" data-target-input="nearest">
                <input type="text" class="form-control datetimepicker-input" data-target="#datepicker" name="gameDate"/>
                <div class="input-group-append" data-target="#datepicker" data-toggle="datepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="price">시작시간:</label>
            <div class="input-group bootstrap-timepicker timepicker">
                <input type="text" class="form-control input-small" id="timepicker" name="startTime"/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
            </div>
        </div>
        
        <div class="form-group">
            <label for="team">홈팀:</label>
            <select class="form-control" id="HOMETEAM_ID" name="HOMETEAM_ID">
                <option value="1">LG</option>
                <option value="2">KT</option>
                <option value="3">NC</option>
                <option value="4">SSG</option>
                <option value="5">DOOSAN</option>
                <option value="6">KIA</option>
                <option value="7">LOTTE</option>
                <option value="8">SAMSUNG</option>
                <option value="9">HANWHA</option>
                <option value="10">KIMWOOM</option>
            </select>
        </div>
        <div class="form-group">
            <label for="team">어웨이팀:</label>
            <select class="form-control" id="AWAYTEAM_ID" name="AWAYTEAM_ID">
                <option value="1">LG</option>
                <option value="2">KT</option>
                <option value="3">NC</option>
                <option value="4">SSG</option>
                <option value="5">DOOSAN</option>
                <option value="6">KIA</option>
                <option value="7">LOTTE</option>
                <option value="8">SAMSUNG</option>
                <option value="9">HANWHA</option>
                <option value="10">KIMWOOM</option>
            </select>
        </div>
        <div class="form-group">
            <label for="team">경기장:</label>
            <select class="form-control" id="StadiumId" name="StadiumId">
                <option value="1">서울종합운동장 야구장(LG)</option>
                <option value="2">수원 케이티 위즈 파크</option>
                <option value="3">인천 SSG 랜더스필드</option>
                <option value="4">창원 NC필드</option>
                <option value="5">서울종합운동장 야구장(두산)</option>
                <option value="6">광주-기아 챔피언스 필드</option>
                <option value="7">사직 야구장</option>
                <option value="8">대구 삼성 라이온즈 파크</option>
                <option value="9">대전 한화생명 이글스파크</option>
                <option value="10">고척 스카이돔</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">경기 등록</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>

<script>
$(document).ready(function(){
    $('#datepicker').datepicker({
        format: 'yyyy/mm/dd',
        autoclose: true,
        language: 'ko-KR'
    });

    $('#timepicker').timepicker({
        showMeridian: false,
        minuteStep: 5,
        defaultTime: '12:00'
    });

    $('#datepicker').on('click', function(){
        $('#datepicker').datepicker('show');
    });

    $('#timepicker').on('click', function(){
        $('#timepicker').timepicker('showWidget');
    });

    $('#datepicker').on('change', function(){
        $(this).blur();
    });

    $('form').submit(function(event) {
        var homeTeam = $('#HOMETEAM_ID').val(); // 수정된 부분
        var awayTeam = $('#AWAYTEAM_ID').val(); // 수정된 부분
        var gameDate = $('input[name="gameDate"]').val();
        var startTime = $('#timepicker').val();

        if (!gameDate) {
            alert('경기일을 선택하세요.');
            event.preventDefault();
        } else if (!startTime) {
            alert('시작시간을 선택하세요.');
            event.preventDefault();
        }

        if (homeTeam === awayTeam) {
            alert('홈팀과 어웨이팀은 같을 수 없습니다.');
            event.preventDefault();
        }
    });
});
</script>

</body>
</html>
