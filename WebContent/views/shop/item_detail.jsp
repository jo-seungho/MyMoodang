<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.user.shop.item.model.vo.*, com.kh.user.shop.review.model.vo.Review
    , com.kh.user.member.model.vo.Member"
%>

<%
    Item i = (Item)request.getAttribute("i");
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
    ArrayList<Attachment> clist = (ArrayList<Attachment>)request.getAttribute("clist");
    ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
    
    Review re = (Review)request.getAttribute("re");  
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->
    <%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/shop/item_detail.css">
    <link rel="stylesheet" href="/resources/css/shop/item_review_detail.css">

    <script defer src="/resources/js/shop/itemReview.js"></script>

    <!-- 위에 작성한 코드에서 푸터를 부수는 코드가 존재함 -->

    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
    <script src="/resources/js/shop/newItemDetail.js"></script>

    <script src="/resources/js/board/item_review_common.js"></script>
    <script src="/resources/js/board/item_review_my.js"></script>
    
    <%-- 결제용 API 2023-04-23 조승호--%>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <title>상품상세페이지</title>
      <style>
		
		button[type="submit"] , .btn2 {
		  padding: 25px;
		  background-color: #fe7477;
		  color: white;
		  border: 1px solid white;
		  float: right;
		  margin-bottom: 10px;
		  font-size: 16px;
		  cursor: pointer;
		  margin-left : 5px;
		}
		
		/* 찜목록 기능 추가 */
		.hearts {
			width: 80px;
			height: 80px;
			background: url(/resources/img/heart.png) no-repeat;
			background-position: 0 0;
			cursor: pointer;
			transition: background-position 1s steps(28);
			transition-duration: 0s;
			margin-left: 500px;
		}
		
		.hearts.is-active {
			transition-duration: 1s;
			background-position: -2800px 0;
		}

		</style>

		
        
  </head>
  <body>


      <%@ include file="../common/header.jsp" %>
      
            <!-- 상품 상세페이지 시작-->

                    <div id="main">
                        <div id="content" style="opacity: 1;">
                            <div class="section_view">
                                <div id="sectionView">
                                    <div class="inner_view">
                                    
                                    <hr>
                                    <br>
                                        <div class="thumb" style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png);">
                                            <img src="<%= i.getItemImg() %>" alt="상품 대표 이미지" class="bg" style="height : 438px;"> 
            								
                                        </div>
                                        <p class="goods_name">
                                            
                                            <strong class="name itemName"><%= i.getItemName() %></strong>
                                        </p>
                                        <p class="goods_price">
                                            <span class="position">
                                                <span class="dc">
                                                    <span>
                                                        <span class="discount" style="font-size: 22px; font-weight: 400; color: red;"><%= (int)(i.getItemDiscount() *100) %>%&nbsp;</span>
                                                    
                                                    </span>
                                                    <span style="font-size: 15px; font-weight: 400; color: red;">
                                                        <del style="font-size: 18px; font-weight: 400; color: lightgray;"><%= i.getItemPrice() %>원 </del>
                                                        
                                                        
                                                    </span>
                                                    <span class="dc_price" style="font-size: 15px; font-weight: 400; color: red;">
                                                    <span class="won" style="font-size: 22px; margin-top: 10%;">&nbsp;<b><%= i.getDiscountPrice()%>원</b></span>
                                                	<input class="priceItem" type="hidden" value="<%= i.getDiscountPrice()%>">
                                                	</span>
                                                </span>
                                                
                                            </span>
                                            <span>
                                                <span class="txt_benefit">
                                                    <span class="ico_grade grade6">웰컴 5%</span>
                                                    <span class="point">
                                                        개당
                                                        <strong class="emphh">65원 적립</strong>
                                                    </span>
                                                </span>
                                            </span>
                                        </p>
                                        <div class="goods_info">
                                            <dl class="list fst">
                                                <dt class="tit">정상가</dt>
                                                <dd class="desc"><%= i.getItemPrice() %>원</dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">할인가 </dt>
                                                <dd class="desc"><%= i.getDiscountPrice() %>원</dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">할인율</dt>
                                                <dd class="desc"><%= (int)(i.getItemDiscount() *100) %>%</dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">카테고리</dt>
                                                <dd class="desc"><%= i.getItemCategory() %></dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
            
                                <div id="cartPut">
                                    <div class="cart_option cart_type2">
                                        <form>
                                            <div class="inner_option">
                                                <div class="in_option">
                                                    <div class="list_goods">
                                                        <ul class="list list_nopackage">
                                                            <li class="on">
                                                                <span class="tit_item">구매수량</span>
                                                                <div class="option">
                                                                    <span class="count">
                                                                        <button type="button" class="btn down on">수량내리기</button>
                                                                        <input type="number" readonly="readonly" value = 1 class="inp">
																		<div style="display: none;">
																			<input id="countValue" name="countValue" type="hidden" class="count_num">1
																		</div>                                                                        
                                                                        <button  type="button" class="btn up on">수량올리기</button>
                                                                    </span>
                                                                
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="total">
                                                        <div class="price">
                                                            <strong class="tit">총 상품금액 : </strong>
                                                            <span class="sum">
                                                                <span class="num"></span>
                                                                <span class="won"></span>
                                                            </span>
                                                            <div class="hearts"></div>
                                                        </div>
                                                        <p class="txt_point">
                                                            <span class="ico">적립</span>
                                                            <span class="point">
                                                                구매 시
                                                                <strong class="emph">65원 적립</strong>
                                                                <strong class="name" style="float: right; margin-left: 20px">
																	<i class="fas fa-eye lg"></i>&nbsp;&nbsp;<%=i.getItemhits()%></strong>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="group_btn off">
                                                    <span class="btn">
                                                        <button onclick="orderPay()" type="button" class="btn btn2">구매하기</button>
                                                    </span>
                                                    <span class="btn">
                                                        <button type="button" class="btn btn2 insertCart">장바구니 담기</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                
                            </div>
                            
                            
                            <div class="layout-wrapper goods-view-area">
                          <div class="goods-add-product">
                              <h3 class="goods-add-product-title">
                                  RELATED PRODUCT
                              </h3>
                              <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                                  <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">
                                      왼쪽으로 슬라이드 이동
                                  </button>
                                  <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">
                                      오른쪽으로 슬라이드 이동
                                  </button>
                                  <div class="goods-add-product-list-wrapper" style="height:320px;">
                                      <ul class="goods-add-product-list __slide-mover" style="left: 0px;">
                                            

                                            
                                            	<%  for(Attachment a : clist) { %>
                                          <li class="goods-add-product-item __slide-item">
                                              <div class="goods-add-product-item-figure">
                                                  <a href="#" target="_blank">
                                                      <img src="<%= a.getItemImgPath() %>" class="goods-add-product-item-image">
                                                  </a>
                                              </div>
                                              <div class="goods-add-product-item-content">
                                                  <div class="goods-add-product-item-content-wrapper">
                                                      <p class="goods-add-product-item-name" style="font-size: 18px;" align="center"><%= a.getItemName() %></p>
                                                      <div class="category_item" align="center" style="font-size: 21px;">
                                                      <span class="goods-add-product-item-price2"><del style="font-size: 22px; font-weight: 400; color: red;"><%= a.getItemPrice() %>원</del>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                      <span class="goods-add-product-item-discountprice2"><%= a.getDiscountPrice() %>원</span>
                                                      </div>
                                                  </div>
                                              </div>
                                          </li>
                                          <% } %>

                                         
                                      </ul>
                                  </div>
                              </div>
                          </div>
                        </div>
  
                                               
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                              </div>
            
                                <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation" >
                              <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a>
                                  </li>
                                  
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                          고객리뷰
                                          <span class="count_review">(0)</span>
                                      </a>
                                  </li>
                              </ul>
                                    <div class="goods-view-infomation-content __active" id="goods-description">
                                  <div class="goods_wrap">
                                      <div class="goods_intro">
                                          <div class="pic">
                                          </div>
                                          <div class="context last">
                                              <h3>
                                                  <small>
                                                      <%= i.getItemName() %>
                                                  </small>
                                                  <%= i.getItemText() %>
                                              </h3>
                                              <br><br>
                                              <div style="text-align:center;">
                                              <%= i.getDescription() %>
                                              </div>
      
                                          </div>
                                      </div>  
                                      
                                  </div>
                              </div>
                          	</div>
                                
                                    

                                        <div class="happy_center fst">
                                      <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                                  </li>
                                 
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                                          고객리뷰
                                          <span class="count_review">(0)</span>
                                      </a>
                                  </li>

                              </ul>
                                    
                                    
                                    <div class="goods-view-infomation-content" id="goods-review"> 

                             		<br>
							<table>
						        <thead>
						        <%  if(loginUser != null) { %> 
						            <tr>
								      <th colspan="1">
								        <button id="review-register-btn" class="reviewbtn" style="text-align: center; font-size: large;">리뷰 등록</button>
								      </th>
								    </tr>
								   <% } %> 
								    <br><br>
							
						          <tr>
						            <th onclick="sortTable(0)" width="100px">번호</th>
						            <th onclick="sortTable(1)" width="100px">작성일</th>
						            <th onclick="sortTable(2)" width="120px">별점</th>
						            <th onclick="sortTable(3)">제목</th>
						            <th onclick="sortTable(4)"width="100px">작성자</th>
				
						          </tr>
						        </thead>
						        <tbody>
		                                              
								<% if(rlist.isEmpty()) { %>
										<tr>
										<td colspan="5">조회된 상품 리뷰 리스트가 없습니다.</td>
										</tr>
								<% } else { %>
								    <% for(Review r : rlist){ %>
								      <tr class="post">
								        <td><%= r.getReviewNo()%></td>
								        <td><%= r.getWriteDate()%></td>
								        <td><%= r.getStarPoint()%></td>
								        <td onclick="toggleContent(<%= r.getReviewNo()%>)" style="cursor: pointer;"><%= r.getTitle()%></td>
								        <td><%= r.getMemberId()%></td>
								      </tr>
								      <tr class="content" id="content<%= r.getReviewNo()%>" style="display:none;">
								        <td colspan="6" id="contentBox<%= r.getReviewNo()%>">
									          <p><%= r.getContent()%></p>
									          <%  if(loginUser != null && loginUser.getMemberId().equals(r.getMemberId())) { %> 
						   								  <button><a href = "/itemReviewDel.it?rno=<%= r.getReviewNo() %>&bno=<%= i.getItemCode() %>" type="button" class=delete>삭제</a></button> 
						   								  <button type="button" id="updateViewBtn<%= r.getReviewNo() %>" class="update-btn" onclick="javascript:reviewUpdateView(<%= r.getReviewNo() %>)" style="display:block">수정</button>
						   								  <button type="button" id="updateExcuteBtn<%= r.getReviewNo() %>" class="update-btn" onclick="javascript:reviewUpdate(<%= r.getReviewNo() %>)" style="display:none">수정완료</button>
						   								  <% } %> 
								        </td>
								      </tr>
								    <%} %>
							    
							   <%} %>
		    
							  </tbody>
							      </table>

								      
			      
			      
								  <!-- 모달 창 -->

               
                           
		             <div id="review-modal" class="modal">
					  <div class="modal-content">
					    <div class="modal-header">
					      <span class="close"></span>
					      <h2 align="center">리뷰 등록</h2>
					      <br>
					    </div>
					   <div class="modal-body">
							    
							  <!-- 리뷰 등록 폼 -->
						<form action="/itemReviewIn.it" method="post">
						  <div>
						    <label for="title">제목:</label>
						    <input type="text" id="title" name="title">
						  </div>
						  
						  <div>
						    <label for="contentinsert">내용:</label>
						    <textarea id="contentinsert" name="contentinsert"></textarea>
						  </div>
						  
						  <div>
						    <label for="starpoint">별점:</label>
						    <select id="starpoint" name="starpoint">
						      <option value="1">1점</option>
						      <option value="2">2점</option>
						      <option value="3">3점</option>
						      <option value="4">4점</option>
						      <option value="5">5점</option>
						    </select>
						  </div>
						  <input type="hidden" name="bno" id="bno" value="<%= i.getItemCode() %>">   
						  <div id="modal">
						    <button type="submit" id="close-btn">등록</button>
						  </div>
						</form> 
					</div>
        			 
                </div>
              </div>
           </div>
    
                    <script>                	
                   	/* 좋아요 표시 */
                   	$(document).ready(function() {
                	  var code = <%= i.getItemCode() %>;
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
                  	        url: "/heart.wi",
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
                  	      url: "/heart.wi",
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
                  	      url: "/heart.wi",
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
                  	  
                  	  
                     	// 장바구니 담기 2023-04-23 조승호
                     	$('.insertCart').click(function() {
                     		
                     		let priceItem = $('.priceItem').val();

                     		$.ajax({
                     			
                     			url: "cartList",
                     			type: "post",
                     			data: {
                					itemCodeNo: code,
                					countValue: $("#countValue").text(),
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
                     		})

                     	})

                	});    	
                   	
                   	
                 	// 구매하기 2023-04-23 조승호
                	function orderPay(){
                		let userName = $('.join').text()
                		let countMoney = parseInt($('.goods_price input').val()) * parseInt($("#countValue").text());
                		let item = $('.itemName').text()
                		console.log($('.join').text());
                		
                		IMP.init('imp68338217');
                		IMP.request_pay({
                		    pg : 'kakao',
                		    pay_method : 'card',
                		    merchant_uid : 'merchant_' + new Date().getTime(),
                		    name : item , //결제창에서 보여질 이름
                		    amount : countMoney,
                		    buyer_email : 'test888@test.do',
                		    buyer_name : userName,
                		    buyer_tel : '010-1234-5678',
                		    // buyer_addr : orderAddress,
                		    buyer_postcode : '123-456'
                		}, function(rsp) {
                			console.log(rsp);
                		    if ( rsp.success ) {
                		    	var msg = '결제가 완료되었습니다.';
                		        msg += '고유ID : ' + rsp.imp_uid;
                		        msg += '상점 거래ID : ' + rsp.merchant_uid;
                		        msg += '결제 금액 : ' + rsp.paid_amount;
                		        msg += '카드 승인번호 : ' + rsp.apply_num;
                		        // location.href = '/orderComplete';
                		    } else {
                		    	 var msg = '결제에 실패하였습니다.';
                		         msg += '에러내용 : ' + rsp.error_msg;
                		    }
                		    alert(msg);
                		});
                	}

                    </script>
                    



      <%@ include file="../common/footer.jsp" %>
   

  </body>
</html>