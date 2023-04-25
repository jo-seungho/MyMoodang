<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,java.util.Arrays, com.kh.user.shop.order.model.vo.Order"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	
	int[] orderNos = new int[list.size()];
	int index = 0;
	int totalPrice = 0;
	String uid = "";
	String name = "";
	String date = "";
	String phone = "";
	String address = "";
	
	
	for(Order o : list) {
		orderNos[index++] = o.getOrderNo();
		totalPrice = o.getPaymentAmount();
		uid = o.getTrackingNo();
		name = o.getMemberName();
		date = o.getOrderDate();
		phone = o.getResPhone();
		address = o.getAddress();
	}
	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" href="/resources/css/shop/payment_order.css">
<link rel="stylesheet" href="/resources/css/shop/list.bundle.css">
<link rel="stylesheet" href="/resources/css/shop/cart1.css">
<link rel="stylesheet" href="/resources/css/shop/orderComplete.css">

<script src="/resources/js/shop/payment.js"></script>




<title>주문내역</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div id="container" style="margin-top: 40px;">

		<div id="main" class="order_complete">
			<div id="content">

				<div class="page_aticle aticle_type2">


					<div class="section_orderview">
						<div class="head_aticle">
							<h2 class="tit">주문내역</h2>
						</div>
						
						<div class="head_section link_type">
							<h3 class="tit">주문번호 : <%= orderNos[0] %></h3>
							<span class="link"> 배송 또는 상품에 문제가 있나요? <a href="/list.in">1:1
									문의하기</a>
							</span>
						</div>

						<form name="frmOrdView" method="POST" action="">
							<table class="tbl tbl_type1">
								<colgroup>
									<col style="width: 80px;">
									<col style="width: auto">
									<col style="width: 100px;">
									<col style="width: 136px;">
								</colgroup>

								<tbody>
								
								
								<!-- 상품내역 -->
								<% for(Order or : list) { %>
									<tr>
										<td class="thumb">
											<img src="<%= or.getItemImg() %>">
										</td>
										<td class="info">
											<div class="name">
												<a href="javascript:void(0)" class="link">[<%= or.getItemName() %>]</a>
											</div>
											<div class="desc">
												<span class="price"><%= (int)(Math.log10(or.getItemPrice())+1) > 3
														  ?  Integer.toString(or.getItemPrice()).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")
														  : or.getItemPrice() %>원</span> <span class="ea">수량 : <%= or.getQuantity() %></span>
											</div>
										</td>
										<td class="progress" colspan="2"><span class="end"> 결제완료 </span></td>
									</tr>
								  <% } %>	
								<!-- 상품내역 끝 -->
								</tbody>
							</table>
						</form>

						<div class="head_section ">
							<h3 class="tit">결제정보</h3>
						</div>

						<table class="tbl tbl_type2 tbl_type3">
							<colgroup>
								<col style="width: 160px">
								<col style="width: auto">
							</colgroup>

							<tbody>
								<tr>
									<th>상품금액</th>
									<td><span id="paper_goodsprice"> <%= (int)(Math.log10(totalPrice)+1) > 3
														  ?  Integer.toString(totalPrice).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")
														  : totalPrice %> </span> 원</td>
								</tr>

								<tr>
									<th>배송비</th>
									<td><span id="paper_delivery_msg1"> 3,000 </span> 원</td>
								</tr>

								<tr>
									<th>결제금액</th>
									<td><span id="paper_settlement"> <%= (int)(Math.log10(totalPrice)+1) > 3
														  ?  Integer.toString(totalPrice + 3000).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")
														  : totalPrice %> </span> 원</td>
								</tr>

								<tr>
									<th>결제방법</th>
									<td>카카오페이</td>
								</tr>


							</tbody>
						</table>

						<div class="head_section">
							<h3 class="tit">주문정보</h3>
						</div>

						<table class="tbl tbl_type2">
							<colgroup>
								<col style="width: 160px">
								<col style="width: auto">
							</colgroup>

							<tbody>
								<tr>
									<th>주문 번호</th>
									<td>[<%= uid %>]</td>
								</tr>

								<tr>
									<th>주문자명</th>
									<td>[<%= name %>]</td>
								</tr>

								<tr>
									<th>보내는 분</th>
									<td>[<%= name %>]</td>
								</tr>

								<tr>
									<th>결제일시</th>
									<td>[<%= date %>]</td>
								</tr>
							</tbody>
						</table>

						<div class="head_section">
							<h3 class="tit">배송 정보</h3>
						</div>

						<table class="tbl tbl_type2">
							<colgroup>
								<col style="width: 160px">
								<col style="width: auto">
							</colgroup>

							<tbody>
								<tr>
									<th>받는 분</th>
									<td>[<%= name %>]</td>
								</tr>

								<tr>
									<th>핸드폰</th>
									<td><%= phone %></td>
								</tr>

								<tr>
									<th>주소</th>
									<td><%= address %></td>
								</tr>

								<tr>
									<th>받으실 장소</th>
									<td>문 앞</td>
								</tr>

							</tbody>
						</table>



					</div>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>