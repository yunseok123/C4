<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
input#questiontext {
    display: block;
    width: 100%;
    height: 150px;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
h1 {
    font-weight: bold;
}
</style>
</head>
<body>
 <c:import url="/WEB-INF/views/include/header.jsp" />
<!-- 상단 메뉴 부분 -->

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
<form:form action="${root }/product/write_pro?&category=${param.category}&product_id=${param.product_id}" method="post" modelAttribute="writequestionbean">						
<form:hidden path="questionid"/>
 <form:hidden path="productId" value="${product.productId}"/>
						<div class="form-group">
						<h1>문의 작성</h1>
							<form:label path="questiontitle">제목</form:label>
							<form:input path="questiontitle" class="form-control" />
							<form:errors path="questiontitle" style="color:red" />
							
							
						</div>
						<div class="form-group">
							<form:label path="questiontext">내용</form:label>
							<form:input path="questiontext" class="form-control1" rows="10" style="resize:none" />
							<form:errors path="questiontext" style="color:red" />
						
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">작성하기</form:button>
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
