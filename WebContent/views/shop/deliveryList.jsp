<!-- 2023.04.24 / 상세 주소를 기본 배송지에 보이도록 추가 / 이지환  -->
<!-- 2023.04.25 defaultAddress 스클립틀릿 구문 추가, 기본 배송지 설정 유무에 따라 <span>기본배송지</span>영역이 보이고, 안 보이고 설정
add_search.jsp와 연결 및 popup_function 수정 /
 / 이지환 -->


<!-- 2023.04.23 이지환
	popUp_change function의 매개변수에 shipNo 추가,
	수정하기 버튼의  팝업 function 안에
	/*	<%-- 		(<%= shipAddress.getShipNo() %>) 스클립틀릿 구문 추가 --%>
-->

 
 <!-- 2023.04.19 / 파일명 delibery_List -> deliveryList 로 수정 및
로그인한 회원이 header의 우측 상단의 배송지 관리 클릭 시 내 배송지 목록들이 나오게끔 코드 작성
스클립틀릿 구문 추가&하드코드들을 소프트코드로 바꿈

/ 이지환  -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.kh.user.member.model.vo.ShippingAddress" %>


<% // 조회된 list 를 request 로부터 뽑아내기
	ArrayList<ShippingAddress> list = (ArrayList<ShippingAddress>)request.getAttribute("list");
%>

<!-- 2023.04.25 defaultAddress 스클립틀릿 구문 추가 / 이지환 -->
<% ShippingAddress defaultAddress = (ShippingAddress)request.getAttribute("defaultAddress"); %>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

      <!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/shop/delivery_list.css">

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/shop/deliver.js"></script>

    <title>배송지관리</title>
    <script>
        function popup_address_add(memberNo){    //배송지 추가
            var popupX = (window.screen.width / 2) - (530 / 2);   // 팝업창을 가운데 띄우기 위한거
            var popupY = (window.screen.height / 2) - (400 / 2);
            
   <%-- 2023.04.24 url 수정 / 이지환 --%>
            var url = "http://localhost:8082/addForm.de?=memberNo";        // var url = "product_modify/"+ id;
            var name = "popup test";
            var option = "width = 530, height = 400, top = " + popupY + " , left = " + popupX + " , location = no"
            window.open(url, name, option);
        }

        function popup_change(shipNo){    //수정
            var popupX = (window.screen.width / 2) - (530 / 2);   // 팝업창을 가운데 띄우기 위한거
            var popupY = (window.screen.height / 2) - (510 / 2);
            var url = "http://localhost:8082/updateForm.de?shipNo=" + shipNo;        // var url = "product_modify/"+ id;
            var name = "popup";
            var option = "width = 530, height = 510, top = " + popupY + " , left = " + popupX + " , location = no"
            window.open(url, name, option);
        }

         <% if(session.getAttribute("alertMsg") != null && session.getAttribute("isSuccess") != null){ %>
        alert("<%= session.getAttribute("alertMsg") %>");


        <% session.removeAttribute("alertMsg"); %>


        <%-- 2023.04.24 / 팝업창을 닫고, 부모창 기준으로 새로 고침한다( opener.location.reload() ) / 이지환 --%>
        window.close();
        opener.location.reload();


    <% } %>

    </script>
  </head>
  <body>

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
                                      <a href="/orderList.it" style="color: gray;">주문내역</a>
                                  </li>
                                  <li>
                                      <a href="/wishList.wi">찜한 상품</a>
                                  </li>

                                  <li class="on">
                                      <a href="/deliveryList.do">배송지 관리</a>
                                  </li>
                                  <li>
                                      <a href="/ready">리뷰 관리</a>
                                  </li>
                                  <li>
                                      <a href="/ready">쿠폰</a>
                                  </li>
                                  <li>
                                      <a href="/updateCheckPwd.me">내 정보 수정</a>
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

                                <h2 class="tit">
                                배송지 관리
                                <span class="tit_sub">

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
                                  	
                                    </tr>
                                </thead>

								<!-- 2023.04.19 / 배송지 목록을 기본 하드 코딩 되어 있던 거에서 로그인한 회원이 자신의 배송지관리 화면으로 접속 시
									 자신의 배송지 목록들을 볼 수 있게끔 소프트 코딩 형식 코드 작성 / 이지환 -->
                               <tbody id="addrList">
								    <% if(list != null && !list.isEmpty()) { %>
								        <% int index = 1; %>
								        <% for(ShippingAddress shipAddress : list) { %>
								            <tr>
								                <td class="num"><%=  index %></td>
								                <td class="address">
								                
								                <!-- 2023.04.25 로그인하고 기본배송지에 해당되는 배송지만 기본배송지 라는 글자가 보이게 함 이지환 -->
								                      <% if("Y".equals(shipAddress.getDefaultAddress().toUpperCase())) { %>
                    									<span class="badge_default">
									                       	기본 배송지
									                    </span>
									                  <% } %>
								                  
								                   <p class="addr">
								                  		<%= shipAddress.getShipAddr() %>
								                        	<!-- 상세주소를 기본 배송지 <p>에 해당되도록 추가 -->
								                        <%= shipAddress.getShipAddrInfo() %>
								                    </p>
								                </td>
								                <td class="name"><%= shipAddress.getShipName() %></td>
								                <td class="phone"><%= shipAddress.getPhone() %></td>
								                <td>
								                    <span class="delivery star">
								                        샛별배송
								                  </span>
								                </td>
								                <td>
								                    <button type="button" class="ico modify" onclick="popup_change(<%= shipAddress.getShipNo() %>)">
								                        수정하기
								                    </button>
								                </td>
								            </tr>
								            <% index++; %>
								        <% } %>
								    <% } %>
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
