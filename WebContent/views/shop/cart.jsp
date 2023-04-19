<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- header css -->

<link rel="stylesheet" href="/resources/css/common/reset.css" />
<link rel="stylesheet" href="/resources/css/common/header.css" />
<link rel="stylesheet" href="/resources/css/shop/list.bundle.css">
<link rel="stylesheet" href="/resources/css/shop/payment_order.css">
<link rel="stylesheet" href="/resources/css/shop/cart1.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/js/common/header.js"></script>
<script src="/resources/js/shop/payment.js"></script>

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
					<div class="inner_select">
						<label class="check"> <input type="checkbox"
							name="checkAll" class="checkAll" onclick="sel_all(this)">
							<span class="ico"></span>전체선택 (1/1)
						</label> <a href="#none" class="btn_delete">선택삭제</a>
					</div>
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
						<li>
							<!-- 상품 목록 중 1. 추가/삭제될 목록임. -->
							<div class="item">
								<label class="check" for="chkItem1"> <!-- 개당 체크박스 --> <input
									onclick='check_sel_all(this)' type="checkbox" id="chkItem1"
									name="checkOne" class="checkOne"
									data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
									data-item-no="65810" data-item-parent-no="65810"> <span
									class="ico"></span>
								</label>

								<div class="name">
									<div class="inner_name">
										<a href="#" class="package ">[채소] 감자</a>
										<div class="info"></div>
									</div>
									<div class="goods">
										<a href="#" class="thumb "
											style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610599300495i0.jpg&quot;);">상품이미지</a>
										<!-- 이미지자리 ^-->
										<div class="price">
											<div class="in_price">
												<input class="selling1" type="hidden" value="6000">
												<span class="selling">6000 <span class="won">원</span>
												</span>
												<p class="noti"></p>
											</div>
											<!-- 개수 조정 부분. -->
											<div class="stamper count">
												<button type="button" class="btn minus off"
													data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
													data-item-no="65810" data-opt="decrease">감소</button>
												<input type="text" id="stepperCounter" class="num"
													readonly="" value="1">
												<button type="button" class="btn plus"
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

						<li>
							<!-- 상품 목록 중 1. 추가/삭제될 목록임. -->
							<div class="item">
								<label class="check" for="chkItem1"> <!-- 개당 체크박스 --> <input
									onclick='check_sel_all(this)' type="checkbox" id="chkItem1"
									name="checkOne" class="checkOne"
									data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
									data-item-no="65810" data-item-parent-no="65810"> <span
									class="ico"></span>
								</label>

								<div class="name">
									<div class="inner_name">
										<a href="#" class="package ">[채소] 감자</a>
										<div class="info"></div>
									</div>
									<div class="goods">
										<a href="#" class="thumb "
											style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610599300495i0.jpg&quot;);">상품이미지</a>
										<!-- 이미지자리 ^-->
										<div class="price">
											<div class="in_price">
												<input class="selling1" type="hidden" value="3000">
												<span class="selling">3000 <span class="won">원</span>
												</span>
												<p class="noti"></p>
											</div>
											<!-- 개수 조정 부분. -->
											<div class="stamper count">
												<button type="button" class="btn minus off"
													data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
													data-item-no="65810" data-opt="decrease">감소</button>
												<input type="text" id="stepperCounter" class="num"
													readonly="" value="1">
												<button type="button" class="btn plus"
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
						<!--1끝-->

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
						<h3 class="totalPrice">서울특별시 영등포구 선유동2로 57 이레빌딩</h3>
						<br>
						<br>
						<!-- <button type="button"><p>배송지 변경</p></button> -->
						<a href="">배송지 변경</a>
					</div>
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">상품금액</dt>
							<dd class="price">
								<span class="num">6,000</span>
								<!-- product price here-->
								<span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">상품할인금액</dt>
							<dd class="price">
								<span class="num">0</span> <span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">배송비</dt>
							<dd class="price">
								<span class="num">0</span> <span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount lst">
							<dt class="tit">결제예정금액</dt>
							<dd class="price">
								<span class="num">6,000</span>
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
						<button type="submit" class="btn active orderBtn">주문하기</button>
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
	 $(document).ready(function() {
		 
		 $.ajax({
			url: "cart",
			type: "get",
			success: function(res) {
				console.log(res);
				console.log("GO");
			},
			error: function(err){
				console.log(err);
				console.log("FUCK");
			}
			 
			 
			 
		 })
		 
		 
		 
		 
	 })
	</script>
	
</body>
</html>