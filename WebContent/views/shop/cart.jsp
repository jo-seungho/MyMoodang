<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="java.util.ArrayList, com.kh.user.shop.cart.model.vo.Cart"%>

<%
	ArrayList<Cart> list = (ArrayList<Cart>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- �ߺ��Ǵ� ���, Ǫ��, ���� css & �������� & ��� js ���� common.jsp / 2023-04-20 �輭�� -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/shop/list.bundle.css">
<link rel="stylesheet" href="/resources/css/shop/payment_order.css">
<link rel="stylesheet" href="/resources/css/shop/cart1.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="/resources/js/shop/payment.js"></script>

<title>��ٱ���</title>
</head>
<body>
	<!-- jsp ��ȯ / 2023-04-14 / �輭�� -->

	<%@ include file="../common/header.jsp"%>

	<div id="Container-Wrapper">
		<!-- �ֹ����� ������ ���� ���� -->
		<div class="title_pay_head">
			<h1 align="center" class="title_desc"
				style="margin: 40px 0; font-size: xx-large;">��ٱ���</h1>
		</div>
		<div id="cartItemList" class="only_pc">
			<div class="cart_item ">

				<div class="cart_select">
					<div class="inner_select">
						<label class="check"> <input type="checkbox"
							name="checkAll" class="checkAll" onclick="sel_all(this)">
							<span class="ico"></span>��ü����
						</label> <a href="#none" class="btn_delete">���û���</a>
					</div>
				</div>
				<div class="box cold">
					<div class="tit_box">
						<h4 class="tit">
							<span class="inner_tit">��ǰ ���</span>
						</h4>
						<button type="button" id='btn_dropup' class="btn_dropup"
							onclick="dropup()">���� / ��ġ��</button>

					</div>


					<ul class="list" id='dropup_list'>

						<% if(list.isEmpty()) { %>
							<div class="noData">��ϵ� ��ǰ�� �����ϴ�.</div>
						<% } else { %>

							<% for(Cart c : list) { %>
							<li>
								<!-- ��ǰ ��� �� 1. �߰�/������ �����. -->
								<div class="item">
									<label class="check" for="chkItem1"> <!-- ���� üũ�ڽ� --> <input
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
											<a href="#" class="thumb "
												style="background-image: url(<%= c.getImgPath() %>);">
												</a>
											<!-- �̹����ڸ� ^-->
											<div class="price">
												<div class="in_price">
													<input class="selling1" type="hidden" value="<%= c.getPrice() %>">
													<span class="selling"><%= c.getTotalPrice() %> <span class="won">��</span>
													<input class="totalMoney" type="hidden" value="<%= c.getTotalPrice() %>">
													</span>
													<p class="noti"></p>
												</div>
												<!-- ���� ���� �κ�. -->
												<div class="stamper count">
													<button type="button" class="btn minus off"
														data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
														data-item-no="65810" data-opt="decrease">����</button>
													<input type="text" id="stepperCounter" class="num" value="<%= c.getCartStock() %>">
													<button type="button" class="btn plus plusAdd"
														data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
														data-item-no="65810" data-opt="increase">�߰�</button>
												</div>
											</div>
										</div>
										<!-- ��ǰ ���� �� db�ݿ� (btn_delete)-->
										<button type="button" onclick="del_row(this)"
											class="btn_delete"
											data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2"
											data-item-no="65810" data-type="cold">��ǰ ����</button>
									</div>
								</div>
							</li>
						  <% } %>
						<% } %>


						<!-- """�ؿ� �ڵ�� ��ٱ��� �����Ͱ� �ϳ��� ���� ��� ����ϵ��� ���� �ٶ�.(cart_empty.html ����)"""
                            <div class="inner_empty"><span class="bg"></span>
                            <p class="txt">��ٱ��Ͽ� ��� ��ǰ�� �����ϴ�</p></div>
     -->
					</ul>
				</div>


			</div>
			<div class="cart_result">
				<div class="inner_result">
					<div class="cart_delivery">
						<h3 id="payPrice" class="tits">
							<span class="material-symbols-outlined"> location_on </span>�����
						</h3>
						<h3 class="totalPrice">����Ư���� �������� ������2�� 57 �̷�����</h3>
						<br>
						<br>
						<!-- <button type="button"><p>����� ����</p></button> -->
						<a href="">����� ����</a>
					</div>
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">��ǰ�ݾ�</dt>
							<dd class="price">
								<span class="num">6,000</span>
								<!-- product price here-->
								<span class="won">��</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">��ǰ���αݾ�</dt>
							<dd class="price">
								<span class="num">0</span> <span class="won">��</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">��ۺ�</dt>
							<dd class="price">
								<span class="num">0</span> <span class="won">��</span>
							</dd>
						</dl>
						<dl class="amount lst">
							<dt class="tit">���������ݾ�</dt>
							<dd class="price">
								<span class="num countMoney">6,000</span>
								<!-- sum of product price here -->
								<span class="won">��</span>
							</dd>
						</dl>
						<div class="reserve">
							<span class="bage">����</span>���� �� <span class="emph">325��
								����</span>
							<!-- ���� ������(�ѱݾ��� 20%)^.-->
						</div>
					</div>
					<!-- ��� �ʿ� . -->
					<div class="btn_submit">
						<button type="submit" class="btn active orderBtn">�ֹ��ϱ�</button>
						<!-- ���� �������� �̵� -->
					</div>
					<div class="notice">
						<span class="txt"> <span class="ico">��</span>����/�������� �ֹ�������
							��� �����մϴ�
						</span> <span class="txt"> <span class="ico">��</span>���Ա�Ȯ�Ρ� ������ ����
							�ֹ� ���� �󼼿��� ���� �ֹ���Ұ� �����մϴ�.
						</span> <span class="txt"> <span class="ico">��</span>���Ա�Ȯ�Ρ� ����
							���¿��� �����ͷ� �������ּ���.

						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
		<script>
		let sumMoney = 0;
		$('.in_price').each(function() {
		  var totalMoneyVal = $(this).find('.totalMoney').val();
		  sumMoney += Number(totalMoneyVal)
		});
		console.log(sumMoney);
		$('.countMoney').text(sumMoney);

		$('.plusAdd').click(function() {

			$('.countMoney').text(sumMoney);
		})
	</script>
	 -->
	<script>
	$(document).on('click', '.plusAdd', function() {
		  var $input = $(this).prev('.num');
		  var currentValue = parseInt($input.val());
		  var totalPrice = parseInt($(this).closest('.price').find('.totalMoney').val());

		  console.log($input)
		  console.log(currentValue)
		  console.log(totalPrice)

		  // input ���� totalPrice �� ������Ʈ
		  // $input.val(currentValue + 1);
		  $(this).closest('.price').find('.totalMoney').val(totalPrice + parseInt($(this).closest('.price').find('.selling1').val()));
		});

		$(document).on('click', '.minus', function() {
		  var $input = $(this).next('.num');
		  var currentValue = parseInt($input.val());
		  var totalPrice = parseInt($(this).closest('.price').find('.totalMoney').val());

		  // input ���� totalPrice �� ������Ʈ
		  if(currentValue > 1) {
		    $input.val(currentValue - 1);
		    $(this).closest('.price').find('.totalMoney').val(totalPrice - parseInt($(this).closest('.price').find('.selling1').val()));
		  }
		});

		// ������ �ε�� �ʱⰪ ����
		$('.totalMoney').each(function() {
		  var totalPrice = parseInt($(this).val());
		  var currentValue = parseInt($(this).closest('.price').find('.num').val());
		  $(this).closest('.price').find('.num').val(currentValue);
		});

	</script>


</body>
</html>