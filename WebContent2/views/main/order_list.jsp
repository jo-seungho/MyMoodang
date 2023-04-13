<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->
    <link rel="stylesheet" href="/css/mypage/order_list.css">  
    <link rel="stylesheet" href="/css/coomonreset.css">
    <link rel="stylesheet" href="/css/coomon/footer.css">
    <link rel="stylesheet" href="/css/coomon/header.css">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/coomon/header.js"></script>

    <title>주문 내역</title>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

      <div id="header">
        <div class="user_menu">
          <!-- bnr = banner -->
          <a href="#" class="bnr_delivery">
            <img src="/webContent/resources/img/image.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="bnr_delivery_img" />
          </a>
          <ul class="sign_menu">
            <!--login class 추가-->
            <li class="link">
              <a href="#" class="item after join">회원가입</a>
            </li>
            <li class="link">
              <a href="#" class="item after login_none">로그인</a>
              <a class="item login login_check grade_comm">
                <span class="ico_grade grade0">일반</span>
                <span class="txt">
                  <span class="name"></span>
                  <span class="sir">님</span>
                </span>
              </a>
              <ul class="sub">
                <li class="list">
                  <a href="#" class="list_item">주문 내역</a>
                </li>
                <li class="list">
                  <a href="#" class="list_item">배송지 관리</a>
                </li>
                <li class="list">
                  <a href="#" class="list_item">개인 정보 수정</a>
                </li>
                <li class="list">
                  <a href="#" class="list_item">로그아웃</a>
                </li>
              </ul>
            </li>
            <li class="link">
              <a href="#" class="item service">고객센터</a>
              <!-- 고객센터 hover 시 sub_menu 등장 -->
              <ul class="sub_menu">
                <li class="list">
                  <a href="#" class="list_item">공지사항</a>
                </li>
                <li class="list">
                  <a href="#" class="list_item">자주하는 질문</a>
                </li>
                <li class="list">
                  <a href="#" class="list_item">1:1 문의</a>
                </li>
              </ul>
            </li>
          </ul>
          <!-- .sign_menu -->
        </div>
        <div class="header_logo">
          <h1 class="logo">
            <a href="#" class="link_main">
              <span class="gnb_logo_container"></span>
              <img src="/webContent/resources/img/logo.png" alt="마켓컬리 로고" class="logo_img" />
            </a>
          </h1>
        </div>
        <div class="gnb">
          <!-- gnb = global nav bar = 최상위 메뉴  -->
          <h2 class="blind">메뉴</h2>
          <ul class="gnb_menu">
            <li class="list gnb_main">
              <a href="#" class="link">
                <span class="ico"></span>
                <!-- ico는 css에서 bg url로 처리 -->
                <span class="txt">전체 카테고리</span>
              </a>
              <div class="gnb_sub">
                <ul class="menu">
                  <li class="current">
                    <!-- hover나 active시 current가 옮겨가도록 설정해야 함 -->
                    <a href="#" class="main_item">
                      <span class="ico">
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off" />
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on" />
                        <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                  클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                      </span>
                      <span class="tit">
                        <span class="txt">제로 음료</span>
                        <!-- ico_nex: bg url로 처리 -->
                      </span>
                      <!-- tit: text + ico -->
                    </a>

                    <a href="#" class="main_item">
                      <span class="ico">
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off" />
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on" />
                        <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                  클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                      </span>
                      <span class="tit">
                        <span class="txt">무가당</span>
                        <span class="ico_new" alt="new"></span>
                        <!-- ico_nex: bg url로 처리 -->
                      </span>
                      <!-- tit: text + ico -->
                    </a>

                    <a href="#" class="main_item">
                      <span class="ico">
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off" />
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on" />
                        <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                  클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                      </span>
                      <span class="tit">
                        <span class="txt">단백질</span>
                        <!-- ico_nex: bg url로 처리 -->
                      </span>
                      <!-- tit: text + ico -->
                    </a>

                    <a href="#" class="main_item">
                      <span class="ico">
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off" />
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on" />
                        <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                  클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                      </span>
                      <span class="tit">
                        <span class="txt">도시락</span>
                        <!-- ico_nex: bg url로 처리 -->
                      </span>
                      <!-- tit: text + ico -->
                    </a>

                    <a href="#" class="main_item">
                      <span class="ico">
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off" />
                        <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on" />
                        <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                  클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                      </span>
                      <span class="tit">
                        <span class="txt">기타</span>
                        <!-- ico_nex: bg url로 처리 -->
                      </span>
                      <!-- tit: text + ico -->
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="list">
              <a href="#" class="link">
                <span class="txt">신상품</span>
              </a>
            </li>
            <li class="list">
              <a href="#" class="link">
                <span class="txt">할인</span>
              </a>
            </li>
            <li class="list">
              <a href="#" class="link">
                <span class="txt">베스트</span>
              </a>
            </li>
            <li class="list">
              <a href="#" class="link">
                <span class="txt">이벤트</span>
              </a>
            </li>

            <div class="gnb_search">
              <form action="">
                <input type="text" id="keyword" value="건강 기원 새해맞이 보양식 레시피" title="검색어입력" class="inp_search" />
                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search" />
                <div class="init">
                  <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                </div>
              </form>
            </div>

            <div class="location_login">
              <!-- 버튼 뒤로 넘기기, 가상요소 선택자로 bg url 아이콘 처리-->
              <button type="button" class="btn_location on">배송지 등록</button>

              <div class="location_notice">
                <!-- 첫 홈페이지 화면에 몇 초간 notice 띄우고 자동으로 off -->
                <span class="emph">배송지를 등록</span>하고<br />
                <span class="txt">구매가능한 상품을 확인하세요!</span>
                <div class="group_button">
                  <button type="button" class="btn login">로그인</button>
                  <button type="button" class="btn search_address">
                    <span class="ico"></span>
                    주소검색
                  </button>
                </div>
              </div>
            </div>

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
                                  <li class="on">
                                      <a href="#">주문내역</a>
                                  </li>
                                  <li>
                                      <a href="#">찜한상품</a>
                                  </li>
                                  <li>
                                      <a href="#">배송지관리</a>
                                  </li>
                                  <li>
                                      <a href="#">리뷰 관리</a>
                                  </li>
                                  <li>
                                      <a href="#">쿠폰</a>
                                  </li>
                                  <li>
                                      <a href="#">내 정보 수정</a>
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
                            <li>
                                <div class="date">2020.12.17 (날짜 데이터 넣는 곳)</div>
                                <div class="order_goods">
                                    <div class="name">
                                        <a href="" style="font-size: large; font-weight: bolder; color: rgb(254, 116, 119);">(배송 상태)</a>
                                        <a href="">주문 상세보기</a>
                                    </div>
                                <!-- 상품 1개의 정보 -->
                                  <div class="order_info">
                                    <div class="thumb">
                                      <img src="https://img-cf.kurly.com/shop/data/goods/1506389622159s0.jpg" alt="해당 주문 대표 상품 이미지">

                                        </div>
                                        <div class="desc">
                                          <dl>
                                            <dt>상품명</dt>
                                            <dd>무설탕 수제 푸딩</dd>
                                          </dl>
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd>(주문번호 넣는곳)</dd>
                                            </dl>
                                            <dl>
                                              <dt>결제방법</dt>
                                              <dd>신용카드</dd>
                                            </dl>
                                            <dl>
                                                <dt>결제금액</dt>
                                                <dd>0원(결제 금액 넣는곳)</dd>
                                            </dl>
                                        </div>
                                        <div class="order_status">
                                            <span class="inner_status">
                                                <a id="review" class="link ga_tracking_event">리뷰 작성</a>
                                                <a id="return" class="link ga_tracking_event" href="">반품 및 환불</a>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- 상품 1개의 정보 끝-->
                                  <div class="order_info">
                                    <div class="thumb">
                                      <img src="https://img-cf.kurly.com/shop/data/goods/1506389622159s0.jpg" alt="해당 주문 대표 상품 이미지">

                                        </div>
                                        <div class="desc">
                                          <dl>
                                            <dt>상품명</dt>
                                            <dd>무설탕 수제 푸딩</dd>
                                          </dl>
                                            <dl>
                                                <dt>주문번호</dt>
                                                <dd>(주문번호 넣는곳)</dd>
                                            </dl>
                                            <dl>
                                              <dt>결제방법</dt>
                                              <dd>신용카드</dd>
                                            </dl>
                                            <dl>
                                                <dt>결제금액</dt>
                                                <dd>0원(결제 금액 넣는곳)</dd>
                                            </dl>
                                        </div>
                                        <div class="order_status">
                                            <span class="inner_status">
                                                <a id="review" class="link ga_tracking_event">리뷰 작성</a>
                                                <a id="return" class="link ga_tracking_event" href="">반품 및 환불</a>
                                            </span>
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
                        
                    </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>    
    <!-- 주문내역 페이지 영역 끝 -->

      <div id="footer">
        <div class="inner_footer">
            <div class="cc_footer">
            <!-- cc = company calls --> 
                <h2 class="cc_tit">고객행복센터</h2>
                <div class="cc_view cc_call">
                    <h3>
                        <span class="tit">1644-1107</span>
                    </h3>
                    <dl class="list">
                        <dt>365고객센터</dt>
                        <dd>오전 7시 - 오후 7시</dd>
                    </dl>
                </div>
                <div class="cc_view cc_kakao">
                    <h3>
                        <a href="#" class="tit">카카오톡 문의</a>
                    </h3>
                    <dl class="list">
                        <dt>365고객센터</dt>
                        <dd>오전 7시 - 오후 7시</dd>
                    </dl>
                </div>
                <div class="cc_view cc_qna">
                    <h3>
                        <a href="#" class="tit">1:1 문의</a>
                    </h3>
                    <dl class="list">
                        <dt>24시간 접수 가능</dt>
                        <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                    </dl>
                </div>
              </div>
            <div class="company_info">
                <ul class="list">
                    <li>
                        <a href="#" class="link">마이무당소개</a>
                    </li>
                    <li>
                        <a href="#" class="link">마이무당소개영상</a>
                    </li>
                    <li>
                        <a href="#" class="link">인재채용</a>
                    </li>
                    <li>
                        <a href="#" class="link">이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="link">개인정보처리방침</a>
                    </li>
                    <li>
                        <a href="#" class="link">이용안내</a>
                    </li>
                </ul>
                <div class="spec_info">
                    법인명 (상호) : 주식회사 마이무당
                    <span class="bar">I</span>
                    사업자등록번호 : 000-00-0000 
                    <a href="#" class="link">사업자정보확인</a><br>
                    통신판매업 : 제 2018-서울강남-00000 호
                    <span class="bar">I</span>
                    개인정보보호책임자 : 000 <br>
                    주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F
                    <span class="bar">I</span>
                    대표이사 : 김가현 <br>
                    입점문의 : <a href="#" class="link">입점문의하기</a>
                    제휴문의 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    채용문의 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    팩스 : 000 - 0000 - 0000
                    <span class="bar">I</span>
                    이메일 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    <br>
                    <strong class="copy">© MymooDang CORP. ALL RIGHTS RESERVED</strong>
                    <ul class="sns">
                        <li>
                            <a href="#" class="link_sns insta" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="마켓컬리 인스타그바로가기">
                            </a>
                            <!-- bg url 넣기 -->
                        </li>
                        <li>
                            <a href="#" class="link_sns fb" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="마켓컬리 페이스북 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns naver_blog" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="마켓컬리 네이버블로그 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns naver_post" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="마켓컬리 포스트 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns yt" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

          <div class="link_footer">
              <div class="authentication">
                  <a href="#" class="mark" target="_blank">
                      <img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
                      <p class="txt">
                          [인증범위] 마이무당 쇼핑몰 서비스 개발 · 운영<br>
                          [유효기간] 2023-04-06 ~ 2099-12-31
                      </p>
                  </a>
                  <a href="#" class="mark" target="_blank">
                      <img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
                      <p class="txt">
                          개인정보보호 우수 웹사이트 ·<br>
                          개인정보처리시스템 인증 (ePRIVACY PLUS)
                      </p>
                  </a>
                  <a href="#" class="lguplus mark" target="_blank">
                      <img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
                      <p class="txt">
                          고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
                          토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                      </p>
                  </a>
              </div>
          </div>
      </div>
      </div>
    </div>  
  </body>
</htm>