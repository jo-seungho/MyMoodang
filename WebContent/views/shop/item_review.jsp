<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이무당  - 상품리뷰</title>
    <link rel="stylesheet" href="/resources/css/board/item_review_common.css">
    <link rel="stylesheet" href="/resources/css/board/item_review_reset.css">
    <link rel="stylesheet" href="/resources/css/board/item_review.css">
    <link rel="stylesheet" href="/resources/css/board/mymoodang_order_list.css">
    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/common/footer.css" />
    <link rel="stylesheet" href="/resources/css/member/edit_my_info_pw_check.css" />
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/board/item_review_common.js"></script>
    <script src="/resources/js/board/item_review_my.js"></script>
    <script src="/resources/js/shop/item_review_mymoodang.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="/resources/js/common/header.js"></script>
</head>
<body>

			<%@ include file="../common/header.jsp" %>
			
			
    <div id="container">
        <div id="main">
            <div id="content">
                <div id="myPageTop" class="page_aticle mypage_top">
                    <h2 class="blind">마이페이지</h2>
                    <div class="mypagetop_user">
                        <div class="inner_mypagetop">
                            
                            <div class="grade_user">
                                <div class="grade">
                                    <span class="blind">등급</span>
                                    <span class="ico_grade class0">
                                        <span class="inner_grade">
                                            <span class="in_grade">일반</span>
                                        </span>
                                    </span>
                                    <div class="grade_bnenfit">
                                        <div class="user">
                                            <strong class="name">멋쟁이</strong>
                                            <span class="txt">님</span>
                                        </div>
                                        <div class="benefit">
                                            <strong class="tit"></strong>
                                            적립 0.5%
                                        </div>
                                    </div>
                                </div>
                                <div class="next">
                                    <a href="#" class="total_grade">전체등급 보기</a>
                                </div>
                            </div>

                            <ul class="list_mypage">
                                <li class="user_reserve">
                                    <div class="link">
                                        <div class="tit">
                                            적립금
                                        </div>
                                        <a href="#" class="info">
                                            1,000 원
                                            <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히보기">
                                            <span class="date">소멸 예정 0원</span>
                                        </a>
                                    </div>
                                </li>
                                <li class="user_coupon">
                                    <div class="link">
                                        <div class="tit">
                                            쿠폰
                                        </div>
                                        <a href="#" class="info">
                                            12 개
                                            <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기">
                                        </a>
                                    </div>
                                </li>
                                <li class="user_kurlypass">
                                    <div class="link">
                                        <div class="tit">
                                          
                                        </div>
                                        <a href="#" class="info info_link">
                          
                                            <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기">
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        
                        </a>
                    </div>
                </div>
               <!-- 사이드 메뉴바 시작 -->
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="page_aticle aticle_type2">
                    <div id="mypage_side" class="snb_my">
                        <h2 class="tit_snb">마이페이지</h2>
                        <div class="inner_sub">
                            <ul class="list_menu">
                                <li>
                                    <a href="../main/order_list.html">주문내역</a>
                                </li>
                                <li>
                                    <a href="#">찜한 상품</a>
                                </li>
                                <li>
                                    <a href="../main/delivery_list.html">배송지 관리</a>
                                </li>
                                <li>
                                    <a href="#">리뷰 관리</a>
                                </li>
                                <li>
                                    <a href="../main/oneonone.html">1:1 문의</a>
                                </li>
                                <li>
                                    <a href="#">쿠폰</a>
                                </li>
                                <li class="on">
                                    <a href="../main/edit_my_info_pw_check.html">내 정보 수정</a>
                                </li>
                            </ul>
                        </div>
                    </div>
               
                    
                    <div class="page_section section_review">
                        <div class="head_aticle">
                            <h2 class="tit">리뷰 관리</h2>  
                        </div>

                        <div id="reviewView">
                            <div class="review_notice">
                                <p>
                                    <b>리뷰 작성 시 사진리뷰 100원, 글리뷰 50원을 적립해드립니다.</b>
                                </p>
                                - 퍼플, 더퍼플은 
                                <b>2배</b> 
                                	적립 (사진 200원, 글 100원)
                                <br>
                                - 주간 베스트 리뷰로 선정 시 
                                <b>5,000원</b>
                                	을 추가 적립
                                <br>
                                * 리뷰 작성은 배송 완료일로부터 30일 이내 가능합니다.
                            </div>

                            <ul class="tab_menu">
                                <li class="on">
                                    <a href="#">
                                        	작성가능 리뷰
                                        <span>(0)</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        	작성완료 리뷰
                                        <span>(1)</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        
                        
                        
						<!-- 작성가능 리뷰 -->
                        <div id="viewBeforeList" class="before_view" style="display:block;">
                            <ul class="list_before">
                                <li class="no_data">
                                    	작성가능 리뷰 내역이 없습니다.
                                </li>
                            </ul>
                        </div>
						
						
						
						<!-- 작성완료 리뷰 -->
                        <div id="viewAfterList" class="after_view" style="display:none;">
                            <ul class="list_after">
                                <li>
                                    <div class="tit_after">
                                        <a href="#" class="main_name">[램노스] 스프레더블 리코타치즈</a>
                                    </div>

                                    <div class="cont_after">
                                        <a class="desc_after">
                                            <span class="subject">
                                                그냥 리코타 치즈 ㅇㅇ
                                                <span class="date">
                                                    23.04.18 작성
                                                </span>
                                            </span>

                                            <span class="desc">
                                                <span class="thumb">
                                                    <span class="photo" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/review/20200526/94edd664f356ea243a30d8e9797cc5ad.jpg&quot;);">
                                                    </span>
                                                </span>
                                                <span class="txt">양은 꽤 많고 리코타 치즈치고 약간 묽긴한데 몽글몽글한게 참 귀엽습니다. 샐러드에 넣어 먹을 때 가장 맛있는 치즈 같아요</span>

                                            </span>

                                            <span class="view">
                                                <span class="img">
                                                    <img src="https://img-cf.kurly.com/shop/data/review/20200526/94edd664f356ea243a30d8e9797cc5ad.jpg" alt="첨부 이미지">

                                                </span>

                                                <span class="txt">
                                                    양은 꽤 많고 리코타 치즈치고 약간 묽긴한데 몽글몽글한게 참 귀엽습니다. 샐러드에 넣어 먹을 때 가장 맛있는 치즈 같아요
                                                    <br>
                                                </span>
                                            </span>


                                        </a>

                                        <div class="btn_after">
                                            <button type="button" class="btn_help">도움이 돼요 0</button>
                                            <a class="btn btn_modify">수정</a>
                                            <a class="btn btn_del">삭제하기</a>

                                        </div>
                                    </div>
                                </li>

                                
                                

                                
                            </ul>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    
   <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>    <br><br><br><br><br>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>