<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/market_order.css">

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="market-order-container">
		<div class="item_photo_info_sec">

			<div class="item_photo_view">
				<div class="item_photo_big">
					<span class="img_photo_big"><a href="#" id="mainImage"
						class="zoom_layer_open btn_open_layer"><img
							src="${product.product_Img }"
							width="570" alt="${product.name }" title="${product.name }"
							class="middle"></a></span>
				</div>
				<div id="testZoom" style="display: none">
					<img
						src="${product.product_Img }"
						width="570" alt="${product.name }" title="${product.name }"
						class="middle">
				</div>
				<!-- //item_photo_big -->
				<div class="item_photo_slide">

					<ul
						class="slider_wrap slider_goods_nav slick-initialized slick-slider">
						<div aria-live="polite" class="slick-list draggable">
							<div class="slick-track"
								style="opacity: 1; width: 117px; transform: translate3d(0px, 0px, 0px);"
								role="listbox">
								<li class="slick-slide slick-current slick-active"
									style="width: 117px;"><a href="#" tabindex="0"><img
										src="${product.product_Img }"
										width="68" class="middle"></a></li>
							</div>
						</div>
					</ul>

				</div>
				<!-- //item_photo_slide -->

				<!-- //item_photo_view -->
			</div>
			<!-- //item_photo_view_box -->

<form name="frmView" id="frmView"  action="${root}/product/cart" method="get">
<input type="hidden" name="product_id" value="${product.product_Id}">
 <input type="hidden" name="quantity" value="1">
 <input type="hidden" name="category" value="${product.category}">
<c:choose>
    <c:when test="${not empty category and category ne '유니폼'}">
        <!-- 유니폼이 아닐 경우 기본 가격으로 설정 -->
        <input type="hidden" name="total_price" value="${product.price}">
    </c:when>
    <c:otherwise>
        <input type="hidden" name="total_price" value="pre"> <!-- 'pre'는 적절한 로직으로 대체 -->
    </c:otherwise>
</c:choose>

 <c:choose>
        <c:when test="${category eq '유니폼' or category eq '점퍼' or category eq '후드티'}">
            <input type="hidden" name="productSize" id="hiddenProductSize" value="S" />
        </c:when>
        <c:otherwise>
            <input type="hidden" name="productSize" id="hiddenProductSize" value="사이즈없음" />
        </c:otherwise>
    </c:choose>

				<div class="item_info_box">
					<!-- //time_sale -->
					<div class="item_tit_detail_cont">
						<div class="item_detail_tit">
							<h3>${product.name }</h3>

						</div>
						<div class="item_detail_list">

							<dl class="item_price">
								<dt>판매가</dt>
								<dd>
									<strong><strong>${product. price}</strong></strong>원
									<!-- 글로벌 참조 화폐 임시 적용 -->
								</dd>
							</dl>

							
							<dl>
								<dt>제조사</dt>
								<dd>솔데스크</dd>
							</dl>
							<dl>
								<dt>원산지</dt>
								<dd>대한민국</dd>
							</dl>
							<dl class="item_delivery">
								<dt>배송비</dt>
								<dd>
									<strong>0원</strong><strong>/주문시결제(선결제)</strong>
									<div class="delivery-detail">
										
										<div class="delivery-division">택배</div>


										<div class="js-deliveryMethodVisitArea dn">방문 수령지 :
											서울특별시 종로구 종로12길 15 종로코아 빌딩 8층</div>
										
									</div>
									
								</dd>
							</dl>
							<dl class="item_stock">
							 <dt>남은 수량</dt>
							    <dd>
							        <c:choose>
							            <c:when test="${product.stock == 0}">							                 
										품절(수량이 없어 배송이 지연될 수 있습니다.	)
							            </c:when>
							            <c:otherwise>
							                <strong><strong>${product.stock}</strong></strong>개
							            </c:otherwise>
							        </c:choose>
							    </dd>
							</dl>


							<div class="item_add_option_box">
								<dl>
									<dt>SIZE</dt>
									<dd>
									  <input type="hidden" name="basePrice" id="basePrice" value="${product.price}" />
									
									<c:if test="${showUniformOptions}">
									
										<div class="item_add_option_box">
											<dd>
												<div class="custom-select-wrapper">
													<select name="optionSnoInput"
														onchange="updateTotalPrice(this)">
														<option value="" data-price="0">= 없음 =</option>
														<option value="1" data-price="10000">열접착 마킹
															(10,000원)</option>
														<option value="2" data-price="20000">자수 마킹
															(20,000원)</option>
														<!-- ... 나머지 옵션들 ... -->
													</select>


												</div>
										</dd>
												
										</div>
										</c:if>
								</dl>
							</div>

							<!-- //item_add_option_box -->
						</div>
						<!-- //item_detail_list -->
						<div class="option_total_display_area item_choice_list">

							<div class="item_price_cont">
								<div class="end_price item_tatal_box" style="display: none">
									<dl class="total_goods">
										<dt>상품금액</dt>
										<dd>
											<strong class="goods_total_price"></strong>
										</dd>
									</dl>
									
									<dl class="total_amount">
										<dt>총 합계금액</dt>
										<dd>
											<strong class="total_price"> 30,000<b>원</b></strong>
										</dd>
									</dl>
								</div>
								<!-- //item_tatal_box -->
							</div>
							<!-- //item_price_cont -->
						</div>
						<div class="btn_choice_box">
							<div class="btn_choice_box1">
								<!-- N:재입고 알림이 있을 때는 restock 클래스를 div에 같이 넣어주세요 -->
			
								
									
<button type="submit" class="btn_add_order" onclick="checkStockBeforePurchase()">바로 구매</button>
								
							</div>
						</div>


					</div>
					<!-- //item_tit_detail_cont -->
				</div>
				<!-- //item_info_box -->
			</form>
		</div>
	</div>
	
	
	<div class="tab-container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1"><strong>DETAIL
					INFO</strong></li>
			<li class="tab-link" data-tab="tab-2"><strong>문의 사항</strong></li>
			<li class="tab-link" data-tab="tab-3"><strong>SHOPPING
					INFO</strong></li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<!-- Detail Info 내용 -->
			<center>
				<div>
					<img id="detail-info" src="${root }/img/detail-info.jpg">
				</div>
			</center>

		</div>
				<div id="tab-2" class="tab-content">
		<div>
			<h1>문의 게시판</h1>
		
	 <a href="${root }/product/write?product_id=${param.product_id}&category=${param.category}" class="btn_write">글쓰기</a>
	</div>
<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>문의상태</th>
            <th>사용자</th>
            <th>제목</th>
            <th>날짜</th>
        </tr>	
    </thead>
    <tbody>
        <!-- 서버에서 questions 리스트를 제공한다고 가정 -->
        <c:forEach items="${questions}" var="question">
            <tr onclick="window.location.href='${root }/product/read?questionid=${question.questionid}&category=${param.category}&product_id=${param.product_id}'">
                <td>${question.questionid}</td>
        		<td class="<c:if test="${question.questionstatus == '답변완료'}">status-complete</c:if>">${question.questionstatus}</td>
                <td>${question.usernickname}</td>
                <td>${question.questiontitle}</td>
                <td>${question.questiondate}</td>
            </tr>
       
        </c:forEach>
      
    </tbody>
      
</table>

	
			</div>
		<div id="tab-3" class="tab-content">
			<div class="exchange_cont">
				<h3>배송안내</h3>
				<div class="admin_msg">
					<table class="table-info __se_tbl_ext" cellspacing="0"
						cellpadding="0"
						style="font-style: inherit; font-variant: inherit; font-family: &amp; quot; Nanum Gothic&amp;quot; , sans-serif; font-stretch: inherit; font-size: 13px; line-height: 26px; color: rgb(51, 51, 51); margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 1080px;">
						<tbody
							style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><p
										style="line-height: 2;">
										<span
											style="font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-family: 돋움, dotum;"><span
											style="font-size: 10pt; color: rgb(0, 0, 0);">✔&nbsp;</span></span><span
											style="font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-family: 돋움, dotum;"><span
											style="font-size: 10pt; color: rgb(0, 0, 0);">배송업체
												:&nbsp;CJ 대한통운 (택배 고객센터 1588-1255)</span></span>
									</p></td>
							</tr>
						</tbody>
					</table>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="font-size: 10pt; color: rgb(0, 0, 0);">✔ 배송비&nbsp;
								:&nbsp; 70,000원 이상 구매시 무료배송 (기본 3,000원) / 제주&amp;도서산간 지역 추가
								3,000원)&nbsp;</span></span><span
							style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">&nbsp;</span>
					</p>
					<p style="line-height: 2;">
						<span
							style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔&nbsp;</span><span
							style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);"><span
							style="font-size: 10pt; color: rgb(0, 0, 0);">배송정보 :</span>&nbsp;결제
							완료일 기준 3일 소요 (자수마킹 진행시 최대 20~25일 소요)</span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="font-size: 10pt;">✔ 배송안내 :</span></span><span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;">&nbsp;</span>&nbsp;&nbsp;
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;">&nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;마킹 주문건의 경우 제작
							상품으로 결제 완료 후 주문상태가 <span style="color: rgb(255, 0, 0);">상품준비중</span>
							상태로 변경되며 교환/환불이 불가능하니 신중한 구매를 부탁드립니다.
						</span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;">&nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span
							style="color: rgb(0, 0, 0);"> &nbsp;공휴일 및 휴무일에는 택배배송이
								불가합니다. 또한 일부 도서산간 지역의 경우 배송이 불가능 할 수 있습니다.</span>
						</span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;수령자가 동일한 경우의 개별 주문에 대한 배송은 묶음 배송으로
								진행됨을 알려드립니다.</span></span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;(개별 주문으로 인한 배송비 중복이 나오는 경우에도 수령자가 동일한
								경우 묶음 배송으로 진행되오니 신중한 결제 부탁드립니다.)</span></span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(0, 0, 0);">배송
								조회는 오후 5시 이후 확인 가능합니다.&nbsp;</span></span>
					</p>
					<p style="line-height: 2;">
						<span
							style="color: rgb(51, 51, 51); font-family: 돋움, dotum; font-size: 13px;"><span
							style="color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;주문 시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는
								차이가 발생 할 수 있습니다.</span></span>
					</p>
				</div>
				<h3>교환 및 반품안내</h3>
				<div class="admin_msg">
					<table class="table-info __se_tbl_ext" cellspacing="0"
						cellpadding="0"
						style="font-family: &amp; quot; Nanum Gothic&amp;quot; , sans-serif; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 13px; line-height: 26px; color: rgb(51, 51, 51); margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 1080px;">
						<tbody
							style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔</span></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><p>
										<span
											style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">상품
											청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.</span>
									</p></td>
							</tr>
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔&nbsp;</span></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">상품
										택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 7일 이내라도 교환 및 반품이 불가능합니다.</span></td>
							</tr>
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔</span></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">저단가
										상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다(제품의 하자,배송
										오류는 제외)</span></td>
							</tr>
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔</span></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">일부
										상품은 신모델 출시, 부품 가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.</span></td>
							</tr>
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔</span></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span
									style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">사전
										주문 상품의 경우에는 제작 완료, 인수 후에는 교환/반품기간 내라도 교환 및 반품이 불가능 합니다.</span></td>
							</tr>
							<tr
								style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">
								<td
									style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><p
										style="line-height: 2;">
										<span
											style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">✔</span>
									</p></td>
								<td
									style="font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><p
										style="line-height: 2;">
										<span
											style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">일부
											특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이
											불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오.</span>
									</p></td>
							</tr>
						</tbody>
					</table>
					<p style="line-height: 2;">
						<span
							style="color: rgb(0, 0, 0); font-family: 돋움, dotum; font-size: 10pt;">✔&nbsp;</span><span
							style="color: rgb(0, 0, 0); font-size: 10pt; background-color: rgb(255, 255, 255); font-family: 돋움, dotum;">교환/반품
							비용기준 :</span><br
							style="color: rgb(51, 51, 51); font-family: &amp; quot; Nanum Gothic&amp;quot; , sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);">
						<span
							style="color: rgb(0, 0, 0); font-size: 10pt; background-color: rgb(255, 255, 255); font-family: 돋움, dotum;">&nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; 반품건 배송비 선결제시 3,000원 무료배송시 6,000원 /
							교환건 왕복 택배비 6,000원 동봉</span><br
							style="color: rgb(51, 51, 51); font-family: &amp; quot; Nanum Gothic&amp;quot; , sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);">
						<span
							style="color: rgb(0, 0, 0); font-size: 10pt; background-color: rgb(255, 255, 255); font-family: 돋움, dotum;">&nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; 상품 하자 및 오배송 등 판매자의 실수로 인한 교환/반품은 비용없이
							무료로 처리됩니다.&nbsp;</span><br
							style="color: rgb(51, 51, 51); font-family: &amp; quot; Nanum Gothic&amp;quot; , sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);">
						<span
							style="color: rgb(0, 0, 0); font-size: 10pt; background-color: rgb(255, 255, 255); font-family: 돋움, dotum;">&nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp; &nbsp; &nbsp; &nbsp; 발송지가 도서산간지역인 경우, 배송비가 추가 될 수 있습니다.</span><span
							style="font-family: 돋움, dotum; font-size: 10pt; color: rgb(0, 0, 0);">&nbsp;</span>
					</p>
				</div>
				<h3>환불안내</h3>
				<div class="admin_msg">
					<p>
						<span style="font-family: 돋움, dotum; font-size: 13.3333px;">✔</span><span
							style="font-family: 돋움, dotum;">&nbsp;</span>배송완료 기준 14일 이내 상품오염,
						택 미제거 등 검수 절차 진행 후 교환/반품/환불이 진행됩니다. (마킹된 상품 제외)
					</p>
					<p>
						<span style="font-family: 돋움, dotum; font-size: 13.3333px;">✔&nbsp;</span><font
							face="나눔고딕, NanumGothic"><span
							style="font-family: 돋움, dotum;">자수/리얼마킹 신청 후 "상품준비중" 일 경우,
								환불이 불가 한 점 양해부탁드립니다.</span></font>&nbsp;
					</p>
				</div>
				<h3>AS안내</h3>
				<div class="admin_msg">
					<p>
						<span style="font-family: 돋움, dotum; font-size: 13.3333px;">✔</span><span
							style="font-family: 돋움, dotum;">&nbsp;</span>소비자분쟁해결 기준(공정거래위원회
						고시)에 따라 피해를 보상받을 수 있습니다.
					</p>
					<p>
						<span style="font-family: 돋움, dotum; font-size: 13.3333px;">✔</span><span
							style="font-family: 돋움, dotum;">&nbsp;</span>A/S는 판매자에게 문의하시기
						바랍니다.
					</p>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript">
var basePrice = parseInt("${product.price}", 10); // JSP에서 제공하는 기본 판매가를 자바스크립트 변수로 할당
</script>
	<script src="${root }/js/market_order.js"></script>
</body>
</html>