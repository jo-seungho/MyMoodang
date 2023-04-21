<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

   <%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/board/faq.css">

    <title>자주하는질문</title>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

    <%@ include file="../common/header.jsp" %>
    <!-- 자주하는질문 페이지 영역 시작 -->
      <div id="container">
          <div id="main">
              <div id="content">
                  <div class="page_aticle aticle_type2">
                      <div id="snb" class="snb_my" style="position: absolute;">
                          <h2 class="tit_snb">고객센터</h2>
                          <div class="inner_sub">
                              <ul class="list_menu">
                                  <li class="on">
                                      <a href="#">공지사항</a>
                                  </li>
                                  <li>
                                      <a href="#">자주하는 질문</a>
                                  </li>
                                  <li>
                                      <a href="#">상품 후기</a>
                                  </li>
                              </ul>
                          </div>
                          <a href="#" class="link_inquire">
                              <span class="emph">도움이 필요하신가요?</span>
                              1:1 문의하기
                          </a>
                      </div>
                      <div id="viewOrderList" class="page_section section_orderlist">
                          <div class="head_aticle">
                              <h2 class="tit">
                                  자주하는 질문
                                  <span class="tit_sub">
                                      고객님들께서 가장 자주하시는 질문을 모두 모았습니다.
                                  </span>
                              </h2>
                          </div>
                          <!-- 드롭다운구역 시작-->
                          <select name="" id="drop-section">
                            <option value="">제목</option>
                            <option value="">글 번호</option>
                            <option value="">카테고리</option>
                          </select>
                          <!-- 드롭다운구역 끝 -->

                          <!-- 자주하는질문 페이지 시작 -->
                          <div id="faq-section" style="margin-top: 50px;">
                            <table align="center" style="border-top: 5px solid lightgray; font-size: large; font-weight: 900; border-radius: 5px; border-spacing: 20px; border-collapse: separate; box-sizing: border-box;">

                                <tr>
                                  <th width="80" style="font-weight: 900;">번호</th>
                                  <th width="150" style="font-weight: 900;">카테고리</th>
                                  <th width="600" style="font-weight: 900;">제목</th>
                                </tr>

                            </table>

                            <table align="center" style="border-spacing: 20px; border-top: 1px solid lightgray; font-size: medium; border-bottom: 1px solid lightgray;">
                                <tr>
                                  <th width="80" style="font-weight: 500;">1</th>
                                  <th width="150" style="font-weight: 500;">회원문의</th>
                                  <th width="600" style="font-weight: 500;">회원가입은 무료인가요?</th>
                                </tr>
                            </table>

                            <div style="margin: 30px 140px;">
                              <span style="color: red; font-size: large; font-weight: 600;">A.</span>
                              <span style="font-size: medium; font-weight: 500;">마이무당은 배송지역 상관 없이 회원가입은 무료입니다. <br>
                              회원가입 후 다양한 예택과 상품을 만나보세요!</span>
                            </div>

                            <table align="center" style="border-spacing: 20px; border-top: 1px solid lightgray; font-size: medium; border-bottom: 1px solid lightgray;">
                                <tr>
                                  <th width="80" style="font-weight: 500;">2</th>
                                  <th width="150" style="font-weight: 500;">회원문의</th>
                                  <th width="600" style="font-weight: 500;">주문하지 않았는데, 주문완료 메세지 또는 배송완료 메세지를 받았습니다.</th>
                                </tr>
                            </table>

                            <div style="margin: 30px 140px;">
                              <span style="color: red; font-size: large; font-weight: 600;">A.</span>
                              <span style="font-size: medium; font-weight: 500;">상품을 주문하신 고객님이 핸드폰 번호를 잘못 입력하신 경우<br><br>
                              주문하지 않은 고객님께 문자가 발송되는 경우가 있으며, <br><br>
                              지인분께서 고객님께 선물하실 경우에는 수령자 번호로 <br><br> 배송완료 메세지가 발송되므로 선물배송일 가능성도 있습니다.
                            </span>
                            </div>


                            <table align="center" style="border-spacing: 20px; border-top: 1px solid lightgray; font-size: medium; border-bottom: 1px solid lightgray;">
                                <tr>
                                  <th width="80" style="font-weight: 500;">3</th>
                                  <th width="150" style="font-weight: 500;">주문/결제</th>
                                  <th width="600" style="font-weight: 500;">전화로도 주문할 수 있나요?</th>
                                </tr>
                            </table>

                            <div style="margin: 30px 140px;">
                              <span style="color: red; font-size: large; font-weight: 600;">A.</span>
                              <span style="font-size: medium; font-weight: 500;">저희 마이무당은 고객 여러분의 편의를 위해<br><br>
                              다양한 플랫폼에서 서비스를 제공하고있으며,<br><br>
                              전화를 통한 주문 역시 가능합니다.
                            </span>
                            </div>

                          </div>


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
    <!-- 자주하는질문 페이지 영역 끝 -->

      <%@ include file="../common/footer.jsp" %>
  </body>
</html>
