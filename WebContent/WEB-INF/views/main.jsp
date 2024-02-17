<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/랭킹표.css">
<link rel="stylesheet" href="css/mainpage.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
   rel="stylesheet">

<script language="javascript" src="jquery-1.9.1.min.js"
   type="text/javascript"></script>
<script language="javascript" src="jquery-ui.min.js"
   type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="./jquery-3.6.0.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery-scrollTo/2.1.3/jquery.scrollTo.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 웹폰트 -->
<title>메인페이지</title>
</head>

<body>
   <!--*  헤더-->
   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div style="width: 70%; margin: auto;">
      <!--* 슬라이더 바-->
      <div id="rolling-main">
         <div class="swiper mySwiper">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <img src="img/솔데스크.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="img/솔데스크.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="img/솔데스크.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="img/솔데스크.jpg" alt="">
               </div>
               <div class="swiper-slide">
                  <img src="img/솔데스크.jpg" alt="">
               </div>

            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
         </div>

      </div>

       <div class="contents">
         <div class="btn-container">
            <a href="https://www.google.com" class="button_title"> <span
               class="button_text">경기 일정</span>
            </a>
         </div>
         <div class="contents-sub-image">
            <div class="dc-sub">
               <c:forEach var="game" items="${gameinfo}">
                  <div class="dc2">
                     <div class="rank"></div>
                     <a href="${root}/ticket/reservation?GAME_ID=${game.GAME_ID}"
                        class="reserve-link"> <!-- 여기에 실제 경기 상세 정보 페이지로의 링크를 추가하세요 -->
                        <div class="image-box">
                           <div class="image-text2">
                              <!-- TicketBean의 속성에 맞춰 EL 표현식 수정 -->
                              <p>
                                 <img src="${root}/img/구단 로고/야구/${game.HOMETEAM_ID}.png"
                                    alt="${game.HOMETEAM_NAME}" class="team-logo"> <span
                                    class="vs-text">VS</span> <img
                                    src="${root}/img/구단 로고/야구/${game.AWAYTEAM_ID}.png"
                                    alt="${game.AWAYTEAM_NAME}" class="team-logo">
                              </p>
                              <fmt:formatDate value="${game.GAME_DATE}"
                                 pattern="yyyy년 MM월 dd일 (E)" var="formattedDate" />
                              <p>${formattedDate}</p>
                              <!-- 게임 날짜 포맷팅 -->
                              <p>${game.START_TIME}</p>
                              <p>${game.STADIUM_NAME}</p>
                              <p>-자세히보기-</p>
                           </div>
                           <!-- 이미지를 표시하는 곳. 필요에 따라 <img> 태그를 사용하여 구현하세요 -->
                           <div class="img1"></div>
                        </div>
                     </a>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>

      <!----------------banner------------------>
      <!--|
    <div class="banner-back">
        <div class="banner">
        </div>
    </div>
-->

      <!----------------rank------------------>
      <div class="btn-container">
         <a href="${root}/record/PlayerRanking" class="button_title"> <span
            class="button_text">RANKING</span>
         </a>
      </div>

      <!-- 랭킹 표 ranking table-->
      <div class="TableContainer">
         <section class="wrapper">
            <!-- Row attribute -->
            <main class="row attribute">
               <ul>
                  <li>순위</li>
                  <li>팀명</li>
                  <li><span class="attribute-hide">#</span> 경기수</li>
                  <li>승</li>
                  <li>패</li>
                  <li>무</li>
                  <li>승률</li>
                  <li>게임차</li>
               </ul>
            </main>

            <!-- Teams List -->
            <c:forEach var="team" items="${teamBeanList}" varStatus="status">
               <article class="row BlueC">
                  <ul>
                     <li><a href="#">${status.index + 1}등</a></li>
                     <li><a href="${root}/team/Team?team_id=${team.team_ID}">${team.team_Name}</a></li>
                     <li>${team.entries}</li>
                     <li>${team.wins}</li>
                     <li>${team.losses}</li>
                     <li>${team.draws}</li>
                     <li><fmt:formatNumber value="${team.winRate}"
                           pattern="0.000" /></li>
                     <li>${team.gamesBehind}</li>
                     <!-- 여기에 문자열 형태의 경기 수 차이를 표시 -->
                  </ul>
                  <ul class="more-content">
                     <!-- 여기에 추가 정보를 포함시키거나, 필요 없다면 이 부분을 삭제하세요 -->
                     <li>어항 속에 갇힌 고기들보다 어쩌면 내가 좀 더 멍청할지 몰라</li>
                  </ul>
               </article>
            </c:forEach>
         </section>
         <div class="card tabs">

            <input id="tab-1" type="radio" class="tab tab-selector"
               checked="checked" name="tab" /> <label for="tab-1"
               class="tab tab-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타 자</label> <input id="tab-2" type="radio"
               class="tab tab-selector" name="tab" /> <label for="tab-2"
               class="tab tab-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;투 수</label>


            <div class="tabsShadow"></div>
            <div class="glider"></div>
            <section class="content">

               <div class="item" id="content-1">
                  <div class="rankings-wrapper">
                     <div class="ranking-container">
                        <div class="rank-catagory">타율</div>
                        <c:forEach var="Players" items="${topBattingAveragePlayers}"
                           varStatus="status">
                           <c:if test="${status.index < 3}">


                              <div class="profile-pic-container">
                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>

                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">
                                    <fmt:formatNumber value="${Players.battingAverage}"
                                       pattern="0.000" />
                                 </div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="ranking-container">
                        <div class="rank-catagory">홈런</div>
                        <c:forEach var="Players" items="${topHomeRunPlayers }"
                           varStatus="status">
                           <c:if test="${status.index < 3}">

                              <div class="profile-pic-container">
                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>

                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">${Players.homerun}</div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="ranking-container">
                        <div class="rank-catagory">타점</div>
                        <c:forEach var="Players" items="${topRBIPlayers }"
                           varStatus="status">
                           <c:if test="${status.index < 3}">

                              <div class="profile-pic-container">
                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>
                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">${Players.rbi}</div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>


                  </div>
               </div>

               <div class="item" id="content-2">
                  <div class="rankings-wrapper">
                     <div class="ranking-container">
                        <div class="rank-catagory">방어율</div>
                        <c:forEach var="Players" items="${topERAPlayers }"
                           varStatus="status">
                           <c:if test="${status.index < 3}">

                              <div class="profile-pic-container">

                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>

                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">
                                    <fmt:formatNumber value="${Players.era}" pattern="0.00" />
                                 </div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="ranking-container">
                        <div class="rank-catagory">승리</div>
                        <c:forEach var="Players" items="${topWinPlayers }"
                           varStatus="status">
                           <c:if test="${status.index < 3}">

                              <div class="profile-pic-container">
                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>
                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">${Players.win}</div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="ranking-container">
                        <div class="rank-catagory">탈삼진</div>
                        <c:forEach var="Players" items="${topSOPlayers }"
                           varStatus="status">
                           <c:if test="${status.index < 3}">

                              <div class="profile-pic-container">
                                 <a
                                    href="${root}/player/player_info?player_id=${Players.player_Id}">
                                    <img src="${Players.playerImg}" alt="Profile Picture 1"
                                    class="profile-pic">
                                 </a>
                              </div>
                              <div class="ranking-info">
                                 <div class="ranking-row">${Players.name}</div>
                                 <div class="ranking-row">(${Players.teamName})</div>
                                 <div class="ranking-row">${Players.so}</div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>


                  </div>
               </div>


            </section>
         </div>
      </div>



      <!-- MVP 표 -->
      <div class="btn-container">
         <a href="${root}/product/Market" class="button_title"> <span
            class="button_text">MARKET</span>
         </a>
      </div>

      <div class="rankingimage">
         <div class="dc-sub3">
            <c:forEach var="product" items="${productAll}" varStatus="status">
               <c:if test="${status.index < 6}">
                  <div class="dc4">




                     <div class="rank-img-box">


                        <div class="product_img">
<a href="${root}/product/Market_order?product_id=${product.product_Id}&category=${product.category}">

                              <img src="${product.product_Img}" alt="Profile Picture">
                           </a>
                           <div style="display: flex;">
                              <div class="rank3">${status.index+1}위</div>
                              <div class="product_info">
                                 <div style="height: 50px"> ${product.name}</div>
                                 <div>${product.price}원</div>
                              </div>

                           </div>
                        </div>
                     </div>
                  </div>

               </c:if>
            </c:forEach>
         </div>
      </div>


      <!----------------footer------------------>
      <div style="margin-top: 300px;"></div>
      <script src="main.js">
         
      </script>
      <script>
         var swiper = new Swiper(".mySwiper", {
            spaceBetween : 30,
            centeredSlides : true,
            autoplay : {
               delay : 2500,
               disableOnInteraction : false,
            },
            pagination : {
               el : ".swiper-pagination",
               clickable : true,
            },
            navigation : {
               nextEl : ".swiper-button-next",
               prevEl : ".swiper-button-prev",
            },
         });
      </script>


      <script>
         $(function() {
            $('.icon ul li a').click(function(e) {
               e.preventDefault();
               //이동할 섹션이름
               var goPage = $(this).attr('href');
               //gopage의 y 좌표
               var pageY = $(goPage).offset().top
               $(window).scrollTo({
                  left : 0,
                  top : pageY
               }, 1000)
            })
         })
      </script>
   </div>
</body>
<c:import url="/WEB-INF/views/include/footer.jsp" />



</html>