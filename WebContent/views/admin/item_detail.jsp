<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.kh.admin.shop.item.model.vo.Item"
%>

<%
	Item it = (Item)request.getAttribute("item");
	int itemCode = Integer.parseInt(request.getParameter("code"));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/board/faq.css" />
    <link rel="stylesheet" href="/resources/css/shop/item_detail.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script defer src="/resources/js/common/header.js"></script>

    <script src="/resources/js/shop/item_detail.js"></script>

    <title>상품상세페이지</title>

    <style>
      #btn {
        font-size: larger;
      }

      .insert-form .row {
        margin-right: -5px;
        margin-left: -5px;
      }

      .insert-form .col-auto {
        padding-right: 5px;
        padding-left: 5px;
      }

      .heart {
        padding: 10px;
        border: none;
        cursor: pointer;
      }

      /* 활성화된 하트 버튼 스타일 */
      .heart.active {
        color: red;
      }
    </style>
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="sidebar.jsp"%>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="index.html">
        <div><i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY MOODANG</b></div>
      </a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
        <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group"></div>
      </form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#!">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark --bs-blue" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <div class="text-center">
                <img src="/resources/img/logo.png" class="rounded logo" alt="로고" />
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <a class="nav-link" href="main.html">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-home"></i>
                </div>
                메인 / 통계
              </a>
              <a class="nav-link" href="item.html">
                <div class="sb-nav-link-icon">
                  <i class="fa fa-fw fa-gift"></i>
                </div>
                상품 관리
              </a>
              <a class="nav-link" href="order.html">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                주문 관리
              </a>
              <a class="nav-link" href="member.html">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-chart-area"></i>
                </div>
                회원 관리
              </a>
              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-list"></i>
                </div>
                게시판 관리
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="notice.html">공지사항 관리</a> <a class="nav-link" href="inquiry.html">1:1 문의 관리</a> <a class="nav-link" href="review.html">리뷰 관리</a></nav>
              </div>
            </div>
          </div>
          <!-- <div class="sb-sidenav-footer"></div> sidenav의 footer-->
        </nav>
      </div>

      <div id="layoutSidenav_content">
        <main style="height: 100%">
          <div class="container px-6 white">
            <div id="content" style="opacity: 1">
              <h2>관리자 상품 상세페이지</h2>
              <hr />
              <div class="section_view">
                <div id="sectionView">
                  <div class="inner_view">
                    <div class="thumb" style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png)">
                      <img
                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXcAAAHnCAQAAADpr9U2AAABeUlEQVR42u3BMQEAAADCoPVPbQ0PoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALg0lPQAATTM2xoAAAAASUVORK5CYII="
                        alt="상품 대표 이미지"
                        class="bg"
                      />
                    </div>
                    <p class="goods_name">
                      <strong class="name"><%=it.getItemName() %> </strong>
                    </p>

                    <p class="goods_price">
                      <span class="position">
                        <span class="dc">
                          <span style="text-decoration: line-through"><%= it.getItemPrice() %></span>
                          <span class="dc_price" style="color: red">
                            &nbsp; <%= it.getDiscountPrice() %><input type="hidden" value="<%= it.getDiscountPrice() %>" />
                          </span>
                          <span class="won">원</span> <span style="color: red"><%= it.getItemDiscount()*100 %> %</span>
                        </span>
                      </span>
                      <span class="txt_benefit">
                        <span class="ico_grade grade6">웰컴 5%</span>
                        <span class="point"
                          >개당
                          <strong class="emphh">0원 적립</strong>
                        </span>
                      </span>
                    </p>
                    <div class="goods_info">
                      <dl class="list fst">
                        <dt class="tit">정상가</dt>
                        <dd class="desc">판매단위 데이터 넣는곳</dd>
                      </dl>
                      <dl class="list">
                        <dt class="tit">할인가</dt>
                        <dd class="desc">할인가격 데이터 넣는곳</dd>
                      </dl>
                      <dl class="list">
                        <dt class="tit">할인율</dt>
                        <dd class="desc">할인율 데이터 넣는곳</dd>
                      </dl>
                      <dl class="list">
                        <dt class="tit">카테고리</dt>
                        <dd class="desc">카테고리 데이터 넣는곳</dd>
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
                                    <input type="number" readonly="readonly" value="1" class="inp" />
                                    <button type="button" class="btn up on">수량올리기</button>
                                  </span>
                                </div>
                              </li>
                            </ul>
                          </div>
                          <div class="total">
                            <div class="price">
                              <strong class="tit">총 상품금액 :</strong> <span class="sum"> <span class="num">1,300</span> <span class="won">원</span> </span>
                            </div>
                            <br />
                            <br />

                            <p class="txt_point">
                              <button class="btn favbtn">
                                <i class="fa-regular fa-heart fa-2xl"></i>
                              </button>
                              <span class="ico">적립</span> <span class="point"> 구매 시 <strong class="emph">65원 적립</strong> </span>
                            </p>
                            <strong class="name" style="float: right; margin-left: 20px"><i class="far fa-eye fa-lg"></i> | 3</strong> <strong class="name" style="float: right"><i class="fa-regular fa-heart"></i> | 3</strong>
                          </div>
                        </div>

                        <br />
                        <div class="insert-form">
                          <div class="row justify-content-end">
                            <div class="col-auto">
                              <button type="submit" id="btn" class="btn">상품수정</button>
                            </div>
                            <div class="col-auto">
                              <button type="button" id="btn" class="btn">상품삭제</button>
                            </div>
                            <div class="col-auto">
                              <a href="/itemList.ad?page=1&category=a">
                                <button type="button" id="btn" class="btn">상품목록</button>
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
                  <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                    <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
                    <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button>
                    <div class="goods-add-product-list-wrapper" style="height: 320px">
                      <ul class="goods-add-product-list __slide-mover" style="left: 0px">
                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
                          </div>
                          <div class="goods-add-product-item-content">
                            <div class="goods-add-product-item-content-wrapper">
                              <p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
                            </div>
                          </div>
                        </li>

                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
                          </div>
                          <div class="goods-add-product-item-content">
                            <div class="goods-add-product-item-content-wrapper">
                              <p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
                            </div>
                          </div>
                        </li>

                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
                          </div>
                          <div class="goods-add-product-item-content">
                            <div class="goods-add-product-item-content-wrapper">
                              <p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
                            </div>
                          </div>
                        </li>

                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
                          </div>
                          <div class="goods-add-product-item-content">
                            <div class="goods-add-product-item-content-wrapper">
                              <p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
                            </div>
                          </div>
                        </li>

                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
                          </div>
                          <div class="goods-add-product-item-content">
                            <div class="goods-add-product-item-content-wrapper">
                              <p class="goods-add-product-item-name">사용자에게 보이는 카테고리</p>
                            </div>
                          </div>
                        </li>

                        <li class="goods-add-product-item __slide-item">
                          <div class="goods-add-product-item-figure">
                            <a href="#" target="_blank"> <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" class="goods-add-product-item-image" /> </a>
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

                <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
                  <ul class="goods-view-infomation-tab-group">
                    <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
                    <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지 </a></li>
                    <li class="goods-view-infomation-tab">
                      <a href="#goods-review" class="goods-view-infomation-tab-anchor"> 고객후기 <span class="count_review">(0)</span> </a>
                    </li>
                  </ul>
                  <div class="goods-view-infomation-content __active" id="goods-description">
                    <div class="goods_wrap">
                      <div class="goods_intro">
                        <div class="pic">
                          <img src="https://picsum.photos/1000/500" style="width: 1010px; height: 671px" />
                        </div>
                        <div class="context last">
                          <p class="words">이 상품의 설명 Text존이 들어갈 공간입니다.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <ul class="goods-view-infomation-tab-group">
                  <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a></li>
                  <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a></li>
                  <li class="goods-view-infomation-tab">
                    <a href="#goods-review" class="goods-view-infomation-tab-anchor"> 고객후기 <span class="count_review">(0)</span> </a>
                  </li>
                </ul>
                <div class="goods-view-infomation-content" id="goods-image">
                  <div id="goods_pi">
                    <p class="pic"><img src="https://picsum.photos/250/250" /> <img src="https://picsum.photos/250/250" /></p>
                  </div>
                </div>

                <div class="happy_center fst">
                  <ul class="goods-view-infomation-tab-group">
                    <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a></li>
                    <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>

                    <li class="goods-view-infomation-tab">
                      <a href="#goods-review" class="goods-view-infomation-tab-anchor __active"> 고객후기 <span class="count_review">(0)</span> </a>
                    </li>
                  </ul>
                  <div class="goods-view-infomation-content" id="goods-review">
                    <iframe src="" id="inreview" frameborder="0" class="goods-view-infomation-board" height="733"></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>

      <script>
        // 문서 로드 후 실행되는 함수
        $(document).ready(function () {
          // favbtn 버튼 클릭 이벤트 핸들러
          $('.favbtn').click(function () {
            // 버튼 내부의 i 요소에 "fa-regular" 클래스를 "fa-solid" 클래스로 변경
            $(this).find('i').toggleClass('fa-regular fa-solid');
          });
        });
      </script>
    </div>
  </body>
</html>
