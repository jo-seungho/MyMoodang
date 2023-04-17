<!-- 2023.04.17 이지환 -->
<!-- jsp명 수정
	 delibery_lilst.jsp
	 	->
	 delibery_list.jsp
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
    <link rel="stylesheet" href="/resources/css/common/reset.css">
    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/shop/delivery_list.css">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/shop/deliver.js"></script>

    <title>배송지관리</title>
    <script>
        function popup_address_add(){    //배송지 추가
            var popupX = (window.screen.width / 2) - (530 / 2);   // 팝업창을 가운데 띄우기 위한거
            var popupY = (window.screen.height / 2) - (400 / 2);
            var url = "address_search.html";        // var url = "product_modify/"+ id;
            var name = "popup test";
            var option = "width = 530, height = 400, top = " + popupY + " , left = " + popupX + " , location = no"
            window.open(url, name, option);
        }

        function popup_change(){    //수정
            var popupX = (window.screen.width / 2) - (530 / 2);   // 팝업창을 가운데 띄우기 위한거
            var popupY = (window.screen.height / 2) - (510 / 2);
            var url = "delivery_modify.html";        // var url = "product_modify/"+ id;
            var name = "popup";
            var option = "width = 530, height = 510, top = " + popupY + " , left = " + popupX + " , location = no"
            window.open(url, name, option);
        }
    </script>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

      <%@ include file="../common/header.jsp" %>
      
    <div id="Container-Wrapper">
    <!-- 자주하는질문 페이지 영역 시작 -->
      <div id="container">
          <div id="main">
              <div id="content">
                  <div class="page_aticle aticle_type2">
                      <div id="snb" class="snb_my" style="position: absolute;">
                          <h2 class="tit_snb">마이페이지</h2>
                          <div class="inner_sub">
                              <ul class="list_menu">
                                  <li class="on">
                                      <a href="#" style="color: gray;">주문내역</a>
                                  </li>
                                  <li>
                                      <a href="#">찜한 상품</a>
                                  </li>
                                  <li>
                                      <a href="delibery_List.do" style="color: #5f0080;">배송지관리</a>
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

                      </div>
                      <div id="viewOrderList" class="page_section section_orderlist">

                          <!-- 배송지 관리 구역 시작 -->
                    <div class="page_section section_destination">
                        <div class="head_aticle">
                            <h2 class="tit">
                 <!--              
		                               배송지 관리
		                                
		                                db 회원 배송지 정보
		                                요걸 불러오려고 하거든요?
		                                ArrayList<ShippingAdress> = new ArrayList<
                                -->
                                <span id="addrListInfo" class="tit_sub">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                            </h2>
                            <div class="new_address">
                                <button type="button" class="btn" id="newAddressAdd" onclick="popup_address_add()">
                                    <img src="https://res.kurly.com/pc/ico/2006/ico_add_16x16.svg" alt="" class="ico">
                                    새 배송지 추가
                                </button>
                            </div>
                        </div>

                        <div id="tblParent" class="type_select">
                            <table class="tbl tbl_type1">
                                <thead>
                                    <tr>
                                        <th class="tit_num">번호</th>
                                        <th class="tit_address">주소</th>
                                        <th class="tit_receive">받으실 분</th>
                                        <th class="tit_phone">연락처</th>
                                        <th class="tit_delivery">배송유형</th>
                                        <th class="tit_modify">수정</th>
                                     <!--  
											 회원 정보 받는 메소드, 
											회원정보를 뽑은 멤버객체에서 회원넘버 외래키를 get 으로뽑아서 그거를 매개변수로 배송지를 불러오는 메서드 만들기
											memeber 회원정보, ArrayList<배송정보> 이 배송정보를 리퀘스트로 담아서 여기서 뽑으면 됨
                                        =
                                     -->
                                    </tr>
                                </thead>

                                <tbody id="addrList">
                                    <tr>

                                        <td class="num">1</td>

                                        <td class="address">
                                            <span class="badge_default">
                                                기본 배송지
                                            </span>
                                        
                                            <p class="addr">
                                                경기도 광명시 하안동
                                            </p>
                                        </td>

                                        <td class="name">조승호</td>

                                        <td class="phone">010-5478-2274</td>

                                        <td>
                                            <span class="delivery star">
                                                샛별배송
                                            </span>
                                        </td>

                                        <td>
                                            <button type="button" class="ico modify" onclick="popup_change()">
                                                수정하기
                                            </button>
                                        </td>
                                        

                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                          <!-- 배송지 관리 구역 끝 -->


                          <div class="layout-pagination">
                              <div class="pagediv" style="height: 500px;">
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
    <!-- 자주하는질문 페이지 영역 끝 -->

      <%@ include file="../common/footer.jsp" %>
      
      </div>
    </div>  
  </body>
</html>
