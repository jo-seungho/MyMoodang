<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page
	import="com.kh.common.model.vo.PageInfo,
				 java.util.ArrayList,
				 com.kh.user.shop.order.model.vo.OrderList,
				 com.kh.user.shop.order.model.vo.OrderImg"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<OrderList> list = (ArrayList<OrderList>)request.getAttribute("list");
	OrderImg img = (OrderImg)request.getAttribute("img");


	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


    <%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/shop/order_list.css">

    <title>주문 내역</title>
  </head>
  <body>

  <%@ include file="../common/header.jsp" %>

            <div class="cart_count">
              <!-- bg url 아이콘 추가 -->
              <a href="#" class="btn_cart">
                <span class="blind">장바구니</span>
              </a>
            </div>
          </ul>
        </div>
      </div>
    <div id="Container-Wrapper">
    <!-- 주문내역 페이지 영역 시작 -->
      <div id="container">
          <div id="main">
              <div id="content">
                  <div class="page_aticle aticle_type2">
                      <div id="snb" class="snb_my" style="position: absolute;">
                          <h2 class="tit_snb">마이페이지</h2>
                          <div class="inner_sub">
                              <ul class="list_menu">

                                  <li>

                                      <a href="/orderList.it"  class="on">주문내역</a>
                                  </li>
                                  <li>
                                      <a href="/wishList.wi">찜한상품</a>
                                  </li>
                                  <li >
                                      <a href="/deliveryList.do">배송지관리</a>
                                  </li>
                                  <li>
                                      <a href="/ready">리뷰 관리</a>
                                  </li>
                                  <li>
                                      <a href="/ready">쿠폰</a>
                                  </li>
                                  <li>
                                      <a href="/updateCheckPwd.me" class="list_item">내 정보 수정</a>
                                  </li>
                              </ul>
                          </div>
                          <!-- <a href="#" class="link_inquire">
                              <span class="emph">도움이 필요하신가요?</span>
                              1:1 문의하기
                          </a> -->
                      </div>
                      <div id="viewOrderList" class="page_section section_orderlist">

                      <!-- 주문내역 페이지 시작 -->
                    <div id="viewOrderList" class="page_section section_orderlist">
                        <div class="head_aticle">
                            <h2 class="tit">
                                주문 내역
                                <span class="tit_sub">
                                    지난 3년간의 주문 내역 조회가 가능합니다.
                                </span>
                            </h2>
                        </div>
                        <ul class="list_order">

                        <% if(list.isEmpty()) { %>
										<tr>
											<td colspan="4" align="center">조회된 주문내역이 없습니다.</td>
										</tr>
						<% } else { %>

							<% for(OrderList ol : list) { %>
                            <li>
                                <div class="date"><%= ol.getOrderDate()  %></div>
                                <div class="order_goods">
                                    <div class="name">
                                        <a href="" style="font-size: large; font-weight: bolder; color: rgb(254, 116, 119);"><%= ol.getOrderStatus() %></a>
                                        <a href="/orderComplete?ono=<%= ol.getOrderNo() %>" style="float:right, padding : 0px 5px">주문 상세보기</a>
                                    </div>
                                <!-- 상품 1개의 정보 -->
                                  <div class="order_info">
                                    <div class="thumb">
                                      <img src="<%= img.getItemImgPath() %>" alt="해당 주문 대표 상품 이미지">

                                        </div>
                                        <div class="desc">
                                          <dl>
                                            <dt>상품명</dt>
                                            <dd><%= ol.getItemList() %></dd>
                                          </dl>
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd class="orderSelect"><%= ol.getOrderNo() %></dd>
                                            </dl>
                                            <dl>
                                              <dt>결제방법</dt>
                                              <dd>카카오페이</dd>
                                            </dl>
                                            <dl>
                                                <dt>결제금액</dt>
                                                <dd><%= ol.getTotalPrice() %></dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <!-- 상품 1개의 정보 끝-->

                                    <% } %>
                                  <% } %>
                                </div>

                            </li>
                        </ul>

							<div align="center" class="paging-area">

		                          <div class="layout-pagination">
		                            <div class="pagediv">

											<a href="/orderList.it?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>

										<span>
										<% for(int p = startPage; p <= endPage; p++) { %>

											<% if(p != currentPage) { %>

												<strong onclick="location.href = '/orderList.it?currentPage=<%= p %>';" class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
													<%= p %>
												</strong>
											<% } else { %>
												<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->

												<strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px; background-color: lightgray; "><%= p %></strong>
											<% } %>
										<% } %>
										</span>

                                			<a href="/orderList.it?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>

										</div>
									</div>

							</div>



                    </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    <!-- 주문내역 페이지 영역 끝 -->

<%@ include file="../common/footer.jsp"%>
      </div>
    </div>

  </body>
</html>
