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

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/shop/item_detail.css">
    <link rel="stylesheet" href="/resources/css/shop/item_review_detail.css">
    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/common/footer.css" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script defer src="/resources/js/common/header.js"></script>
    <script defer src="/resources/js/shop/itemReview.js"></script>

    <script src="/resources/js/shop/item_detail.js"></script>
    <script src="/resources/js/board/item_review_common.js"></script>
    <script src="/resources/js/board/item_review_my.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="/resources/js/common/header.js"></script>

    <title>상품상세페이지</title>

		
        
  </head>
  <body>

      <%@ include file="../common/header.jsp" %>
      
            <!-- 상품 상세페이지 시작-->
        
              <div id="main">
                  <div id="content" style="opacity: 1;">
                      <div class="section_view">
                          <div id="sectionView">
                              <div class="inner_view">
                                  <div class="thumb" style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png);">
                                      <img src="<%= i.getItemImg() %>" alt="상품 대표 이미지" class="bg"> 
      
                                  </div>
                                  <p class="goods_name">
                                      <span class="btn_share">
                                          <button id="btnShare">공유하기</button>
                                      </span>
                                      <strong class="name"><%= i.getItemName() %></strong>
                                  </p>
                                  <p class="goods_price">
                                      <span class="position">
                                          <span class="dc">
                                              <span>
                                                  <span class="discount" style="font-size: 22px; font-weight: 400; color: red;">30<!--<%= i.getItemDiscount() %>-->%&nbsp</span>
                                              
                                              </span>
                                              <span class="dc_price" style="font-size: 15px; font-weight: 400; color: red;">
                                                  <del style="font-size: 18px; font-weight: 400; color: lightgray;"><%= i.getDiscountPrice() %>원 </del>
                                                  <input type="hidden" value="<%= i.getDiscountPrice() %>">
                                                  
                                              </span>
                                              <span class="won" style="font-size: 22px; margin-top: 10%;">&nbsp<b><%= i.getDiscountPrice() %>원</b></span>
                                          </span>
                                          
                                      </span>
                                      <span>
                                          <span class="txt_benefit">
                                              <span class="ico_grade grade6">웰컴 5%</span>
                                              <span class="point">
                                                  개당
                                                  <strong class="emphh">65원 적립(여긴 건들지마세요 제가 계산식 js에 넣어뒀어요)</strong>
                                              </span>
                                          </span>
                                      </span>
                                  </p>
                                  <div class="goods_info">
                                      <dl class="list fst">
                                          <dt class="tit">정상가</dt>
                                          <dd class="desc"><%= i.getItemPrice() %></dd>
                                      </dl>
                                      <dl class="list">
                                          <dt class="tit">할인가 </dt>
                                          <dd class="desc"><%= i.getDiscountPrice() %></dd>
                                      </dl>
                                      <dl class="list">
                                          <dt class="tit">할인율</dt>
                                          <dd class="desc"><%= i.getItemDiscount() %>%</dd>
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
                                  <form action="">
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
                                                          <span class="num"><%= i.getDiscountPrice() %></span>
                                                          <span class="won"></span>
                                                      </span>
                                                  </div>
                                                  <p class="txt_point">
                                                      <span class="ico">적립</span>
                                                      <span class="point">
                                                          구매 시
                                                          <strong class="emph">65원 적립</strong>
                                                      </span>
                                                  </p>
                                              </div>
                                          </div>
                                          <div class="group_btn off">
                                              <div class="view_function">
                                                  <button type="button" class="btn btn_save">찜 하기</button>
                                              </div>
                                              <span class="btn_type1">
                                                  <button type="submit" class="txt_type">장바구니 담기</button>
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
      
                          <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation" >
                              <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                          고객리뷰
                                          <span class="count_review">(0)</span>
                                      </a>
                                  </li>
                                  <li class="goods-view-infomation-tab qna-show">
                                      <a href="#goods-qna" class="goods-view-infomation-tab-anchor">
                                          1 : 1 문의
                                          <span>(0)</span>
      
                                      </a>
                                  </li>
                              </ul>
                              <div class="goods-view-infomation-content __active" id="goods-description">
                                  <div class="goods_wrap">
                                      <div class="goods_intro">
                                          <div class="pic">
                                              <img src="<%= i.getItemImg() %>" style="width:1010px; height:671px;">
                                          </div>
                                          <div class="context last">
                                              <h3>
                                                  <small>
                                                      <%= i.getItemName() %>
                                                  </small>
                                                  <%= i.getItemText() %>
                                              </h3>
                                              <p class="words">
                                                  <img src="<%= i.getItemImg() %>" style="width:1010px; height:671px;">
                                              </p>
      
                                          </div>
                                      </div>  
                                      
                                  </div>
                              </div>
                          </div>
                          <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                          고객리뷰
                                          <span class="count_review">(0)</span>
                                      </a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-qna" class="goods-view-infomation-tab-anchor">1 : 1 문의
                                          <span>(0)</span>
                                      </a>
                                  </li>
                              </ul>
                              <div class="goods-view-infomation-content" id="goods-image">
                                  <div id="goods_pi">
                                      <p class="pic">
                                          <img src="">
                                      </p>
                                  </div>
                              </div>
                              

                                  <div class="happy_center fst">
                                      <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                                  </li>

                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                                          고객리뷰
                                          <span class="count_review">(0)</span>
                                      </a>
                                  </li>
                                  <li class="goods-view-infomation-tab">
                                      <a href="#goods-qna" class="goods-view-infomation-tab-anchor">1 : 1 문의
                                          <span>(0)</span>
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
						            <th onclick="sortTable(1)" width="70px">작성일</th>
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
									          <%  if(loginUser != null) { %> 
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


      <%@ include file="../common/footer.jsp" %>
   

  </body>
</html>