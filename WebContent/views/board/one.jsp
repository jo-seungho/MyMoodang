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
    <link rel="stylesheet" href="/resources/css/board//one.css">
    <link rel="stylesheet" href="../css/footer.css">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="../js/header.js"></script>

    <title>1 : 1 문의</title>
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->
		<%@ include file="../common/header.jsp" %>
    <!-- 1 : 1 문의 영역 시작 -->
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
                              <li class="one">
                                  <a href="#">1 : 1 문의 </a>
                              </li>
                          </ul>
                      </div>
                    
                  </div>
                  <div id="viewOrderList" class="page_section section_orderlist">
                      <div class="head_aticle">
                          <h2 class="tit">
                              1 : 1 문의
                              <span class="tit_sub">
                                  1:1문의를 접수해 주시면 상세히 답변드리겠습니다
                              </span>
                          </h2>
                      </div>
                      
                  
                      <form action="" method="">
                        <input id="md" type="button" value="문의 등록">
                      </form>
                      <!-- 1 : 1 문의 페이지 시작 -->
                      <div id="one-section" >

                        
                        <table id="nb1" align="center">
                          
                            <tr>
                              <th class="n1">번호</th>
                              <th class="n2">카테고리</th>
                              <th class="n3">제목</th>
                              <th class="n4">작성자</th>
                              <th class="n5">작성일</th>
                            </tr>

                        </table>

                        <table id="sd1" align="center">
                          <tr>
                            <th class="s1">1</th>
                            <th class="s2">서비스 이용 및 기타</th>
                            <th class="s3">서비스가 불편한데요?</th>
                            <th class="s4">[답변완료]</th>
                            <th class="s5">angry1818</th>
                            <th class="s6">2023-03-29</th>
                          </tr>
                      </table>

                        <table id="bs1" align="center">
                            <tr>
                              <th class="b1">2</th>
                              <th class="b2">배송문의</th>
                              <th class="b3">왜 배송이 안옵니까? 화나네</th>
                              <th class="b4">[답변완료]</th>
                              <th class="b5">angry1818</th>
                              <th class="b5">2023-03-27</th>
                            </tr>
                        </table>

                        <div class="d1">
                          <!--<span style="color: red; font-size: large; font-weight: 600;">A.</span>-->
                          <span class="d2">아니 언제 와요 빨리 좀 보내줘요
                          
                        </span>
                        </div>

                        <div class="d3">
                          <span class="d4">ㄴ</span>
                          <span class="d5">안녕하세요.<br><br></span>
                          <span class="d6">대한민국 1등 건강쇼핑몰 마이무당입니다.
                          <br><br>배송서비스와 관련하여 불편을 드려 죄송합니다.<br><br> 현재 해당 상품의 주문량이 폭주하여 배송이 늦어지고 있습니다.<br><br>
                          배송이 늦어지는 부분에 대해서 배송업체와 연락하여 빠른 조취를 취하도록 하겠습니다.<br><br>
                          <br>다시 한번 불편을 드려 죄송합니다.<br><br>
                          <br>-마이무당-
                          </span>
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
  
    </div>
    
    <!-- 1:1 페이지 영역 끝 -->
	<%@ include file="../common/footer.jsp" %> 
  </body>
</html>