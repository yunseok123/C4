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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="${root }/css/market.css">
	
	<style>
	    /* Flex 컨테이너 설정 */
	    .content-container {
	        display: flex;
	        flex-direction: column;
	        align-items: flex-end; /* 상품 등록 버튼을 우측 상단에 배치 */
	        margin-top: 50px; /* 상단 여백 추가 */
	    }
	     .add-product-btn {
	        position: absolute;
	        top: 45px;
	        right: 160px;
	        padding: 10px 20px;
	        background-color: #007bff;
	        color: white;
	        text-decoration: none;
	        border-radius: 5px;
	    }
	    
	    .jersey-container {
	        margin-top: 70px; /* 여기서는 예시로 70px를 사용하지만, 필요에 따라 조정할 수 있습니다. */
	        
	    }
	</style>
	
	
	</head>
	<body>
	
		
	
	
 
    
    
	  
		
<div class="jersey-container">
    <c:forEach var="product" items="${searchResults}" varStatus="status">
        <div class="jersey" data-product-id="${product.product_Id}">
            <img src="${product.product_Img}" />
            <div class="jersey-info">
                <span class="jersey-name">${product.name}</span>
                <span class="jersey-name">재고:${product.stock}개</span>
                <span class="jersey-price">${product.price}원</span>
                <!-- 수정 및 삭제 버튼 직접 추가 -->
                <div class="product-actions">
<a href="${root}/admin/editProductForm?product_id=${product.product_Id}" class="btn btn-primary btn-sm edit-product-btn">수정</a>
                    <a href="${root}/admin/deleteProduct?product_id=${product.product_Id}" class="btn btn-danger btn-sm">삭제</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

	
	 
	 
	 



	 
	 
<script src="${root }/js/market.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
<script>
$(document).ready(function() {
    bindEventListeners(); // 초기 이벤트 리스너 바인딩

    function bindEventListeners() {
        // 상품 추가 버튼 이벤트
        $(	'#addProductButton').off('click').on('click', function(e) {
            e.preventDefault();
            loadProductForm($(this).data('url'), '#productFormContainer');
        });

        // 페이지네이션 링크 이벤트
        $('.page-link-ajax').off('click').on('click', function(e) {
            e.preventDefault();
            loadPageContent($(this).attr('href'));
        });

        // 상품 수정 버튼 이벤트 (동적 콘텐츠에 대한 처리 포함)
        $(document).off('click', '.edit-product-btn').on('click', '.edit-product-btn', function(e) {
            e.preventDefault();
            loadProductForm($(this).attr('href'), '#productFormContainer');
        });
    }

    function loadProductForm(url, container) {
        $.ajax({
            url: url,
            type: 'GET',
            success: function(data) {
                $(container).html(data);
            }
        });
    }

    function loadPageContent(url) {
        $.ajax({
            url: url,
            type: 'GET',
            success: function(data) {
                $('#pageContent').html(data); // 페이지 콘텐츠를 새로운 데이터로 업데이트
                bindEventListeners(); // 새로운 콘텐츠에 대해 이벤트 리스너를 다시 바인딩
            }
        });
    }
});
</script>





	</body>
	    
	
	</html>