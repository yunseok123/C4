
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/market.css">

</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp"/>

	<div class="product-main-img">
		<img class="allstar" src="${root }/img/올스타.jpg">
	</div>

<div class="title-box-container">
	<div class="title-box">BEST</div>
	</div>
	<div class="contents">		
		<!--what new-->
		<div class="contents-sub-image">
		
			<div class="dc-sub">


			   <c:forEach var="product" items="${productBest}" varStatus="status">
                   <c:if test="${status.index < 12}">
				<div class="dc2">
					<div class="rank"></div>
<a href="${root}/product/Market_order?product_id=${product.product_Id}&category=${product.category}">
						<div class="product-box">
							<div class="product-img">
								<img class="img1"
									src="${product.product_Img}">
							</div>
							<div class="product-text">
								<strong>${product.name}</strong><br />
							 <span>${product.price}</span>
							</div>
						</div>
					</a>
				</div>
				
			<button class="arrow-button prev-button" onclick="prevItems()">
				<</button>
<button class="arrow-button next-button" onclick="nextItems()">
				></button>
				</c:if>
</c:forEach>
			</div>


			
		</div>


	</div>
	<div class="title-box-container">
	<div class="title-box">Recommend</div>
	</div>
	
<div class="jersey-container">
   <c:forEach var="product" items="${productAll}" varStatus="status">
<a href="${root}/product/Market_order?product_id=${product.product_Id}&category=${product.category}">
   
    <div class="jersey">
  
    
        <img src="${product.product_Img}" />
        <div class="jersey-info">
            <span class="jersey-name">${product.name}</span>
            <span class="jersey-price">${product.price}원</span>
        </div>
    </div>
    </a>
    
 </c:forEach>
 
 </div>
 <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${root}/product/Market?page=${currentPage - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${root}/product/Market?page=${i}">${i}</a>
            </li>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="${root}/product/Market?page=${currentPage + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>
 
	<script src="${root }/js/market.js"></script>
</body>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</html>