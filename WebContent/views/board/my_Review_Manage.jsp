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
    <link rel="stylesheet" href="/resources/css/board/notice.css">
    <link rel="stylesheet" href="/resources/css/board/my_Review_Manage.css">
    <title>내 리뷰 관리</title>

    <style>


.myRev-deContent {
            border : 1px solid lightgray;
            display: flex;
            box-sizing : border-box;
            display : none;
        }
        #titleWrap {
          display: flex;
          align-items: center;
          margin-left: 50px;
          width: 400px;
          flex-direction: column;
          justify-content: center;
        }
        .my_img img {
          width: 140px;
        }


    </style>
    <title>내리뷰곤리</title>
    <script>

        $(function() {

            $(".item").click(function() {

                let $detailCon = $(this).next();


                if($detailCon.css("display") == "none") {

                    $(this).siblings(".myRev-deContent").slideUp(1000);

                    // 보여지게끔
                    $detailCon.slideDown(1000); // 시간 부여가 가능
                } else {


                    $detailCon.slideUp(1000); // 시간 부여가 가능
                }
            });

        });

    </script>
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
                                                    <a href="#">내 정보 수정</a>
                                                </li>
                                            </ul>
                                        </div>


                                    </div>
                     <!--  사이드바 영역 끝 -->


                    <!-- 내 리뷰관리 페이지 시작 -->
                      <div id="viewOrderList" class="page_section section_orderlist">
                          <div class="head_aticle">
                              <h2 class="tit">
                                  리뷰관리
                                  <span class="tit_sub">
                                    내가 작성한 리뷰들을 모아놨어요.
                                  </span>
                              </h2>
                          </div>

                          <div class="board_list_wrap">

                            <div class="board_list_head" id="myRev-div">
                              <div class="product-img">상품이미지</div>
                              <div class="order_num">주문번호</div>
                              <div class="review_title">제목</div>
                              <div class="productSp">별점</div>
                              <!-- 내용은 div 누르면 나오게

                              <div class="rev-content">내용</div>
                              -->
                              <div class="review-Date">작성날짜</div>
                            </div>

                            <div class="board_list_body item">
                              <div class="item">
                                <div class="product-img">구매한 이미지</div>
                                <div class="order_num">1241241</div>
                                <div class="review_title">치킨</div>
                                <div class="productSp">4</div>
                                <div class="review-Date">2023-04-02</div>
                              </div>
                            <div class="myRev-deContent" id="ee" style="display: flex;">
                              <div class="my_img">
                                <img src="/resources/img/과일1.jpg" alt="리뷰작성시 단 이미지">
                              </div>
                              <div id="titleWrap">
                                <div class="1">
                                    Q. 매번 ㅋㅍ에서만 주문했는데  받을때마다 택배포장 상태가 별로여서
                                    검색해보다가 처음으로 마이무당 이용해봤는데 포장이고 상품이고 다 너무 만족해요
                                    이제 마이무당으로 정착하려구요 ㅠㅠㅠ
                                    Q. 도시락 구성이 좋아보여서 주문했는데
                                    배송도 빠르고 무엇보다 너무 맛있어요..ㅠㅠ
                                    Q. 다른곳보다 가격이 저렴해서 조아여~~~
                                </div>

                              </div>
                            </div>


                            <div class="item">
                              <div class="product-img">구매한 이미지</div>
                              <div class="order_num">1241241</div>
                              <div class="review_title">치킨</div>
                              <div class="productSp">4</div>
                              <div class="review-Date">2023-04-02</div>
                            </div>

                            <!-- <divclass=myRev-deContent> 를 누르면-->
                            <div class="myRev-deContent" style="display: flex;">
                              <div class="my_img">
                                <img src="/resources/img/과일2.jpg" alt="리뷰작성시 단 이미지">
                              </div>
                              <div id="titleWrap" style="display: flex; flex-direction: column;">
                              <div class="2">
                              Q. 도시락 구성이 좋아보여서 주문했는데
                                  배송도 빠르고 무엇보다 너무 맛있어요..ㅠㅠ
                              </div>
                              </div>
                            </div>


                            <div class="item">
                              <div class="product-img">구매한 이미지</div>
                              <div class="order_num">1241241</div>
                              <div class="review_title">치킨</div>
                              <div class="productSp">4</div>
                              <div class="review-Date">2023-04-02</div>


                            </div>
                            <div class="myRev-deContent" style="display: flex;">
                              <div class="my_img">
                                <img src="/resources/img/과일3.jpg" alt="리뷰작성시 단 이미지">
                              </div>
                              <div id="titleWrap" style="display: flex; flex-direction: column;">
                              <div class="3">
                                    Q. 매번 ㅋㅍ에서만 주문했는데  받을때마다 택배포장 상태가 별로여서
                                        검색해보다가 처음으로 마이무당 이용해봤는데 포장이고 상품이고 다 너무 만족해요
                                        이제 마이무당으로 정착하려구요 ㅠㅠㅠ
                                    Q. 도시락 구성이 좋아보여서 주문했는데
                                        배송도 빠르고 무엇보다 너무 맛있어요..ㅠㅠ
                                    Q. 다른곳보다 가격이 저렴해서 조아여~~~
                              </div>
                              </div>
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