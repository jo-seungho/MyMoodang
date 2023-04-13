<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyMoodang</title>

  <link rel="stylesheet" href="/mmo/resources/css/mainContent.css">

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



  <script src="/mmo/resources/js/header.js"></script> 
  <script src="/mmo/resources/js/mainPage.js"></script>
  
</head>
<body>
<body>
<!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->
    
    
    <div id="wrap">
   <%@ include file="../common/header.jsp" %>
     <!-- id="visual" -->
        <div id="main">
            <div id="contents" class="page_aticle">
               
    
                <div class="top_btn">
                    <button id="go-top" alt="맨 위로가기" style="display: none;"></button>
                </div>
    
                
                
                
                
                <!-- 여기서 부터 슬라이더 전체 영역 -->
                <div class="main_type1">
                <!-- type1:  -->
                <div class="product_list">
                    <!-- 상품 추천 -->
                        <div class="tit_goods">
                            <h3 class="tit">
                                <span class="name">
                                놓치기 아까운 할인상품!
                                </span>
                                <!-- 아이콘 없는 버전, h3에 링크 없음 -->
                            </h3>
                        </div>

                        <!-- 탑 슬라이터 구역 -->
                                <ul id="slideUlTag" class="autoplay">
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품1.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품2.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품3.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품4.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품5.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                        <!-- 탑 슬라이더 구역 -->
                        
                    </div>
                </div>
                <!-- 여기까지 슬라이더 전체 영역 -->

                <!-- 본문 게시글 시작 -->
                <div class="main_type2 bg">
                    <div class="main_event">
                        <div class="tit_goods">
                            <h3 class="tit">
                            <!-- 아이콘 있는 버전, h3에 링크 있음 -->
                                <a href="#" class="name">
                                    <span class="ico">따끈 따끈 신상품</span>
                                </a>
                            </h3>
                        </div>
                        <div class="list_goods">
                            <ul data-title="이벤트 소식" data-section="event" class="list_goods_ul">
                                <li>
                                    <li data-index="1">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일1.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611247553.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">망고는 매잉고</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">미리미리 쟁여두세요!</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="2">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일2.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611317260.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">귤은 뀰!</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">한라봉 아님</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="3">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일3.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611553491.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">나만의 힐링타임</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 본문 게시글 끝 -->
    
                <!-- 여기서 부터 슬라이더 전체 영역 -->
                <div class="main_type1">
                <!-- type1:  -->
                <div class="product_list">
                    <!-- 상품 추천 -->
                        <div class="tit_goods">
                            <h3 class="tit">
                                <span class="name">
                                베스트 TOP 5!
                                </span>
                                <!-- 아이콘 없는 버전, h3에 링크 없음 -->
                            </h3>
                        </div>

                        <!-- 탑 슬라이터 구역 -->
                                <ul id="slideUlTag" class="autoplay">
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품1.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품2.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품3.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품4.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="slideLinkTag" href="../path.html">
                                            <img class="discountImg" src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png">
                                            <img src="/mmo/resources/img/상품5.jpg" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
                                                <span class="name">
                                                    <h3 class="slideTitle-text">[똠양꿍] 기똥찬 타이 카레</h3>
                                                 </span>
                                                <span class="slidePrice">10,800원</span>
                                                <span class="slideCost">12,000원</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                        <!-- 탑 슬라이더 구역 -->
                        
                    </div>
                </div>
                <!-- 여기까지 슬라이더 전체 영역 -->
    
                <!-- 본문 게시글 시작 -->
                <div class="main_type2 bg">
                    <div class="main_event">
                        <div class="tit_goods">
                            <h3 class="tit">
                            <!-- 아이콘 있는 버전, h3에 링크 있음 -->
                                <a href="#" class="name">
                                    <span class="ico">이벤트 소식</span>
                                </a>
                            </h3>
                        </div>
                        <div class="list_goods">
                            <ul data-title="이벤트 소식" data-section="event" class="list_goods_ul">
                                <li>
                                    <li data-index="1">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일1.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611247553.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">망고는 매잉고</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">미리미리 쟁여두세요!</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="2">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일2.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611317260.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">귤은 뀰!</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">한라봉 아님</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="3">
                                        <a class="thumb_goods">
                                            <img src="/mmo/resources/img/과일3.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611553491.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">나만의 힐링타임</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 본문 게시글 끝 -->
                
                <div style="height: 40px; background-color: rgba(254, 116, 119, 0.241); line-height: 40px;">
                    <div style="display: flex; justify-content: center;">
                        <h3>공지사항 : </h3>
                        <p>배가 고파요..</p>
                    </div>
                </div>
            </div>
            
        </div>
        
	 		<%@ include file="../common/footer.jsp" %>
       </div>


    <script>
        $(document).ready(function() {
            $('.autoplay').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                draggable: true,
                arrows: true,
                slide: 'li'
            })
        });
       
      $.noConflict();

    </script>
</body>
</html>