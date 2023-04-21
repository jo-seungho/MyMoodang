<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <a href="../main/order_list.html">주문내역</a>
                                </li>
                                <li  class="on">
                                    <a href="#">찜한 상품</a>
                                </li>
                                <li>
                                    <a href="../main/delivery_list.html">배송지 관리</a>
                                </li>
                                <li>
                                    <a href="#">리뷰 관리</a>
                                </li>
                                <li>
                                    <a href="../main/oneonone.html">1:1 문의</a>
                                </li>
                                <li>
                                    <a href="#">쿠폰</a>
                                </li>
                                <li>
                                    <a href="../main/edit_my_info_pw_check.html">내 정보 수정</a>
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

                                      <!-- 상품 1개의 정보 -->
                                        <div class="order_info">
                                          <div class="thumb">
                                            <a href=""><img src="https://img-cf.kurly.com/shop/data/goods/1506389622159s0.jpg" alt="대표 찜한 상품 이미지"></a>

                                            </div>
                                              <div class="desc">
                                                    <dl>
                                                        <a href="../main/faq.html"><dt>상품명</dt>
                                                        <dd>무설탕 수제 푸딩</dd></a>
                                                    </dl>
                                                    <dl>
                                                        <dt>가격</dt>
                                                        <dd>(상품 가격 넣는곳)</dd>
                                                    </dl>
                                              </div>

                                              <div class="wish_status">
                                                <span class="inner_status">
                                                    <a id="delete" href="#">삭제</a> <br>
                                                    <a id="cart_in" href="#장바구니에 담기"><span class="material-symbols-outlined">
                                                        shopping_cart
                                                        </span> 담기</span>
                                                       </a>
                                                </span>
                                               </div>
                                          </div>
                                            <!-- 상품 1개의 정보 끝-->
                                          <div class="order_info">
                                            <div class="thumb">
                                              <a href=""><img src="https://img-cf.kurly.com/shop/data/goods/1506389622159s0.jpg" alt="대표 찜한 상품 이미지"></a>

                                                </div>
                                                <div class="desc">
                                                  <dl>
                                                    <a href="../main/faq.html"><dt>상품명</dt>
                                                    <dd>무설탕 수제 푸딩</dd></a>
                                                  </dl>
                                                    <dl>
                                                        <dt>가격</dt>
                                                        <dd>(상품 가격 넣는곳)</dd>
                                                    </dl>
                                                </div>

                                                <div class="wish_status">
                                                  <span class="inner_status">
                                                      <a id="delete" href="#">삭제</a> <br>
                                                      <a id="cart_in" href="#장바구니에 담기"><span class="material-symbols-outlined">
                                                          shopping_cart
                                                          </span> 담기</span>
                                                         </a>
                                                  </span>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                  </li>
                              </ul>
                              <div class="layout-pagination">
                                  <div class="pagediv">
                                      <a href="#viewOrderList" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
                                      <a href="#viewOrderList" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
                                      <span>
                                          <strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
                                              1
                                          </strong>
                                      </span>
                                      <a href="#viewOrderList" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
                                      <a href="#viewOrderList" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
                                  </div>
                              </div>

			<%@ include file="../common/footer.jsp" %>

  </body>
</html>
