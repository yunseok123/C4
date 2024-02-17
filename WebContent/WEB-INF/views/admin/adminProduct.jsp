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
	
		
	
	
	 <div class="add-product-container">
<a href="javascript:void(0);" data-url="${root}/admin/insertProductForm" class="add-product-btn" id="addProductButton">상품 등록</a>
    <div id="productFormContainer"></div> 
    
    <form id="searchForm" class="form-inline my-2 my-lg-0">
    <input class="form-control mr-sm-2" type="search" placeholder="상품 검색" aria-label="Search" name="searchKeyword">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
</form>


	  
		
<div class="jersey-container">
    <c:forEach var="product" items="${productAll}" varStatus="status">
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

	 </div>
	 
	 
	 



	 <nav aria-label="Page navigation example">
	    <ul class="pagination justify-content-center">
	        <c:if test="${currentPage > 1}">
	            <li class="page-item">
	                <a class="page-link page-link-ajax" href="${root}/admin/adminProduct?page=${currentPage - 1}" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                </a>
	            </li>
	        </c:if>
	        <c:forEach begin="1" end="${totalPages}" var="i">
	            <li class="page-item ${currentPage == i ? 'active' : ''}">
	                <a class="page-link page-link-ajax" href="${root}/admin/adminProduct?page=${i}">${i}</a>
	            </li>
	        </c:forEach>
	        <c:if test="${currentPage < totalPages}">
	            <li class="page-item">
	                <a class="page-link page-link-ajax" href="${root}/admin/adminProductt?page=${currentPage + 1}" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	            </li>
	        </c:if>
	    </ul>
	</nav>
	 
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



$(document).ready(function() {

    $('#searchForm').submit(function(event) {
        event.preventDefault(); // 폼의 기본 제출 이벤트를 방지
        var searchKeyword = $('input[name="searchKeyword"]').val();

        $.ajax({
            url: "${root}/admin/searchProduct",
            type: 'GET',
            data: {searchKeyword: searchKeyword},
            success: function(response) {
             
                $('.jersey-container').html(response);
                bindEventListeners(); 
            }
        });
    });

    // 기타 이벤트 리스너 바인딩
});
</script>


</body>
	    
	
</html>