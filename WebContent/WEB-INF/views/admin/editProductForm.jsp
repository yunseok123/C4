<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/css/market.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">상품 수정</h2>

    <form action="${root}/admin/updateProduct" method="post">
        <input type="hidden" name="product_Id" value="${product.product_Id}"/>
        
        <div class="form-group">
            <label for="name">상품명:</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
        </div>
        <div class="form-group">
            <label for="price">가격:</label>
            <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
        </div>
        <div class="form-group">
            <label for="product_Img">상품 이미지 URL:</label>
            <input type="text" class="form-control" id="product_Img" name="product_Img" value="${product.product_Img}" required>
        </div>
        <div class="form-group">
            <label for="stock">상품 재고 개수:</label>
            <input type="text" class="form-control" id="stock" name="stock" value="${product.stock}" required>
        </div>
        <div class="form-group">
            <label for="category">카테고리:</label>
            <input type="text" class="form-control" id="category" name="category" value="${product.category}" required>
        </div>
        <button type="submit" class="btn btn-primary">상품 수정</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
