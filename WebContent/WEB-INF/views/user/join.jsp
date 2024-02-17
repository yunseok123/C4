<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<title>User Registration Form</title>
<link rel="stylesheet" href="${root }/css/join.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<script>

	function checkUserIdExist(){
		
		var user_id = $("#user_id").val()
		
		if(user_id.length == 0){
			alert('아이디를 입력해주세요')
			return
		}//아이디 입력하지 않았을 때
		
		$.ajax({
			
			url : '${root}/user/checkUserIdExist/'+user_id,
			type : 'get',
			dataType : 'text',
			success: function(result){
				if(result.trim()=='true'){

					alert('사용할 수 있는 아이디입니다')
					$("#UserIdExist").val('true')
				
				}else if(result.trim()=='false'){

					alert('사용할 수 없는 아이디입니다')
					$("#UserIdExist").val('false')
				}
			}
		})
	}
	
	function resetUserIdExist(){
		
		$("#UserIdExist").val('false')
		
	}//사용자 아이디란에 입력 시 UserIdExist의 값을 false 주입
	
function checkUserNickExist(){
		
		var user_nickname = $("#user_nickname").val()
		
		if(user_nickname.length == 0){
			alert('닉네임을 입력해주세요')
			return
		}//닉네임 입력하지 않았을 때
		
		$.ajax({
			
			url : '${root}/user/checkUserNickExist/'+user_nickname,
			type : 'get',
			dataType : 'text',
			success: function(result){
				if(result.trim()=='true'){

					alert('사용할 수 있는 닉네임입니다')
					$("#UserNickExist").val('true')
				
				}else if(result.trim()=='false'){

					alert('사용할 수 없는 닉네임입니다')
					$("#UserNickExist").val('false')
				}
			}
		})
	}
	
	function resetUserNickExist(){
		
		$("#UserNickExist").val('false')
		
	}//사용자 아이디란에 입력 시 UserIdExist의 값을 false 주입

</script>

<body>
	<c:import url="/WEB-INF/views/include/header2.jsp" />

	<div class="container" style="margin-top:100px">
	
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
				<h2>회원가입</h2>
					
					<form:form action="${root }/user/join_pro" method="post" modelAttribute="joinUserBean">
						<form:hidden path="UserIdExist"/>
						<div class="form-group">
							<form:label path="user_name">이름</form:label>
							<form:input path="user_name" class="form-control"/>
							<form:errors path="user_name" style="color:red"/>
						</div>
						
						<form:hidden path="UserNickExist"/>
						<div class="form-group">
							<form:label path="user_nickname">닉네임</form:label>
							<div class="input-group">
								<form:input path="user_nickname" class="form-control" onkeypress="resetUserNickExist()"/>
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick='checkUserNickExist()'>
										중복확인
									</button>
								</div>
							</div>
							<form:errors path="user_nickname" style="color:red" />
						</div>
						
						<div class="form-group">
							<form:label path="user_id">아이디</form:label>
							
							<div class="input-group">
								<form:input path="user_id" class="form-control" onkeypress="resetUserIdExist()"/>
								<!--onkeypress: 사용자가 키보드를 사용하여 입력 시 resetUserIdExist() 함수 호출  -->
								<div class="input-group-append">

									<button type="button" class="btn btn-primary" onclick='checkUserIdExist()'>
										중복확인
									</button>
								</div>
							</div>
							
							<form:errors path="user_id" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="user_password">비밀번호</form:label>
							<form:password path="user_password" class="form-control"/>
							<form:errors path="user_password" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="user_password2">비밀번호 확인</form:label>
							<form:password path="user_password2" class="form-control"/>
							<form:errors path="user_password2" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="user_email">이메일</form:label>
							<form:input path="user_email" class="form-control"/>
							<form:errors path="user_email" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="user_phonenumber">전화번호</form:label>
							<form:input path="user_phonenumber" class="form-control"/>
							<form:errors path="user_phonenumber" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="user_address">주소</form:label>
							<form:input path="user_address" class="form-control"/>
							<form:errors path="user_address" style="color:red"/>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">회원가입</form:button>
							</div>
						</div>
					
					
					</form:form>
					
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
</body>
</html>
