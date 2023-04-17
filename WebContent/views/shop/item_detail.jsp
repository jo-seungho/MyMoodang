<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.user.shop.item.model.vo.*"
    %>

<%
    Item i = (Item)request.getAttribute("i");
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
    ArrayList<Attachment> clist = (ArrayList<Attachment>)request.getAttribute("clist");
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

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script defer src="/resources/js/common/header.js"></script>

    <script src="/resources/js/shop/item_detail.js"></script>

    <title>상품상세페이지</title>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

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
                                <span class="dc_price">
                                    
                                    <input type="hidden" value="<%= i.getDiscountPrice() %>"> 
                                    
                                </span>
                                <span class="won"><%= i.getDiscountPrice() %> 원</span>
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
                        <dl class="list fst" style="font-size: large;">
                            <dt class="tit">정상가</dt>
                            <dd class="desc" style="font-size: large; "><del><%= i.getItemPrice() %></del></dd>
                        </dl>
                        <dl class="list">
                            <dt class="tit">할인가 </dt>
                            <dd class="desc" style="font-size: large;"><%= i.getDiscountPrice() %></dd>
                        </dl>
                        <dl class="list">
                            <dt class="tit">할인율</dt>
                            <dd class="desc" style="font-size: large;"><%= i.getItemDiscount() %>%</dd>
                        </dl>
                        <dl class="list">
                            <dt class="tit">카테고리</dt>
                            <dd class="desc" style="font-size: large;"><%= i.getItemCategory() %></dd>
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
                                        <strong class="tit">총 상품금액 :</strong>
                                        <span class="sum">
                                            <span class="num"><%= i.getDiscountPrice() %></span>
                                            <span class="won">원</span>
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
                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="<%= i.getItemImg() %>" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            <li class="goods-add-product-item __slide-item">
                                <div class="goods-add-product-item-figure">
                                    <a href="#" target="_blank">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image">
                                    </a>
                                </div>
                                <div class="goods-add-product-item-content">
                                    <div class="goods-add-product-item-content-wrapper">
                                        <p class="goods-add-product-item-name">같은 카테코리 이미지 나오게하는 곳</p>
                                        <p class="goods-add-product-item-price">0원</p>
                                    </div>
                                </div>
                            </li>

                            
                        </ul>
                    </div>
                </div>
            </div>

            <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
                <ul class="goods-view-infomation-tab-group">
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-description" class="goods-view-infomation-tab-anchor __active"></a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                            고객후기
                            <span class="count_review">(0)</span>
                        </a>
                    </li>
                    <li class="goods-view-infomation-tab qna-show">
                        <a href="#goods-qna" class="goods-view-infomation-tab-anchor">
                            상품문의
                            <span>(0)</span>

                        </a>
                    </li>
                </ul>
                <div class="goods-view-infomation-content __active" id="goods-description">
                    <div class="goods_wrap">
                        <div class="goods_intro">
                            <div class="pic">
                                <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" style="width:1010px; height:671px;">
                            </div>
                            <div class="context last">
                                <h3>
                                    <small>
                                        제목 부연설명
                                    </small>
                                    제목
                                </h3>
                                <p class="words">
                                    
                                </p>

                            </div>
                        </div>  
                        
                    </div>
                </div>
            </div>
                <ul class="goods-view-infomation-tab-group">
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                            고객후기
                            <span class="count_review">(0)</span>
                        </a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의
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
                <ul class="goods-view-infomation-tab-group">
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                    </li>

                    <li class="goods-view-infomation-tab">
                        <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                            고객후기
                            <span class="count_review">(0)</span>
                        </a>
                    </li>
                    <li class="goods-view-infomation-tab">
                        <a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의
                            <span>(0)</span>
                        </a>
                    </li>
                </ul>
                <div class="goods-view-infomation-content" id="goods-review"> <!-- 아래 주소창에 good_review_list.html url 넣어주면 됩니당-->
                    <iframe src="" id="inreview" frameborder="0" class="goods-view-infomation-board" height="733"></iframe>
                </div>
                
            </div>
        </div>
    </div>

	</div>
     <!-- 상품 상세페이지 끝-->

      <%@ include file="../common/footer.jsp" %>
   

  </body>
</html>