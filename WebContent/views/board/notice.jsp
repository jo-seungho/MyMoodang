<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.user.board.notice.model.vo.Notice, com.kh.common.model.vo.PageInfo"%>


<%
	// 필요한 데이터들 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

	// 자주 쓰일법한 변수들 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>


    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board/notice.css">



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
                              <div class="notice_date">작성일</div>
                              <div class="notice_view">조회수</div>
                            </div>



                          		<!--
                          		if(list.isEmpty)
                          		이부분 채워야함!!!!!!!

                          		-->



                            <div class="board_list_body">
                          		<%for(Notice n : list){ %>
	                              <div class="item">
	                                <div class="notice_num"><%=n.getNoticeNo() %></div>
	                                <div class="notice_tit" ><a id="no_tit" href="#"><%=n.getNoticeTitle() %></a></div>
	                                <div class="notice_date"><%=n.getCreateDate() %></div>
	                                <div class="notice_view"><%=n.getViews() %></div>
	                              </div>
                         	<%} %>
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

	    <script>
	    $('.item').on('click', function() {
	        var nno = $(this).find('.notice_num').text();

			location.href = "/noticedetail.no?nno=" + nno;

	    });

	    </script>


    <!-- 페이징 바  -->
    	<div align="center" class="paging-area">

			<% if(currentPage != 1) { %>
				<button onclick="location.href = '//noticelist.no?currentPage=<%= currentPage - 1 %>';">
					&lt;
				</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++) { %>
				<% if(p != currentPage) { %>
					<button onclick="location.href = '//noticelist.no?currentPage=<%= p %>';">
						<%= p %>
					</button>
				<% } else { %>
					<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
					<button disabled><%= p %></button>
				<% } %>
			<% } %>

			<% if(currentPage != maxPage) { %>
				<button onclick="location.href = '//noticelist.no?currentPage=<%= currentPage + 1 %>';">
					&gt;
				</button>
			<% } %>

		</div>

       <%@ include file="../common/footer.jsp" %>

  </body>
</html>