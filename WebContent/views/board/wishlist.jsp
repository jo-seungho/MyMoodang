<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.user.board.wishlist.model.vo.WishList, 
    com.kh.common.model.vo.PageInfo, java.util.ArrayList"
%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<WishList> list = (ArrayList<WishList>)request.getAttribute("list");
	
	// 자주 쓰일법한 변수들 셋팅
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

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/board/wishlist.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <title>찜한 상품</title>
  </head>
  <body>
		<%@ include file="../common/header.jsp" %>

         <!-- 사이드 메뉴바 시작 -->
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="page_aticle aticle_type2">
                    <div id="mypage_side" class="snb_my" style="position: absolute;">
                        <h2 class="tit_snb">마이페이지</h2>
                        <div class="inner_sub">
                            <ul class="list_menu">
                                <li>
                                    <a href="/orderList.it">주문내역</a>
                                </li>
                                <li  class="on">
                                    <a href="/wishList.wi">찜한 상품</a>
                                </li>
                                <li>
                                    <a href="/deliveryList.do">배송지 관리</a>
                                </li>
                                <li>
                                    <a href="/ready">리뷰 관리</a>
                                </li>
                                <li>
                                    <a href="/ready">쿠폰</a>
                                </li>
                                <li>
                                    <a href="/updateCheckPwd.me">내 정보 수정</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="viewOrderList" class="page_section section_orderlist">

                        <div id="viewOrderList" class="page_section section_orderlist">

                            <!-- 주문내역 페이지 시작 -->
                          <div id="viewOrderList">
                              <div class="head_aticle">
                                  <h2 class="tit">
                                      찜한 상품
                                      <span class="tit_sub">
                                          찜한 상품은 최대 200개 까지 저장됩니다.
                                      </span>
                                  </h2>
                              </div>
                              <ul class="list_order">
                                  <li>
                                      <div class="order_goods">



										<% if(list.isEmpty())  { %>
                                             <br>
                                             <h1 align="center"> 찜목록이 존재하지 않습니다.</h1>
                                             <hr><br>
                                             <a href="/itemList.it?currentPage=1&category=전체"><h1 align="center" style="color : red"> 상품 보러 가기</h1></a>	
                                             <br>
                                      <!-- 상품 1개의 정보 -->
                                             <% } else { %>
                                             	<%  for(WishList w : list) { %>
                                             <div class="order_info">
                                          <div class="thumb">
                                          
                                            <a href="/itemDetail.it?bno=<%= w.getItemCode() %>"><img src="<%= w.getItemImgPath() %>" alt="대표 찜한 상품 이미지"></a>

                                            </div>
                                             
                                             <div class="desc">
                                                    <dl>
                                                        <a href="/itemDetail.it?bno=<%= w.getItemCode() %>"><dt>상품명</dt>
                                                         <dd><%= w.getItemName() %></dd>
                                                         
                                                        </a> 	
                                                    </dl>
                                                    <dl>
                                                        <dt>가격 :</dt>
                                                        <dd><%= w.getDiscountPrice() %>원</dd>
                                                        <input type="hidden" value="<%= w.getDiscountPrice() %>" id="disprice">
                                                    </dl>
                                              </div>
                                              
                                              <br><br><br>	
                                              <div class="wish_status">
                                                <span class="inner_status">
                                                    <a id="delete" href="#" onclick="removeFromWishlist(<%= w.getItemCode() %>)">삭제</a> <br>
                                                    <a id="cart_in" href="#" onclick="insertCart(<%=w.getItemCode() %>); removeFromWishlist(<%= w.getItemCode() %>);">
                                                    <span class="material-symbols-outlined">
                                                        shopping_cart
                                                        </span> 담기</span>
                                                   </a>
                                                </span>
                                               </div>
                                               
                                          </div>
                                          <hr>
                                          	<% } %>
                                          <% } %>
                                          
                                            <!-- 상품 1개의 정보 끝-->
                                          
                                        </div>
                                  </li>
                              </ul>
                              
                              <div align="center" class="paging-area">
								 
		        <div class="layout-pagination">
							<div class="pagediv">
								<% if(currentPage != 1) { %>
								<a href="/bestItemList.it?currentPage=<%= startPage %>"
									class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기
								</a>
								<a href="/bestItemList.it?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page">
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
								<a href="/bestItemList.it?currentPage=<%= p %>">
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
								 <a href="/bestItemList.it?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page">
								 다음 페이지로 가기
								 </a>
								 <a href="/bestItemList.it?currentPage=<%= endPage %>" class="layout-pagination-button layout-pagination-last-page">
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

			<%@ include file="../common/footer.jsp" %>
			
			<script>
			
			
			
			
			
			// 장바구니 담기 2023-04-23 조승호
         	function insertCart(code) {
         		
         		let priceItem = $('#disprice').val();

         		$.ajax({
         			
         			url: "/cartList",
         			type: "post",
         			data: {
    					itemCodeNo: code,
    					countValue: 1,
    					priceItem: priceItem
         			},
         			success: function(res) {
         				console.log(res);
    					alert('물품을 장바구니에 담았습니다!');
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
         			},
         			error: function(err) {
         				
         			}
         		});
         	}
			
			function removeFromWishlist(code) {
          	    $.ajax({
          	      url: "/heart.wi",
          	      type: "POST",
          	      data: {
          	        action: "remove",
          	        code: code
          	      },
          	      success: function(response) {
          	    	window.location.reload();
          	      }
          	    });
          	  }
			
			</script>

  </body>
</html>
