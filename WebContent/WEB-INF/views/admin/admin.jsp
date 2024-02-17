<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
      	<c:import url="/WEB-INF/views/include/header.jsp"/>
    

    <!-- Sidebar & Content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="sidebar-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Dashboard</a>
                        </li>
                        <li class="nav-item">
						<a class="nav-link" href="#" id="manageTeam">팀관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="managePlayers">선수관리</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="#"<%-- "${root }/admin/adminGameSchedule" --%> id="manageGameSchedule">경기관리</a>
                        </li>
                       <li class="nav-item">
                            <a class="nav-link" href="#"<%-- "${root }/admin/adminOrder" --%> id="manageOrder">주문관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"<%-- "${root }/admin/adminProduct" --%> id="manageProduct">상품관리</a>
                        </li>
                        	<li class="nav-item">
                            <a class="nav-link" href="#"<%-- "${root }/admin/adminTicket" --%> id="manageTicket">티켓관리</a>
                        </li>
                          <li class="nav-item">
    						<a class="nav-link" href="#" id="managePosts">게시글 관리</a>
						</li>
						<li class="nav-item">
    						<a class="nav-link" href="#" id="manageNotices">공지사항 관리</a>
						</li>
						<li class="nav-item">
    						<a class="nav-link" href="#" id="manageQuestions">문의 사항 관리</a>
						</li>					
                       
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                   <h1><span class="nav-link" style="color:black">${loginUserBean.user_nickname}</span> <!-- 닉네임 표시 -->
                   관리자 페이지 입니다</h1>
                </div>
                
            </main>
        </div>
    </div>

    <!-- Bootstrap and JQuery -->
   <!-- Bootstrap and JQuery (Full Version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var rootPath = "${root}";
$(document).ready(function() {
    $("#manageTeam").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        $.ajax({
            url: rootPath+"/admin/adminRecord", // AdminRecord.jsp의 실제 경로
            type: "GET", // HTTP 요청 방식
            success: function(response) {
                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(error);
            }
        });
    });
});


$(document).ready(function() {
	
    $("#managePlayers").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        $.ajax({
            url: rootPath+"/admin/adminPlayerRecord", // AdminRecord.jsp의 실제 경로
            type: "GET", // HTTP 요청 방식
            success: function(response) {
                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(error);
            }
        });
    });
});

$(document).ready(function() {
	
    $("#manageOrder").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        $.ajax({
            url: rootPath+"/admin/adminOrder", // AdminRecord.jsp의 실제 경로
            type: "GET", // HTTP 요청 방식
            success: function(response) {
                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(error);
            }
        });
    });
});

 $(document).ready(function() {
	
    $("#manageProduct").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        $.ajax({
            url: rootPath+"/admin/adminProduct", // AdminRecord.jsp의 실제 경로
            type: "GET", // HTTP 요청 방식
            success: function(response) {
                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(error);
            }
        });
    });
});


$(document).ready(function() {
    // 페이지네이션 링크 클릭 이벤트 처리
    $(document).on('click', '.page-link-ajax', function(e) {
        e.preventDefault(); // 기본 동작 방지

        var url = $(this).attr('href'); // 클릭된 링크의 href 속성값

        // AJAX 요청
        $.ajax({
            url: url,
            type: 'GET',
            success: function(response) {
                // 성공 시, 메인 콘텐트 영역에 응답 내용 로드
                $("main[role='main']").html(response);

                // 페이지네이션 링크에 대한 새로운 AJAX 처리를 다시 바인딩
                // 필요한 경우에만 추가
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error("AJAX Error: " + error);
            }
        });
    });
});
$(document).ready(function() {
    $("#managePosts").click(function(e) {
        e.preventDefault(); // 기본 링크 기능을 차단

        $.ajax({
            url: rootPath + "/admin/adminPosts", // 게시글 관리 페이지 경로
            type: "GET",
            success: function(response) {
                // AJAX 호출이 성공하면 메인 컨텐츠 영역에 응답 내용을 로드합니다.
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error("Error: " + error);
                alert("게시글 목록을 불러오는 데 실패했습니다.");
            }
        });
    });
});

$(document).ready(function() {
    $("#manageNotices").click(function(e) {
        e.preventDefault(); // 기본 이벤트 방지
        $.ajax({
            url: rootPath + "/admin/manageNotices", // manageNotices.jsp 페이지의 경로
            type: "GET",
            success: function(response) {
                $("main[role='main']").html(response); // 응답을 메인 콘텐츠 영역에 로드
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                alert("공지사항 페이지를 불러오는 데 실패했습니다.");
            }
        });
    });
});



$(document).ready(function() {
    $("#manageQuestions").click(function(e) {
        e.preventDefault(); // 기본 이벤트 방지
        $.ajax({
            url: rootPath + "/admin/adminQuestion", // manageNotices.jsp 페이지의 경로
            type: "GET",
            success: function(response) {
                $("main[role='main']").html(response); // 응답을 메인 콘텐츠 영역에 로드
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                alert("문의사항 페이지를 불러오는 데 실패했습니다.");
            }
        });
    });
});
$(document).ready(function() {
    
    $("#manageTicket").click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지
        $.ajax({
            url: rootPath+"/admin/adminTicket", // AdminRecord.jsp의 실제 경로
            type: "GET", // HTTP 요청 방식
            success: function(response) {
                // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
                $("main[role='main']").html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(error);
            }
        });
    });
});
$(document).ready(function() {
 $("#manageGameSchedule").click(function(e) {
     e.preventDefault(); // 기본 이벤트를 방지
     $.ajax({
         url: "${root}/admin/adminGameSchedule", // adminGameSchedule.jsp의 실제 경로
         type: "GET", // HTTP 요청 방식
         success: function(response) {
             // AJAX 호출이 성공하면, 메인 컨텐트 영역에 응답 내용을 로드
             $("main[role='main']").html(response);
         },
         error: function(xhr, status, error) {
             // 오류 처리
             console.error(error);
         }
     });
 });
});

</script>



</body>
</html>
