<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/board/onelist.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">


    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="/resources/js/common/header.js"></script>

    <title>1 : 1 문의 글 작성</title>
  </head>
  <body>
    	<%@ include file="../common/header.jsp" %>

    <!-- 1 : 1 문의 글 작성 영역 시작 -->
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

                      <!-- 1 : 1 문의 글 작성 페이지 시작 -->
                      <div id="one-section" style="margin-top: 50px;">
                        <!-- <table style="border-collapse: separate; border-spacing: 10px 22px;">


                          <tr style="position: relative;">
                            <th style="font-size: 18px;">유형*</th>
                            <td>
                              <select name="" id="" style="position: absolute; left:60px; font-size: 15px; top: 0px; width: 250px;">
                                <option value=""disabled selected>주문/결제/반품/교환문의</option>
                                <option value="order">주문</option>
                                <option value="payment">결제</option>
                                <option value="return">반품</option>
                                <option value="change">교환문의</option>
                              </select>
                            </td>
                            <div style="border-bottom: 1px solid black;"></div>
                          </tr>




                          <tr style="position: relative;">
                            <th style="font-size: 18px;">제목*</th>
                            <td>
                              <input type="text" name="" id=""
                                    placeholder="제목을 입력해주세요."
                                    style="width:500px; height: 25px; position: relative; left: 5px;" >
                            </td>
                          </tr>


                          <tr>
                            <th style="font-size: 18px;">내용 *</th>
                            <td>
                              <textarea name="" id="" cols="30" rows="10" style="width:500px;resize: none; position: relative; left:5px;" placeholder="내용을 입력해주세요."></textarea>
                            </td>
                          </tr>
                        </table> -->

                          <div class="typeWrapper">
                            <p class="oneCategory">유형*</p><br><br><br>
                            <select name="" class="categorySelect">
                                <option value=""disabled selected>주문/결제/반품/교환문의</option>
                                <option value="order">주문</option>
                                <option value="payment">결제</option>
                                <option value="return">반품</option>
                                <option value="change">교환문의</option>
                              </select>
                          </div>

                          <div  class="oneTitle">
                           <p> 제목* </p> <br><br><br>
                            <input type="text" name="tltle" placeholder="제목을 입력해주세요.">
                          </div>

                          <div class="oneContent">
                           <p> 내용* </p>
                            <textarea name="content"  cols="30" rows="10"  placeholder="내용을 입력해주세요."></textarea>
                          </div>

                          <button type="submit" id="dbtn">등록</button>



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



    <!-- 1:1 페이지 영역 끝 -->

	<%@ include file="../common/footer.jsp" %>


  </body>
</html>
