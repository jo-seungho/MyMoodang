<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="java.util.ArrayList, com.kh.user.shop.cart.model.vo.Cart"%>

<%
	ArrayList<Cart> list = (ArrayList<Cart>) request.getAttribute("list");
	int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
	
	int[] orderNos = new int[list.size()];
	int index = 0;
	String address = "";


	for(Cart c : list) {
		address = c.getShipAddr();
	}
	
%>
<!-- 2023-04-23 조승호 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/shop/list.bundle.css">
<link rel="stylesheet" href="/resources/css/shop/payment_order.css">
<link rel="stylesheet" href="/resources/css/shop/cart1.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="/resources/js/shop/payment.js"></script>

<%-- 결제용 API --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>장바구니</title>
</head>
<body>
	<!-- jsp 변환 / 2023-04-14 / 김서영 -->

	<%@ include file="../common/header.jsp"%>

	<div id="Container-Wrapper">
		<!-- 주문내역 페이지 영역 시작 -->
		<div class="title_pay_head">
			<h1 align="center" class="title_desc"
				style="margin: 40px 0; font-size: xx-large;">장바구니</h1>
		</div>
		<div id="cartItemList" class="only_pc">
			<div class="cart_item ">

				<div class="cart_select">
				<%-- 
					<div class="inner_select">
						<label class="check"> <input type="checkbox"
							name="checkAll" class="checkAll" onclick="sel_all(this)">
							<span class="ico"></span>전체선택
						</label> <a href="#none" class="btn_delete">선택삭제</a>
					</div>
				--%>

				</div>
				<div class="box cold">
					<div class="tit_box">
						<h4 class="tit">
							<span class="inner_tit">상품 목록</span>
						</h4>
						<button type="button" id='btn_dropup' class="btn_dropup"
							onclick="dropup()">접기 / 펼치기</button>

					</div>


					<ul class="list" id='dropup_list'>

						<% if(list.isEmpty()) { %>
							<div class="noData">등록된 상품이 없습니다.</div>
						<% } else { %>

							<% for(Cart c : list) { %>
							<li>
								<!-- 상품 목록 중 1. 추가/삭제될 목록임. -->
								<div class="item">
								 
									<label class="check" for="chkItem1" style="visibility:hidden"> <!-- 개당 체크박스 --> <input
										onclick='check_sel_all(this)' type="checkbox" id="chkItem1"
										name="checkOne" class="checkOne"
										data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
										data-item-no="65810" data-item-parent-no="65810"> <span
										class="ico"></span>
									</label>								
								


									<div class="name">
										<div class="inner_name">
											<a href="#" class="package "><%= c.getItemName() %></a>
											<div class="info"></div>
										</div>
										<div class="goods">
										  <input type="hidden" class="itemCodeOne" value="<%= c.getItemCode() %>">
											<a href="#" class="thumb "
												style="background-image: url(<%= c.getImgPath() %>);">
												</a>
											<!-- 이미지자리 ^-->
											<div class="price">
												<div class="in_price">
													<input class="noDis" type="hidden" value="<%= c.getPrice() %>">
													<input class="noDisTotal" type="hidden" value="<%= c.getTotalPrice() %>">
													<input class="selling1" type="hidden" value="<%= c.getDiscountPrice() %>">
													<span class="selling">
													<%= c.getTotalDiscountPrice()%>
													 <span class="won">원</span>
													<input class="totalMoney" type="hidden" value="<%= c.getTotalDiscountPrice() %>">
													</span>
													<p class="noti"></p>
												</div>
												<!-- 개수 조정 부분. -->
												<div class="stamper count">
													<button type="button" class="btn minus off"
														data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
														data-item-no="65810" data-opt="decrease">감소</button>
													<input type="text" id="stepperCounter" class="num" value="<%= c.getCartStock() %>">
													<button type="button" class="btn plus plusAdd"
														data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
														data-item-no="65810" data-opt="increase">추가</button>
												</div>
											</div>
										</div>
										<!-- 상품 삭제 시 db반영 (btn_delete)-->
										<button type="button" onclick="del_row(this)"
											class="btn_delete"
											data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
											data-item-no="65810" data-type="cold">상품 삭제</button>
									</div>
								</div>
							</li>
						  <% } %>
						<% } %>


						<!-- """밑에 코드는 장바구니 데이터가 하나도 없을 경우 출력하도록 구현 바람.(cart_empty.html 참고)"""
                            <div class="inner_empty"><span class="bg"></span>
                            <p class="txt">장바구니에 담긴 상품이 없습니다</p></div>
     -->
					</ul>
				</div>


			</div>
			<div class="cart_result">
				<div class="inner_result">
					<div class="cart_delivery">
						<h3 id="payPrice" class="tits">
							<span class="material-symbols-outlined"> location_on </span>배송지
						</h3>
						<h3 class="totalPrice"><%= address %></h3>
						<br>
						<br>
						<!-- <button type="button"><p>배송지 변경</p></button> -->
						<a href="">배송지 변경</a>
					</div>
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">상품금액</dt>
							<dd class="price">
								<span class="num noDiscount"></span>
								<!-- product price here-->
								<span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">상품할인금액</dt>
							<dd class="price">
								<span class="num difference">0</span> <span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">배송비</dt>
							<dd class="price">
								<span class="num">3,000</span> <span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount lst">
							<dt class="tit">상품금액</dt>
							<dd class="price">
								<span class="num countMoney">6,000</span>
								<!-- sum of product price here -->
								<span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount lst">
							<dt class="tit" style="font-weight: 800;">결제예정금액</dt>
							<dd class="price">
								<span class="num pays">6,000</span>
								<!-- sum of product price here -->
								<span class="won">원</span>
							</dd>
						</dl>
						<div class="reserve">
							<span class="bage">적립</span>구매 시 <span class="emph">325원
								적립</span>
							<!-- 계산된 적립금(총금액의 20%)^.-->
						</div>
					</div>
					<!-- 계산 필요 . -->
					<div class="btn_submit">
						<button type="button" onclick="orderPay()" class="btn active orderBtn">주문하기</button>
						<!-- 결제 페이지로 이동 -->
					</div>
					<div class="notice">
						<span class="txt"> <span class="ico">·</span>쿠폰/적립금은 주문서에서
							사용 가능합니다
						</span> <span class="txt"> <span class="ico">·</span>‘입금확인’ 상태일 때는
							주문 내역 상세에서 직접 주문취소가 가능합니다.
						</span> <span class="txt"> <span class="ico">·</span>‘입금확인’ 이후
							상태에는 고객센터로 문의해주세요.

						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
		<script>
		// 최조 랜더링시 총액 보여주는 용도
		
		
		
		
		// 할인된 총 금액 담을 변수
		let sumMoney = 0;
		// 원가 총 금액 담을 변수
		let sumNoDis = 0;
		console.log($('.totalprice').text());
		$('.in_price').each(function() {
		  var totalMoneyVal = $(this).find('.totalMoney').val();
		  var noDisMoney = $(this).find('.noDisTotal').val();
		  sumMoney += Number(totalMoneyVal);
		  sumNoDis += Number(noDisMoney)
		});
		
		$('.countMoney').text(sumMoney);
		$('.noDiscount').text(sumNoDis);
		$('.difference').text(sumNoDis - sumMoney);
		$('.pays').text(sumMoney + 3000);
		
		
		$.ajax({
			
			url: "count",
			type: "get",
			success: function(res) {
				$('.itemCount').text(res);
			},
			error: function(err) {
				console.log(err);
			}
			
		})
		
		// 결제기능
		function orderPay(){
			let countMoney9 = $('.pays').text();
			let itemList9 = $('.package').text()
			let userName9 = $('.join').text()
			let orderAddress9 = $('.totalprice').text();
			// console.log($('.join').text());
			
			IMP.init('imp68338217');
			IMP.request_pay({
			    pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : itemList9 , //결제창에서 보여질 이름
			    amount : countMoney9, //실제 결제되는 가격
			    buyer_email : 'test888@test.do',
			    buyer_name : userName9,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : orderAddress9,
			    buyer_postcode : '123-456'
			}, function(rsp) {
				// console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			    	insertOrder(rsp.imp_uid);
			        // location.href = '/orderComplete';
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}

		// 주문완료시 order 테이블에 상품 담는 용도
		function insertOrder(orderUid) {
			$.ajax({
				
				url: "insertOrder",
				type: "post",
				data: {
					totalPay: parseInt($('.countMoney').text()),
					orderUid: orderUid
				},
				success: function(res) {
					insertItemList();
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		
		
		function insertItemList() {
			$.ajax({
				
				url: "insertListItem",
				type: "post",
				success: function(res) {
					deleteCart();
				},
				error: function(err) {
					console.log(err);
				}
				
			})
		}
		
		
		function deleteCart() {
			
			$.ajax({
				
				url: "DeleteCart",
				type: "post",
				success: function(res) {
					location.reload();
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
	</script>
</body>
</html>