<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>베스트 상품 게시판</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="/resources/css/shop/best_item_list.css" />
    <link rel="stylesheet" href="/resources/css/shop/itemList.css" />

    <script src="/resources/js/shop/best_item_list.js"></script>


    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
<!-- 카테고리 메뉴바 시작 -->
         <!-- 내용 컨텐츠 영역 시작-->
         <!-- 내용 컨텐츠 영역 시작-->
         <div id="Container-Wrapper">
            <div class="page_aticle">
         <div class="content">

            <!-- 카테고리 메뉴바 시작 -->
            <div id="lnbMenu" class="lnb_menu">
                <div class="inner_lnb">
                    <div class="ico_cate">
                        <span class="ico" style="display:block;">
                        <img src="/resources/img/logo.png" alt="카테고리 아이콘"> </span>
                        <span class="tit">전체보기</span>
                    </div>
    
                    <ul class="list">
                        <li name="cate_gory">
                            <a class="on">전체보기</a>
                        </li>
                        <li name="cate_gory">
                            <a class=>제로음료</a>
                        </li>
                        <li name="cate_gory">
                            <a class=>무가당</a>
                        </li>
                        <li name="cate_gory">
                            <a class=>단백질</a>
                        </li>
                        <li name="cate_gory">
                            <a class=>도시락</a>
                        </li>
                        <li name="cate_gory">
                            <a class=>기타</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 카테고리 메뉴바 끝 -->
    
    
    
            <!-- 배너 시작 -->
        <div class="banner_wrapper">   
            <div class="slider">
                <div class="imgs">
                    <img src="/resources/img/배너1.jpg" align="center">
                </div>
    
                <div class="imgs">
                    <img src="/resources/img/배너2.jpg" align="center">
                </div>
    
                <div class="imgs">
                <img src="/resources/img/배너3.jpg" align="center">        
                </div>
            </div>
        </div>    
    
        <!-- 배너 끝 -->
        <div id="goodsList" class="page_section section_goodslist">
        <div class="list_goods">
            <div class="inner_listgoods">
                <ul class="list">                                   <!-- 여기서 부터 물건 리스트-->
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a href="file:///C:/Users/Admin/Desktop/e-commerce-clone-main/good_view01.html" class="img" style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1567574126435l0.jpg);">
                                    <img src="/resources/img/과일1.jpg" alt="무농약 콩으로 재배한 콩나물(1봉/200g)" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" value="여기다가 프로덕트 아이디 적어주삼" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    매잉고
                                </span>
                                <span class="cost">
                                    <span class="price">1,300</span>
                                    <input type="hidden"  id="product_cost1" value= 1300 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">무농약 콩으로 재배한 매잉고(1봉/200g)</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img" style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1567574126435l0.jpg);">
                                    <img src="/resources/img/과일2.jpg" alt="믿고 먹을 수 있는 상품을 합리적인 가격에, KF365" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" value="3345" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    [KF365] 오우뤤지
                                </span>
                                <span class="cost">
                                    <span class="price">2,500</span>
                                    <input type="hidden"  id="product_cost2" value= 2500 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">사실은 귤</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a href="file:///C:/Users/Admin/Desktop/e-commerce-clone-main/good_view02.html" class="img">
                                    <img src="/resources/img/과일3.jpg" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    애쁠
                                </span>
                                <span class="cost">
                                    <span class="price">500</span>
                                    <input type="hidden"  id="product_cost2" value= 500 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a href="file:///C:/Users/Admin/Desktop/e-commerce-clone-main/good_view02.html" class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    츄파츕스
                                </span>
                                <span class="cost">
                                    <span class="price">200</span>
                                    <input type="hidden"  id="product_cost2" value= 200 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">맛있다</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    당근
                                </span>
                                <span class="cost">
                                    <span class="price">200</span>
                                    <input type="hidden"  id="product_cost2" value= 200 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    사과
                                </span>
                                <span class="cost">
                                    <span class="price">1,500</span>
                                    <input type="hidden"  id="product_cost2" value= 1500 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    딸기
                                </span>
                                <span class="cost">
                                    <span class="price">900</span>
                                    <input type="hidden"  id="product_cost2" value= 900 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt=")" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    유과
                                </span>
                                <span class="cost">
                                    <span class="price">300</span>
                                    <input type="hidden"  id="product_cost2" value= 300 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    배
                                </span>
                                <span class="cost">
                                    <span class="price">5,000</span>
                                    <input type="hidden"  id="product_cost2" value= 5000 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    수박
                                </span>
                                <span class="cost">
                                    <span class="price">10,000</span>
                                    <input type="hidden"  id="product_cost2" value= 10000 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                            
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    오이
                                </span>
                                <span class="cost">
                                    <span class="price">700</span>
                                    <input type="hidden"  id="product_cost2" value= 700 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    귤
                                </span>
                                <span class="cost">
                                    <span class="price">100</span>
                                    <input type="hidden"  id="product_cost2" value= 100 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
    
                    <li>
                        <div class="item">
                            <div class="thumb">
                                <a class="img">
                                    <img src="" alt="" onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'" width="308" height="396">
                                
                                
                                </a>
                                <span class="global_sticker" style="display: none;">
                                    <span class="inner_sticker">
                                        <span class="bg_sticker"></span>
                                        <span class="txt_sticker">
                                            <span class="emph_sticker">1+2
                                            </span>
                                            이벤트
                                        </span>
                                    </span>
                                </span>
    
                                <div class="group_btn">
                                    <button type="button" name="chk" class="btn btn_cart">
                                        <span class="screen_out">38300</span>
                                    </button>
                                </div>
                                
    
    
                            </div>
    
                            <a class="info">
                                <span class="name">
                                    콩
                                </span>
                                <span class="cost">
                                    <span class="price">30</span>
                                    <input type="hidden"  id="product_cost2" value= 30 >
                                    <span class="dodo">원</span>
                                </span>
    
                                <span class="desc">[한줄 소개]</span>
                                <span class="tag"></span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    
    
        </div>
    
    
    
    
    
                    
                    <div id="viewOrderList" class="page_section section_orderlist">
                                            
                        <div id="viewOrderList" class="page_section section_orderlist">
    
                            <!-- 주문내역 페이지 시작 -->
                            <div id="viewOrderList">
                                
                                
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
    
    


	<%@ include file="../common/footer.jsp" %>
	
	<script>
	$.noConflict();
	</script>

</body>
</html>