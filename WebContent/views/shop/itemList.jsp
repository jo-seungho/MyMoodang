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
<link rel="stylesheet" href="/resources/css/shop/itemList.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

							<ul class="list">
								<li name="cate_gory"><a class="on" href="/itemList.it?currentPage=1&category=전체">전체보기</a></li>
								<li name="cate_gory"><a href="/itemList.it?currentPage=1&category=제로음료" class=>제로음료</a></li>
								<li name="cate_gory"><a href="/itemList.it?currentPage=1&category=무가당" class=>무가당</a></li>
								<li name="cate_gory"><a href="/itemList.it?currentPage=1&category=단백질" class=>단백질</a></li>
								<li name="cate_gory"><a href="/itemList.it?currentPage=1&category=도시락" class=>도시락</a></li>
								<li name="cate_gory"><a href="/itemList.it?currentPage=1&category=기타" class=>기타</a></li>
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
													<button type="button" name="chk" value="여기다가 프로덕트 아이디 적어주삼"
														class="btn btn_cart">
														<span class="screen_out">38300</span>
													</button>
												</div>
											</div>

											<a href="/itemDetail.it?bno=<%= i.getItemCode() %>" class="info"> 
											<span class="name"> <%= i.getItemName() %> </span> 
											<span class="cost"> <span class="price"><%= i.getItemPrice() %></span> 
											<input type="hidden" id="product_cost1" value=1300> 
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
				<form action="" method="POST" id="contactsForm">
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
													<input type="hidden" class="count_num">1
												</div>
												<button type="button" class="btn up on">수량올리기</button>
											</span> <span class="price"> <span class="dc_price"></span>
											</span>
										</div></li>
								</ul>
							</div>

							<div class="total">
								<div class="price">
									<strong class="tit">합계</strong> <span class="sum"> <span
										class="num">1,300</span> <span class="won">원</span>
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
								<button type="submit" value="3" class="txt_type">장바구니
									담기</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>

		/*
			//$(function() {

				$(".info").click(function() {
					location.href = "/item.it";

				});
			});
		*/
		</script>




		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>