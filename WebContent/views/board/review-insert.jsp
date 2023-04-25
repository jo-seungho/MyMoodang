<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board//review-insert.css">
    <link rel="stylesheet" href="../img/image.gif">

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="../js/review-insert.js"></script>

    <title>후기 작성</title>


  </head>
  <body>

      <%@ include file="../common/header.jsp" %>
    <div id="Container-Wrapper">
    <!-- 후기 작성 페이지 영역 시작 -->
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
                                      <a href="#">배송지관리</a>
                                  </li>
                                  <li>
                                      <a href="#" style="color: #5f0080;">리뷰 관리</a>
                                  </li>
                                  <li>
                                      <a href="#">쿠폰</a>
                                  </li>
                                  <li>
                                      <a href="/updateCheckPwd.me">내 정보 수정</a>
                                  </li>
                              </ul>
                          </div>

                      </div>
                      <div id="viewOrderList" class="page_section section_orderlist">

                          <!-- 후기 작성 구역 시작 -->
                    <div class="page_section section_destination">
                        <div class="head_aticle">
                            <h2 class="tit-reivew">

                                <span id="title-info" class="tit_sub">후기 작성</span>
                            </h2>

                        </div>

                        <div id="tblParent" class="type_select">
                            <table class="tbl tbl_type1"> <!-- 후기 작성-->
                                <thead>
                                    <!-- 이미지 파일이랑 그 옆에 상품명 영역-->
                                    <tr>
                                      <th>
                                        <div>
                                        <img src="/resources/img/logo.png" alt="이미지 준비중" id="rev-img">
                                        </div>
                                      </th>
                                      <th align="left">
                                      <span id="rev-productName" padding="auto">무당무당</span>
                                      </th>
                                    </tr>
                                </thead>

                                <tbody id="rev-inputTable">
                                    <tr>
                                        <td class="rev-title">제목</td>

                                        <td id="rev-input-title">
                                            <input type="text" id="title-InputArea" placeholder="제목을 입력하세요" required>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="rev-content">후기 작성</td>
                                        <td id="inputReview-content">
                                          <input type="text" id="rev-content2" placeholder="후기의 내용을 입력해주세요" text-align="top" required>
                                        </td>
                                    <tr>
                                        <td class="rev-image">사진 등록</td>

                                        <td id="rev-inputImage">
                                          <div align="left">
                                            <input type="file" name="image" id="image-file" style="display: none;">

                                              <!-- 사진 업로드용 버튼 --><button id="uploadImg-B">
                                                <b>+</b>
                                              </button>
                                            </div>
                                            <div id="uploaded-images" style="margin-bottom: 10px;">
                                              <!-- 이미지 미리보기 요소 js 코드 -->
                                            </div>
                                          <div id="upload-must">
                                            <text style="font-weight: bold; font-size : 12px">
                                              구매할 상품과 관련된 상품 사진만을 입력하세요(최대 5개)
                                            </text>
                                          </div>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td id="insert-sp">별점</td>
                                      <td id="insert-spTd">
                                        <div id="guide-insertSp" align="right">별점을 입력해주세요(숫자만 가능)
                                          <input type="number" id="input-starPoint" placeholder="별점 입력 ex) 4" required>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr id="about_1to1">
                                      <td id="link-1to1Text" colspan="2">상품에 궁금한 게 있으신가요?
                                        <a href="1대1 문의 링크 넣어야됨" id="link-1to1">1:1 문의 바로 가기</a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td colspan="2">
                                        <button type="submit" id="reviewInsert-submit">등록하기</button>
                                      </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                          <!-- 후기 작성 테이블 구역 끝 -->


	<%@ include file="../common/footer.jsp" %>
  </body>
</html>
