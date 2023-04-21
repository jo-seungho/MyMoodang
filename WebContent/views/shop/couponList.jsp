<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠폰 리스트</title>

    <!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/shop/couponList.css" />

</head>
<body>

	<%@ include file="../common/header.jsp" %>

    <!-- 사이드 메뉴바 시작 -->
    <div id="container">
        <div id="main">
            <div id="content" style="height:800px;">
                <div class="page_aticle aticle_type2">
                    <div id="mypage_side" class="snb_my" style="position: absolute;">
                        <h2 class="tit_snb">마이페이지</h2>
                        <div class="inner_sub">
                            <ul class="list_menu">
                                <li>
                                    <a href="#">주문내역</a>
                                </li>
                                <li>
                                    <a href="#">찜한 상품</a>
                                </li>
                                <li>
                                    <a href="#">배송지 관리</a>
                                </li>
                                <li>
                                    <a href="#">리뷰 관리</a>
                                </li>
                                <li>
                                    <a href="#">1:1 문의</a>
                                </li>
                                <li class="on">
                                    <a href="#">쿠폰</a>
                                </li>
                                <li>
                                    <a href="#">내 정보 수정</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!--  COUPON 영역 시작 -->
                    <div id="couponList" class="page_section section_couponList">
                      <p class="p1">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; > 전체 등록쿠폰리스트
                         <b>총5개</b>의 쿠폰이 등록되어있습니다
                      </p>
                      <br><br>

                      <table>
                      <thead>
                        <tr class="hd1">
                          <th class="cimg">쿠폰이미지</th>
                          <th class="type">종류</th>
                          <th class="couponName">쿠폰명</th>
                          <th class="discountPay">할인금액(률)</th>
                          <th class="eventPeriod">행사기간</th>
                          <th class="targett">적용대상</th>
                          <th class="useNpublish">사용/발행</th>
                          <th class="registration">등록일자</th>
                          <th class="menu">메뉴</th>
                        </tr>
                      </thead>

                      <tbody>
                        <tr>
                          <td class="cpList">
                            <img src="/resources/img/30퍼.png" class="img1" alt="">
                          </td>
                          <td>이벤트쿠폰</td>
                          <td>이벤트쿠폰</td>
                          <td>30%</td>
                          <td>2023/04/12 ~ 2024/04/24</td>
                          <td>실버회원</td>
                          <td>2/10장</td>
                          <td>2023/04/20</td>
                          <td>
                            <button type="submit" id="cbtn">등록</button>
                            <button type="submit" id="dbtn">삭제</button>
                          </td>
                        </tr>
                         <tr>
                          <td class="cpList">
                            <img src="/resources/img/50퍼.png" alt="">
                          </td>
                          <td>신규쿠폰</td>
                          <td>신규회원쿠폰</td>
                          <td>50%</td>
                          <td>2023/04/15 ~ 2024/04/22</td>
                          <td>브론즈회원</td>
                          <td>1/10장</td>
                          <td>2023/04/20</td>
                          <td>
                            <button type="submit" id="cbtn">등록</button>
                            <button type="submit" id="dbtn">삭제</button>
                          </td>
                        </tr>
                         <tr>
                          <td class="cpList">
                            <img src="/resources/img/40퍼.png" alt="">
                          </td>
                          <td>감사쿠폰</td>
                          <td>스토어감사쿠폰</td>
                          <td>40%</td>
                          <td>2023/04/12 ~ 2024/04/24</td>
                          <td>골드회원</td>
                          <td>3/10장</td>
                          <td>2023/04/20</td>
                          <td>
                            <button type="submit" id="cbtn">등록</button>
                            <button type="submit" id="dbtn">삭제</button>
                          </td>
                        </tr>
                         <tr>
                          <td class="cpList">
                            <img src="/resources/img/50퍼.png" alt="">
                          </td>
                          <td>첫구매쿠폰</td>
                          <td>첫구매회원쿠폰</td>
                          <td>50%</td>
                          <td>2023/04/12 ~ 2024/04/24</td>
                          <td>전체회원</td>
                          <td>1/10장</td>
                          <td>2023/04/20</td>
                          <td>
                            <button type="submit" id="cbtn">등록</button>
                            <button type="submit" id="dbtn">삭제</button>
                          </td>
                        </tr>
                         <tr>
                          <td class="cpList">
                            <img src="/resources/img/30퍼.png" alt="">
                          </td>
                          <td>상품쿠폰</td>
                          <td>상품쿠폰</td>
                          <td>30%</td>
                          <td>2023/04/22 ~ 2024/04/24</td>
                          <td>실버회원</td>
                          <td>2/10장</td>
                          <td>2023/04/20</td>
                          <td>
                            <button type="submit" id="cbtn">등록</button>
                            <button type="submit" id="dbtn">삭제</button>
                          </td>
                        </tr>
                      </tbody>
                     </table>

                     <button type="submit" id="newCP">신규쿠폰등록</button><button type="submit" id="checkD">선택삭제</button>

                    </div>
                    <!-- COUPON 영역 끝 -->

                    </div>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="../common/footer.jsp" %>


</body>
</html>