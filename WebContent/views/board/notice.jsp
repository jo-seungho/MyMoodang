<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board/notice.css">
    <link rel="stylesheet" href="../css/common.css">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script defer src="../js/header.js"></script>

    <title>공지사항</title>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

	<%@ include file="../common/header.jsp" %>
              <!--  사이드바 영역 시작 -->
             <div id="Container-Wrapper">
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
                     <!--  사이드바 영역 끝 -->


                    <!-- 공지사항 페이지 시작 -->              
                      <div id="viewOrderList" class="page_section section_orderlist">
                          <div class="head_aticle">
                              <h2 class="tit">
                                  공지사항
                                  <span class="tit_sub">
                                    마이무당의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
                                  </span>
                              </h2>
                          </div>

                          <div class="board_list_wrap">
                            <div class="board_list_head">
                              <div class="notice_num">번호</div>
                              <div class="notice_tit">제목</div>
                              <div class="notice_writer">작성자</div>
                              <div class="notice_date">작성일</div>
                              <div class="notice_view">조회수</div>
                            </div>
                            <div class="board_list_body">
                              <div class="item">
                                <div class="notice_num">공지</div>
                                <div class="notice_tit" ><a href="#">마이무당만의 철학을 알려드립니다!</a></div>
                                <div class="notice_writer">health1004</div>
                                <div class="notice_date">2023-04-07</div>
                                <div class="notice_view">145</div>
                              </div>
                                <div class="item">
                                  <div class="notice_num">공지</div>
                                  <div class="notice_tit"><a href="#">마이무당 고객님께 안내드립니다!</a></div>
                                  <div class="notice_writer">health1004</div>
                                  <div class="notice_date">2023-04-07</div>
                                  <div class="notice_view">108</div>
                                </div>
                                <div class="item">
                                  <div class="notice_num">공지</div>
                                  <div class="notice_tit"><a href="#">친환경 지퍼백 운영 안내</a></div>
                                  <div class="notice_writer">health1004</div>
                                  <div class="notice_date">2023-04-07</div>
                                  <div class="notice_view">122</div>
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
                        <!-- 공지사항 끝 -->

                          
                      </div>
                  </div>
              </div>
          </div>
      </div>    
    <!-- 자주하는질문 페이지 영역 끝 -->

       <%@ include file="../common/footer.jsp" %>

  </body>
</html>