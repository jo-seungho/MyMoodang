<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.user.shop.item.model.vo.Item, com.kh.common.model.vo.PageInfo"%>
	
<%-- 2023-04-16 조승호 --%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Item> list = (ArrayList<Item>) request.getAttribute("list");

	String category = (String)request.getAttribute("category");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/shop/itemList.css" />
<script src="/resources/js/shop/itemList.js"></script>

<title>상품 리스트</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp"%>
		<div id="main">
			<div id="contents">
				<div class="page_aticle">
					<div id="lnbMenu" class="lnb_menu">
						<div class="inner_lnb">
							<div class="ico_cate">
								<span class="ico" style="display: block;"> <img
									src="/resources/img/logo.png" alt="카테고리 아이콘">
									<p>${category}</p>
									<p><%= category %></p>
								</span> <span class="tit">전체보기</span>
							</div>

							<ul id="colorTest" class="list">
								<li name="cate_gory"><a class="totalList on" href="/itemList.it?currentPage=1&category=전체">전체보기</a></li>
								<li name="cate_gory"><a class="zeroDrink" href="/itemList.it?currentPage=1&category=제로음료" class=>제로음료</a></li>
								<li name="cate_gory"><a class="zeroSugar" href="/itemList.it?currentPage=1&category=무가당" class=>무가당</a></li>
								<li name="cate_gory"><a class="protein" href="/itemList.it?currentPage=1&category=단백질" class=>단백질</a></li>
								<li name="cate_gory"><a class="bentto" href="/itemList.it?currentPage=1&category=도시락" class=>도시락</a></li>
								<li name="cate_gory"><a class="etcList" href="/itemList.it?currentPage=1&category=기타" class=>기타</a></li>
							</ul>
						</div>
					</div>


					<div id="goodsList" class="page_section section_goodslist">
						<div class="list_ability"></div>


						<div class="list_goods">
							<div class="inner_listgoods">
								<ul class="list">
									<!-- 여기서 부터 물건 리스트-->

									<%
										if (list.isEmpty()) {
									%>
									<div class="item">등록된 상품이 없습니다.</div>
									<%
										} else {
									%>
									<%
										for (Item i : list) {
									%>
									<li>
										<div class="item">
											<div class="thumb">
												<a
													href="/itemDetail.it?bno=<%= i.getItemCode() %>"
													class="img"
													style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1567574126435l0.jpg);">
													<img src="<%= i.getItemImg() %>"
													onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
													width="308" height="396">
												</a>

												<div class="group_btn">
													<button type="button" name="chk" onclick="showCartModal(<%= i.getItemCode() %>);"
														class="btn btn_cart">
														<span class="screen_out">38300</span>
													</button>
												</div>
											</div>

											<div class="plz" style="visibility: hidden"><%= i.getItemCode() %></div>
											<a href="/itemDetail.it?bno=<%= i.getItemCode() %>" class="">
											<!-- 주소 연결 이슈로 bno 클래스 임시로 삭제해뒀습니다.  - 조승호 -->
											<span class="name"> <%= i.getItemName() %> </span>
											<span class="cost"> <span class="price"><%= (int)(Math.log10(i.getItemPrice())+1) > 3
																					  ?  Integer.toString(i.getItemPrice()).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")
																					  : i.getItemPrice()	  
											%></span>
											<input type="hidden" id="product_cost1" value="<%= i.getItemPrice() %>">
											<span class="dodo">원</span>
											</span> <span class="desc"><%= i.getItemText() %></span>
											<span class="tag"><%-- 수량이나 날짜 등 필요하면 이 위치에 --%></span>
											</a>
										</div>
									</li>
									<%
										}
									%>
									<%
										}
									%>

								</ul>
							</div>
						</div>



						<div class="layout-pagination">
							<div class="pagediv">
								<% if(currentPage != 1) { %>

								<a href="/itemList.it?currentPage=<%= startPage %>&category=${category}"

									class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기
								</a>
								<a href="/itemList.total?currentPage=<%= currentPage - 1 %>&category=${category}" class="layout-pagination-button layout-pagination-prev-page">
									이전 페이지로 가기
								</a>
								<% } else {%>
								<a href="javascript:void(0)"
									class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기
								</a>
								<a href="javascript:void(0)" class="layout-pagination-button layout-pagination-prev-page">
									이전 페이지로 가기
								</a>
								<% } %>
								<% for(int p = startPage; p <= endPage; p++) { %>
									<% if(p != currentPage) { %>

								<a href="/itemList.it?currentPage=<%= p %>&category=${category}">

									<span>
										<strong class="layout-pagination-button layout-pagination-number __active"><%= p %></strong>
									</span>
								</a>
									<% } else { %>
									<span>
										<strong class="layout-pagination-button layout-pagination-number __active"
										style="background-color: #fbb6b6;"><%= p %></strong>
									</span>
									<% } %>
								<% } %>
								<% if(currentPage != maxPage) { %>

								 <a href="/itemList.it?currentPage=<%= currentPage + 1 %>&category=${category}" class="layout-pagination-button layout-pagination-next-page">
								 다음 페이지로 가기
								 </a>
								 <a href="/itemList.it?currentPage=<%= endPage %>&category=${category}" class="layout-pagination-button layout-pagination-last-page">

								 맨끝 페이지로 가기
								 </a>
								 <% } else { %>
								<a href="javascript:void(0)" class="layout-pagination-button layout-pagination-next-page">
									다음 페이지로 가기
								</a>
								<a href="javascript:void(0)" class="layout-pagination-button layout-pagination-last-page">
								 맨끝 페이지로 가기
								 </a>
								 <% } %>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="cartPut">
			<div class="cart_option cart_type3" style="opacity: 1;">
				<form action="cart" method="post" id="contactsForm">
				 <input type="hidden" name="itemCode" value="">
					<div class="inner_option">
						<div class="in_option">
							<div class="list_goods">
								<ul class="list list_nopackage">
									<li class="on"><span class="name"> </span>
										<div class="option">
											<span class="count">
												<button type="button" class="btn down on">수량내리기</button> <input
												type="text" readonly="readonly" name="count" value=1
												class="inp">
												<div style="display: none;">
													<input id="countValue" name="countValue" type="hidden" class="count_num">1
												</div>
												<button type="button" class="btn up on">수량올리기</button>
											</span> 
											<span class="price"> 
												<span class="dc_price"></span>
												<input type="hidden" class="ttt">
											</span>
										</div></li>
								</ul>
							</div>

							<div class="total">
								<div class="price">
									<strong class="tit">합계</strong> <span class="sum"> <span
										class="num totalPrice">1,300</span> <span class="won">원</span>
									</span>
								</div>

								<p class="txt_point">
									<span class="ico">적립</span> <span class="point"> 구매 시 <strong
										class="emph">65원 적립</strong>
									</span>
								</p>
							</div>
						</div>

						<div class="group_btn off layer_btn2">
							<span class="btn_type2">
								<button type="button" class="txt_type">취소</button>
							</span> <span class="btn_type1">

								<button type="button" value="3" class="txt_type goCart">장바구니
									담기</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>


		<%@ include file="../common/footer.jsp"%>

	</div>
	
	<script>
		function showCartModal(itemCode) {
			// 가격남음
			$("#cartPut input[name=itemCode]").val(itemCode);
			console.log(itemCode);
			// console.log($('.total > .totalPrice').text(), 8888)
			console.log($("#countValue").text());
			
		}
		
		$('.btn_type1').click(function() {
			
			// let itemCodeNo = $('#cartPut input[name=itemCode]').val();
			let aa = $('.ttt').text()
			let priceItem = Number(aa.replace(",", ""))
			
			$.ajax({
				
				url: 'cartList',
				type: 'post',
				data: {
					itemCodeNo: $('#cartPut input[name=itemCode]').val(),
					countValue: $("#countValue").text(),
					priceItem: priceItem
				},
				success: function() {
					alert('물품을 장바구니에 담았습니다!');
					// console.log(res)
				},
				error: function(err) {
					console.log(err, "err")
				}
			})
			
		})
	</script>
</body>
</html>