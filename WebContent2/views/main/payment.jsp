<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="/css/coomon/reset.css" />
    <link rel="stylesheet" href="/css/coomon/header.css" />
    <link rel="stylesheet" href="/css/order/list.bundle.csss">    
 
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script src="/js/coomon/header.js"></script>
    <script src="/js/order/payment.js"></script>

    <title>주문 결제</title>
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
    <div class="title_pay_head">
        <h1 align="center" class="title_desc" style="margin: 40px 0; font-size: xx-large;">주문 결제</h1>
    </div> 
    <div id="cartItemList" class="only_pc">
      <div class="cart_item ">
              <div class="orderInfo">
                <h1> 주문자 정보 </h1>
              </div>  
              <div class="orderDetailInfo">
        <fieldset>
            <table id="formTable">
                <tr>
                    <td>이름 *</td>
                    <td>
                      <!-- <input type="text" name="name" size="30" style="height: 30px; border-radius: 5px;" required placeholder="주문자 이름을 입력해주세요"> -->
                    조승호</td>
                </tr>
                <tr>
                    <td>이메일 *</td>
                    <td>
                      <!-- <input type="email" name="email" size="30" style="height: 30px; border-radius: 5px;" required placeholder="주문자 이메일을 입력해 주세요"> -->
                      11017sk@hanmail.com
                    </td>
                </tr>
                <tr>
                    <td>휴대폰 번호 *</td>
                    <td>
                      <!-- <input type="text" name="address" size="30" style="height: 30px; border-radius: 5px;" required placeholder="- 를 제외한 숫자만 입력해주세요"> -->
                      010-5574-2247
                    </td>
                </tr>
                <!-- <tr>
                    <td>주문비밀번호 *</td>
                    <td><input id="userPwd" type="password" name="password" size="30" style="height: 30px; border-radius: 5px;" required></td>
                </tr>
                <tr>
                    <td>주문비밀번호 확인*</td>
                    <td><input id="checkPwd" type="password" name="password" size="30" style="height: 30px; border-radius: 5px;" required></td>
                </tr> -->
            </table>
        </fieldset>
              </div>
                <div class="cart_select">
                    <div class="inner_select">
                        <label class="check">
                            <input type="checkbox" name="checkAll" class="checkAll" onclick="sel_all(this)">
                            <span class="ico"></span>전체선택 (1/1)
                        </label>
                        <a href="#none" class="btn_delete">선택삭제</a>
                    </div>
                </div>
                <div class="box cold">
                    <div class="tit_box">
                        <h4 class="tit">
                            <span class="inner_tit">상품 목록</span>
                        </h4>
                        <button type="button" id='btn_dropup' class="btn_dropup" onclick="dropup()">접기 / 펼치기</button>
    
                    </div>
                    <ul class="list" id='dropup_list'>
                        <li>
                            <!-- 상품 목록 중 1. 추가/삭제될 목록임. -->
                            <div class="item">
                                <label class="check" for="chkItem1">
                                    <!-- 개당 체크박스 -->
                                    <input onclick='check_sel_all(this)' type="checkbox" id="chkItem1" name="checkOne"
                                        class="checkOne" data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                        data-item-parent-no="65810">
                                    <span class="ico"></span>
                                </label>
    
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="#" class="package ">[채소] 감자</a>
                                        <div class="info"></div>
                                    </div>
                                    <div class="goods">
                                        <a href="#" class="thumb "
                                            style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610599300495i0.jpg&quot;);">상품이미지</a>
                                        <!-- 이미지자리 ^-->
                                        <div class="price">
                                            <div class="in_price">
                                                <span class="selling">6000
                                                    <span class="won">원</span>
                                                </span>
                                                <p class="noti"></p>
                                            </div>
                                            <!-- 개수 조정 부분. -->
                                            <div class="stamper count">
                                                <button type="button" class="btn minus off"
                                                    data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                                    data-opt="decrease">감소</button>
                                                <input type="text" id="stepperCounter" class="num" readonly="" value="1">
                                                <button type="button" class="btn plus"
                                                    data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                                    data-opt="increase">추가</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 상품 삭제 시 db반영 (btn_delete)-->
                                    <button type="button" onclick="del_row(this)" class="btn_delete"
                                        data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                        data-type="cold">
                                        상품 삭제</button>
                                </div>
                             </div>   
                        </li>

                        <li>
                            <!-- 상품 목록 중 1. 추가/삭제될 목록임. -->
                            <div class="item">
                                <label class="check" for="chkItem1">
                                    <!-- 개당 체크박스 -->
                                    <input onclick='check_sel_all(this)' type="checkbox" id="chkItem1" name="checkOne"
                                        class="checkOne" data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                        data-item-parent-no="65810">
                                    <span class="ico"></span>
                                </label>
    
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="#" class="package ">[채소] 감자</a>
                                        <div class="info"></div>
                                    </div>
                                    <div class="goods">
                                        <a href="#" class="thumb "
                                            style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610599300495i0.jpg&quot;);">상품이미지</a>
                                        <!-- 이미지자리 ^-->
                                        <div class="price">
                                            <div class="in_price">
                                                <span class="selling">3000
                                                    <span class="won">원</span>
                                                </span>
                                                <p class="noti"></p>
                                            </div>
                                            <!-- 개수 조정 부분. -->
                                            <div class="stamper count">
                                                <button type="button" class="btn minus off"
                                                    data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                                    data-opt="decrease">감소</button>
                                                <input type="text" id="stepperCounter" class="num" readonly="" value="1">
                                                <button type="button" class="btn plus"
                                                    data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                                    data-opt="increase">추가</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 상품 삭제 시 db반영 (btn_delete)-->
                                    <button type="button" onclick="del_row(this)" class="btn_delete"
                                        data-item-id="c7b3a4e1-4517-416c-9b3e-d41c0e7592f2" data-item-no="65810"
                                        data-type="cold">
                                        상품 삭제</button>
                                </div>
                             </div>   
                        </li>
                        <!--1끝-->
    
                        <!-- """밑에 코드는 장바구니 데이터가 하나도 없을 경우 출력하도록 구현 바람.(cart_empty.html 참고)"""
                            <div class="inner_empty"><span class="bg"></span>
                            <p class="txt">장바구니에 담긴 상품이 없습니다</p></div>
     -->
                    </ul>
                </div>
    
    
                <!-- 여긴 고정. -->
                <div class="cart_select">
                    <div class="inner_select">
                        <label class="check">
                            <input type="checkbox" name="checkAll" onclick="sel_all(this)">
                            <span class="ico"></span>전체선택 (1/1)
                        </label>
                        <!-- 1/n : db-->
                        <a href="#none" class="btn_delete">선택삭제</a>
                    </div>
                </div>
            </div>
            <div class="cart_result">
                <div class="inner_result">
                    <div class="cart_delivery">
                        <h3 id="payPrice" class="tits">결제금액</h3>
                        <h2 class="totalPrice">총 상품금액</h2>
                    </div>
                    <div class="amount_view">
                        <dl class="amount">
                            <dt class="tit">상품금액</dt>
                            <dd class="price">
                                <span class="num">6,000</span>
                                <!-- product price here-->
                                <span class="won">원</span>
                            </dd>
                        </dl>
                        <dl class="amount">
                            <dt class="tit">상품할인금액</dt>
                            <dd class="price">
                                <span class="num">0</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>
                        <dl class="amount">
                            <dt class="tit">배송비</dt>
                            <dd class="price">
                                <span class="num">0</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>
                        <dl class="amount lst">
                            <dt class="tit">결제예정금액</dt>
                            <dd class="price">
                                <span class="num">6,000</span>
                                <!-- sum of product price here -->
                                <span class="won">원</span>
                            </dd>
                        </dl>
                        <div class="reserve">
                            <span class="bage">적립</span>구매 시
    
                            <span class="emph">325원 적립</span>
                            <!-- 계산된 적립금(총금액의 20%)^.-->
                        </div>
                    </div>
                    <!-- 계산 필요 . -->
                    <div class="btn_submit">
                        <button type="submit" class="btn active orderBtn">주문하기</button>
                        <!-- 결제 페이지로 이동 -->
                    </div>
                    <div class="notice">
                        <span class="txt">
                            <span class="ico">·</span>쿠폰/적립금은 주문서에서 사용 가능합니다
                        </span>
                        <span class="txt">
                            <span class="ico">·</span>‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.
                        </span>
                        <span class="txt">
                            <span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.
    
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 주문내역 페이지 영역 끝 -->


      </div>
    </div>  
  </body>
</htm>