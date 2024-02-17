<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 및 회원가입 페이지</title>
    <link rel="stylesheet" href="${root }/css/cart.css">
</head>
<body>
    <c:import url="/WEB-INF/views/include/header.jsp"/>
    <div class="cart-container">
        <!-- 장바구니 헤더 -->
        <div class="cart-header">
            <h1>주문 확인</h1>
            <span class="progress-bar">
               <span class="pocket"> 01. 주문 확인 </span>
               > 02. 주문서 작성/결제 > 03. 주문완료
            </span>
        </div>
        <hr>
        <table class="cart-items">
            <thead>
                <tr>
                    <th>상품정보</th>
                    <th>수량 및 옵션선택</th>
                    <th>상품 금액</th>
                    <th>배송비</th>
                    <th>합계 금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    
                    <td class="product-info">
                        <img src="${product.product_Img }" alt="상품 이미지" class="product-image">
                        <div class="product-details">
                            <p class="product-title">${product.name }</p>
                            <c:if test="${category eq '유니폼' or category eq '점퍼' or category eq '후드티'}">
                                <p class="product-size" id="productSize1">사이즈: ${param.productSize}</p>
                            </c:if>
                        </div>
                    </td>
                    <td class="product-quantity">
                        <p>1</p>
                        <button type="button" class="quantity-button">옵션/수량 변경</button>
                    </td>
                    <td id="subtotalPrice1">${param.total_price}</td>
                    <td id="shippingFee1">무료</td>
                    <td id="finalPrice1">${param.total_price}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 합계 부분 -->
    <div class="totals-container">
        <div class="totals-line">
            <div class="totals-group">
                <span class="totals-label" id="totalProductsLabel">총 1개의 상품</span>
                <span id="subtotalPrice2">${param.total_price}원</span>
            </div>
            <span><img class="sign" src="${root }/img/+.jpg"/></span>
            <div class="totals-group">
                <span class="totals-label">배송비</span><br><br>
                <span id="shippingFee2">무료</span>
            </div>
            <span><img class="sign" src="${root }/img/=.jpg"/></span>
            <div class="totals-group">
                <span class="totals-label">합계 금액</span><br><br>
                <span id="finalPrice2">${param.total_price}원</span>
            </div>
        </div>
    </div>

    <!-- 액션 버튼들 -->
    <div class="actions">
        <form action="${root}/product/ordersheet" method="get" id="orderForm">
            <input type="hidden" name="product_id" value="${product.product_Id}" />
            <c:choose>
                <c:when test="${category eq '유니폼' or category eq '점퍼' or category eq '후드'}">
                    <input type="hidden" name="productSize" id="hiddenProductSize" value="${param.size}" />
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="productSize" id="hiddenProductSize" value="사이즈없음" />
                </c:otherwise>
            </c:choose>
            <input type="hidden" name="quantity" id="hiddenQuantity" />
            <input type="hidden" name="totalPrice" id="hiddenTotalPrice" />
            <button type="submit" class="order-button">전체 상품 주문</button>
        </form>
    </div>

    <!-- 모달 창 -->
    <div id="optionModal" class="modal">
        <div class="modal-content">
            <div class="form-container">
                <div class="form-header">
                    <h1>옵션 선택</h1>
                </div>
                <div class="form-body">
                    <!-- 사이즈 선택 -->
                    <div class="form-row">
                        <label for="size">사이즈</label>
                        <div class="select-container">
                            <select id="size">
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                                <option value="2XL">2XL</option>
                            </select>
                        </div>
                    </div>
                    <!-- 수량 선택 -->
                    <div class="form-row">
                        <label for="quantity">수량</label>
                        <div class="quantity-section">
                            <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
                            <div class="quantity-controls">
                                <button type="button" class="quantity-btn up">▲</button>
                                <button type="button" class="quantity-btn down">▼</button>
                            </div>
                        </div>
                    </div>
                    <!-- 가격 표시 -->
                    <div class="form-row price-row">
                        <div class="price">${product.price}</div>
                    </div>
                    <!-- 버튼 행 -->
                    <div class="form-row button-row">
                        <button type="submit" class="submit-btn">확인</button>
                        <button type="reset" class="reset-btn">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${root }/js/cart.js"></script>
</body>
</html>
