<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.admin.shop.item.model.vo.*, java.util.ArrayList"%>
<%
	Item it = (Item) request.getAttribute("item");
	ArrayList<ItemImg> list = (ArrayList<ItemImg>) request.getAttribute("list");
	String noImage = "/resources/img/noimage.png";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><%= it.getItemName() %></title>

<%@ include file="common2.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/item_detail.css" />

<script src="/resources/js/shop/newItemDetail.js"></script>
<script src="/resources/js/common/header.js"></script>

</head>

<body class="sb-nav-fixed">
	<%@ include file="sidebar.jsp"%>

	<div id="layoutSidenav_content">
		<main style="height: 100%">
			<div class="container px-6 white">
				<div id="content" style="opacity: 1">
					<h2>관리자 상품 상세페이지</h2>
					<hr />
					<div class="section_view">
						<div id="sectionView">
							<div class="inner_view">
								<div class="thumb"
									style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png)">
									<img <% if (it.getItemImg() == null) { %>
										src="/resources/img/noimage.png" <% } else { %>
										src="<%= it.getItemImg()%>" <% } %> alt="상품 대표 이미지" class="bg" />
								</div>
								<p class="goods_name">
									<strong class="name"><%=it.getItemName()%> </strong>
								</p>

								<p class="goods_price">
									<span class="position"> 
									<span class="dc">
                                                    <span>
                                                        <span class="discount" style="font-size: 22px; font-weight: 400; color: red;"><%= (int)(it.getItemDiscount() * 100) %>%&nbsp;</span>
                                                    </span>
                                                    <span style="font-size: 15px; font-weight: 400; color: red;">
                                                        <del style="font-size: 18px; font-weight: 400; color: lightgray;"><%= it.getItemPrice() %>원 </del>
                                                        
                                                        
                                                    </span>
                                                    <span class="dc_price" style="font-size: 15px; font-weight: 400;">
                                                    <span class="won" style="font-size: 22px; margin-top: 10%;">&nbsp;<b><%= it.getDiscountPrice() %>원</b></span>
                                                	<input type="hidden" value="<%= it.getDiscountPrice() %>">
                                                	</span>
									</span>
								</p>
								<div class="goods_info">
									<dl class="list fst">
										<dt class="tit">정상가</dt>
										<dd class="desc"><%=it.getItemPrice()%>원
										</dd>
									</dl>
									<dl class="list">
										<dt class="tit">할인가</dt>
										<dd class="desc"><%=it.getDiscountPrice()%>원
										</dd>
									</dl>
									<dl class="list">
										<dt class="tit">할인율</dt>
										<dd class="desc"><%=it.getItemDiscount() * 100%>%
										</dd>
									</dl>
									<dl class="list">
										<dt class="tit">카테고리</dt>
										<dd class="desc"><%=it.getItemCategory()%></dd>
									</dl>
								</div>
							</div>
						</div>

						<div id="cartPut">
							<div class="cart_option cart_type2">
								<form action="/upItemForm.ad">
									<input type="hidden" name="code" value="<%=it.getItemCode()%>" />
									<div class="inner_option">
										<div class="in_option">
											<div class="list_goods">
												<ul class="list list_nopackage">
													<li class="on"><span class="tit_item">구매수량</span>
														<div class="option">
															<span class="count">
																<button type="button" class="btn down on">수량내리기</button>
																<input type="number" readonly="readonly" value="1"
																class="inp" />
																<button type="button" class="btn up on">수량올리기</button>
															</span>
														</div></li>
												</ul>
											</div>
											<div class="total">
												<div class="price">
													<strong class="tit">총 상품금액 :</strong> <span class="sum">
														<span class="num"></span> <span class="won"></span>
													</span>
												</div>
												<div class="hearts"></div>

												<p class="txt_point">
													<span class="ico">적립</span> <span class="point"> 구매
														시 <strong class="emph"></strong>
													</span>
												</p>

												<strong class="name" style="float: right; margin-left: 20px">
													<i class="fas fa-eye lg"></i> | <%=it.getItem_hits()%>
												</strong> 
											</div>
										</div>

										<br />
										<div class="insert-form">
											<div class="row justify-content-end">
												<div class="col-auto">
													<button type="submit" id="btn" class="btn btn2">상품수정</button>
												</div>
												<%
													if (it.getItemStatus().equals("Y")) {
												%>
												<div class="col-auto">
													<button type="button" id="btn" class="btn btn2 dbtn">판매중지</button>
												</div>
												<%
													} else {
												%>
												<div class="col-auto">
													<button type="button" id="btn" class="btn btn2 ubtn">판매재개</button>
												</div>
												<%
													}
												%>
												<div class="col-auto">
													<a href="/itemList.ad?page=1&category=a">
														<button type="button" id="btn" class="btn btn2">상품목록</button>
													</a>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="layout-wrapper goods-view-area">
						<div class="goods-add-product">
							<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
							<hr />
							<div class="goods-add-product-wrapper __slide-wrapper"
								data-slide-item="5">
								<button
									class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로
									슬라이드 이동</button>
								<button
									class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로
									슬라이드 이동</button>
								<div class="goods-add-product-list-wrapper"
									style="height: 320px">
									<ul class="goods-add-product-list __slide-mover"
										style="left: 0px">
										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>

										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>

										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>

										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>

										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>

										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="#" target="_blank"> <img
													src="https://res.kurly.com/mobile/img/1808/img_none_x2.png"
													class="goods-add-product-item-image" />
												</a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="goods-view-infomation detail_wrap_outer"
							id="goods-view-infomation">
							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a
									href="#goods-description"
									class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a
									href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지
								</a></li>
								<li class="goods-view-infomation-tab"><a
									href="#goods-review" class="goods-view-infomation-tab-anchor">
										고객후기 <span class="count_review">(0)</span>
								</a></li>
							</ul>
							<div class="goods-view-infomation-content __active"
								id="goods-description">
								<div class="goods_wrap">
									<div class="goods_intro">
										<div class="pic">
											<img <%if (list.size() < 2) {%> src="<%=noImage%>"
												<%} else {%> src="<%=list.get(1).getItemImgPath()%>" <%}%>
												style="width: 1010px; height: 671px" />
										</div>
										<div class="context last">
											<p class="words"><%=it.getItemText()%></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<ul class="goods-view-infomation-tab-group">
							<li class="goods-view-infomation-tab"><a
								href="#goods-description"
								class="goods-view-infomation-tab-anchor">상품설명</a></li>
							<li class="goods-view-infomation-tab"><a href="#goods-image"
								class="goods-view-infomation-tab-anchor __active">상품이미지</a></li>
							<li class="goods-view-infomation-tab"><a
								href="#goods-review" class="goods-view-infomation-tab-anchor">
									고객후기 <span class="count_review">(0)</span>
							</a></li>
						</ul>
						<div class="goods-view-infomation-content" id="goods-image">
							<div id="goods_pi">
								<p class="pic">
									<%
										int listSize = list.size();
									if (listSize < 3) {
									%>
									<img src="<%=noImage%>" id="smImg" />
									<%
										} else {
									%>
									<img src="<%=list.get(2).getItemImgPath()%>" />
									<%
										}
									if (listSize < 4) {
									%>
									<img src="<%=noImage%>" id="smImg" />
									<%
										} else {
									%>
									<img src="<%=list.get(3).getItemImgPath()%>" />
									<%
										}
									%>
								</p>
							</div>
						</div>

						<div class="happy_center fst">
							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a
									href="#goods-description"
									class="goods-view-infomation-tab-anchor">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a
									href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>

								<li class="goods-view-infomation-tab"><a
									href="#goods-review"
									class="goods-view-infomation-tab-anchor __active"> 고객후기 <span
										class="count_review">(0)</span>
								</a></li>
							</ul>
							<div class="goods-view-infomation-content" id="goods-review">
								<iframe src="" id="inreview" frameborder="0"
									class="goods-view-infomation-board" height="733"></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script>
                 $('.dbtn').click(function () {
                   if (confirm('정말 판매 중지 시키겠습니까?')) {
                     location.href = '/itemDelete.ad?code=<%=it.getItemCode()%>&status=N';
                     }
                   });

                 $('.ubtn').click(function () {
                     if (confirm('정말 판매 재개 시키겠습니까?')) {
                       location.href = '/itemDelete.ad?code=<%=it.getItemCode()%>&status=Y';
                       }
                     });

                 $(document).ready(function() {
                	  var code = <%= it.getItemCode() %>;
                	  var heartIcon = $(".hearts");

                	  checkWishlistStatus(code).then(function(result) {
                		  console.log(result);
                	    if (result >= 1) {
                	      heartIcon.addClass("is-active").css("filter", "");
                	    } else {
                	      heartIcon.removeClass("is-active").css("filter", "grayscale(1)");
                	    }
                	  });
                	  
                	  heartIcon.on("click", function() {
                  	    $(this).toggleClass("is-active");

                  	    if ($(this).hasClass("is-active")) {
                  	      addToWishlist(code);
                  	      $(this).css("filter", "");
                  	    } else {
                  	      removeFromWishlist(code);
                  	      $(this).css("filter", "grayscale(100%)");
                  	    }
                  	  });

                  	  function checkWishlistStatus(code) {
                  	    return new Promise(function(resolve, reject) {
                  	      $.ajax({
                  	        url: "/heart.ad",
                  	        type: "POST",
                  	        data: {
                  	          action: "check",
                  	          code: code
                  	        },
                  	        success: function(response) {
                  	          resolve(response);
                  	        },
                  	        error: function(xhr, status, error) {
                  	          reject(error);
                  	        }
                  	      });
                  	    });
                  	  }

                  	  function addToWishlist(code) {
                  	    $.ajax({
                  	      url: "/heart.ad",
                  	      type: "POST",
                  	      data: {
                  	        action: "add",
                  	        code: code
                  	      },
                  	      success: function(response) {
                  	        console.log(response);
                  	      }
                  	    });
                  	  }

                  	  function removeFromWishlist(code) {
                  	    $.ajax({
                  	      url: "/heart.ad",
                  	      type: "POST",
                  	      data: {
                  	        action: "remove",
                  	        code: code
                  	      },
                  	      success: function(response) {
                  	        console.log(response);
                  	      }
                  	    });
                  	  }
                	});
       </script>
</body>
</html>
