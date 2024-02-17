<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 및 회원가입 페이지</title>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d06527d298427983d1f6087ccf550b1&libraries=services"></script>
<link rel="stylesheet" href="${root }/css/stadium_info.css">

</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <div style="width: 60%; margin: auto;">
      <div class="container">
         <div class="team-and-stadium-selector">

          
         <a href="${root}/team/Team?team_id=${team.team_ID}">">팀</a> <a
            href="${root}/team/${team.team_ID}/Stadium_info">경기장</a>
      </div>
      </div>
      <div class="stadium-info">

         <div class="image-holder">
            <!-- 이미지 파일 넣을 공간 -->
            <img alt="" src="${root }${stadium.stadium_Img}.png">
            
         </div>


         <div class="description">
            <h1>${stadium.name}</h1>
            <p>"${stadium.stadium_Info}"</p>
         </div>
      </div>
      <!--       <div class="details">
         <div class="info_contain">
            연락처 :
            <div class="phone">02-xxx-xxxx</div>
         </div>
         <div class="info_contain">
            주 소 :
            <div class="address">서울시 xx구</div>
         </div>
         <div class="info_contain">
            
               교통 정보 :
               <div class="traffic">
                  <div>5호선 종로3가역 8번 출구 도보 5분</div>
                  <div>1호선 종로3가역 11번 출구 도보 5분</div>
                  <div>3호선 종로3가역 8번 출구 도보 5분</div>
               </div>
            </div>


      </div> -->

      <div class="info_contain">
         <span class="info-title">연락처 :</span>
         <div class="phone">${stadium.tell}</div>
      </div>
      <div class="info_contain">
         <span class="info-title">주 소 :</span>
         <div class="address">${stadium.location}</div>
      </div>
      <div class="info_contain">
         <span class="info-title">교통 정보 :</span>
         <div class="traffic">
            <div>5호선 종로3가역 8번 출구 도보 5분</div>
            <div>1호선 종로3가역 11번 출구 도보 5분</div>
            <div>3호선 종로3가역 8번 출구 도보 5분</div>
         </div>
      </div>
      <div class="map-api" id="map">
         <h2>오시는 길</h2>
      </div>

      <script type="text/javascript">
         var stadiumAddress = "${stadium.location}"; // 서버로부터 받은 주소
      </script>

      <script src="${root }/js/Stadium_info.js"></script>

   </div>
</body>