<!-- html 파일이 여러번 호출되지 않도록 중복 제거 작업 / 2023-04-20 김서영 -->
<!-- 2023-04-19 코드 주석 처리 및 로그인 전/후 로 header 부분의 우측 상단 메뉴바 다르게 수정 및 header 부분에 배송지 관리 url 매핑 / 이지환 */ 	 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.user.member.model.vo.Member" %>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String alertMsg = (String)request.getAttribute("alertMsg");
	String errorMsg = (String)request.getAttribute("errorMsg");
%>


    <div id="header">
      <div class="user_menu">
        <!-- bnr = banner -->
        <a href="#" class="bnr_delivery">
          <img src="/resources/img/image.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="bnr_delivery_img" />
        </a>


        <!-- 2023-04-18 / 로그인 전 우측 상단 바 / 이지환 -->
           <% if(loginUser == null) { %>
        <ul class="sign_menu">
          <!--login class 추가-->

          <li class="link">
            <a  class="item after join" href="/enrollForm.me">회원가입</a>
          </li>
          <li class="link">
            <a class="item after login_none" href="/loginForm.me">로그인</a>
            <a class="item login login_check grade_comm">
              <span class="ico_grade grade0">일반</span>
              <span class="txt">
                <span class="name"></span>
                <span class="sir">님</span>
              </span>
            </a>

          </li>

          <li class="link">
            <a href="" class="item service">고객센터</a>
            <!-- 고객센터 hover 시 sub_menu 등장 -->
            <ul class="sub_menu">
              <li class="list">
                <a href="../main/notice.html" class="list_item">공지사항</a>
              </li>
              <li class="list">
                <a href="../main/faq.html" class="list_item">자주하는 질문</a>
              </li>
              <li class="list">
                <a href="/list.in" class="list_item">1:1 문의</a>
              </li>
            </ul>
          </li>

         </ul>

        <% } %>


        <!-- .sign_menu -->
        <!-- 2023-04-19 / 로그인 후 상단바 코드 수정 및 css 부여 / 이지환 -->
		<% if(loginUser != null) { %>
		<ul class="sign_menu">

          <li class="link">
            <a href="" class="item service" id="loginAf_hover">
            	<b class="join"><%= loginUser.getName() %>님</b>
            	 환영합니다.
            </a>
            <ul class="sub_menu" id="loginAf_menu">
              <li class="list">
                <a href="#" class="list_item">주문내역</a>
              </li>
              <li class="list">
                <a href="#" class="list_item">찜한상품</a>
              </li>
              <li class="list">
                <a href="/deliveryList.do" class="list_item">배송지 관리</a>
              </li>
              <li class="list">
                <a href="#" class="list_item">리뷰 관리</a>
              </li>
              <li class="list">
                <a href="#" class="list_item">쿠폰</a>
              </li>
              <li class="list">
                <!-- <a href="javascript:update_me('<%= loginUser.getMemberId() %>');" class="list_item">내 정보수정</a> -->
                <a href="/updateCheckPwd.me" class="list_item">내 정보수정</a>
              </li>
            </ul>
          </li>
          <li class="link">
            <a href="" class="item after login_none">로그아웃</a>
          </li>


        <!-- 2023-04-18 / 로그인 시 우측 상단 바뀌는 영역 종료 / 이지환 -->

		 <li class="link">
            <a href="" class="item service">고객센터</a>
            <!-- 고객센터 hover 시 sub_menu 등장 -->
            <ul class="sub_menu">
              <li class="list">
                <a href="../main/notice.html" class="list_item">공지사항</a>
              </li>
              <li class="list">
                <a href="../main/faq.html" class="list_item">자주하는 질문</a>
              </li>
              <li class="list">
                <a href="/list.in" class="list_item">1:1 문의</a>
              </li>
            </ul>
          </li>
		</ul>
        <% } %>

      </div>
      <div class="header_logo">
        <h1 class="logo">
          <a href="/main" class="link_main">
            <span class="gnb_logo_container"></span>
            <img src="/resources/img/logo.png" alt="마켓컬리 로고" class="logo_img" />
          </a>
        </h1>
      </div>
      <div class="gnb">
        <!-- gnb = global nav bar = 최상위 메뉴  -->
        <h2 class="blind">메뉴</h2>
        <ul class="gnb_menu">
          <li class="list gnb_main">
            <a href="/itemList.it?currentPage=1&category=전체" class="link">
              <span class="ico"></span>
              <!-- ico는 css에서 bg url로 처리 -->
              <span class="txt">전체 카테고리</span>
            </a>
            <div class="gnb_sub">
              <ul class="menu">
                <li class="current">
                  <!-- hover나 active시 current가 옮겨가도록 설정해야 함 -->
                  <a href="/itemList.it?currentPage=1&category=제로음료" class="main_item">
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

                  <a href="/itemList.it?currentPage=1&category=무가당" class="main_item">
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

                  <a href="/itemList.it?currentPage=1&category=단백질" class="main_item">
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

                  <a href="/itemList.it?currentPage=1&category=도시락" class="main_item">
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

                  <a href="/itemList.it?currentPage=1&category=기타" class="main_item">
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
            <a href="/newItemList.it?currentPage=1" class="link">
              <span class="txt">신상품</span>
            </a>
          </li>
          <li class="list">
            <a href="/discountItemList.it?currentPage=1" class="link">
              <span class="txt">할인</span>
            </a>
          </li>
          <li class="list">
            <a href="/bestItemList.it?currentPage=1" class="link">
              <span class="txt">베스트</span>
            </a>
          </li>
          <li class="list">
            <a href="/noticelist.no?currentPage=1" class="link">
              <span class="txt">이벤트</span>
            </a>
          </li>

          <div class="gnb_search">
              <input type="text" id="keyword" value="건강 기원 새해맞이 보양식 레시피" title="검색어입력" class="inp_search" />
              <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search" onclick="javascript:itemSearch()"/>
              <div class="init">
                <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
              </div>
          </div>

          <div class="location_login">
            <!-- 버튼 뒤로 넘기기, 가상요소 선택자로 bg url 아이콘 처리-->
            <button type="button" class="btn_location on">배송지 등록</button>

            <div class="location_notice">
              <!-- 첫 홈페이지 화면에 몇 초간 notice 띄우고 자동으로 off -->
              <span class="emph">배송지를 등록</span>하고<br />
              <span class="txt">구매가능한 상품을 확인하세요!</span>
              <div class="group_button">
                <button type="button" class="btn login" href="/loginForm.me">로그인</button>
                <button type="button" class="btn search_address">
                  <span class="ico"></span>
                  주소검색
                </button>
              </div>
            </div>
          </div>

          <div id="goCart" class="cart_count">
            <% if(loginUser != null) { %>
            <a href="/cart" class="btn_cart">
              <span class="blind">장바구니</span>
            </a>
            <% } else { %>
            <a href="loginForm.me" class="btn_cart">
              <span class="blind">장바구니</span>
            </a>

            <% } %>
          </div>
        </ul>
      </div>
    </div>

    <script>
  	        let msg = '<%= alertMsg == null ? "" : alertMsg %>';
          	if(msg != null && msg.length > 0) {
          		alert(msg);
          	}
          	//----------------------------------------------------
          	let emsg = '<%= errorMsg == null ? "" : errorMsg %>';
          	if(emsg != null && emsg.length > 0) {
          		alert(emsg);
          	}
         
          	
          	
			// 상품 전체 검색 기능 
			// 2023-04-23
			// 이태화
			function itemSearch() {
				var keyword = $("#keyword").val();
				location.href="itemList.it?currentPage=1&category=전체&keyword="+keyword;
			
		}
		
			function itemSearchOnEnter(event) {
				  if (event.keyCode === 13) {
				    itemSearch();
				  }
				}

				$("#keyword").on("keypress", itemSearchOnEnter);
    </script>
  </body>
</html>