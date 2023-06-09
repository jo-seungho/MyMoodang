<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.user.shop.item.model.vo.Item"%>
<%-- 2023-04-18 조승호 --%>
<%

	ArrayList<Item> discountList = (ArrayList<Item>) request.getAttribute("discountList");
	ArrayList<Item> newList = (ArrayList<Item>) request.getAttribute("newList");
	ArrayList<Item> bestList = (ArrayList<Item>) request.getAttribute("bestList");
	int ranking = 1;
	String category = (String)request.getAttribute("category");

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

  <title>MyMoodang</title>

  <link rel="stylesheet" href="/resources/css/common/mainContent.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/bbeda4c5cf.js" crossorigin="anonymous"></script>

  <script src="/resources/js/common/mainPage.js"></script>

</head>
<body>
<body>


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

 									<% if(discountList.isEmpty()) { %>
 										<div class="item">등록된 상품이 없습니다.</div>
 									<% } else { %>

 										<% for(Item di : discountList) { %>
 									<li>
                                        <a class="slideLinkTag" href="/itemDetail.it?bno=<%=di.getItemCode()%>">
                                            
                                            <img src="<%= di.getItemImg() %>" style="width: 90%; height: 310px;">
                                              <div class="slideText-area">
	                                                <span class="name">
                                                    <h3 class="slideTitle-text" style="font-weight: 800"><%= di.getItemName() %></h3>
                                                    <h4 class="slideTitle-text" style="font-size : 15px;"><%= di.getItemText() %></h4>
	                                                 </span>
	                                                 <p><span style="color : red; font-weight : bold; font-size : 18px;"><%= (int)(di.getItemDiscount()*100) %>%&nbsp;</span>
	                                                <span class="slidePrice"><%= di.getDiscountPrice() %>원</span>
	                                               </p>
	                                                <span class="slideCost" style="font-size : 18px; margin-top : 10px;"><%= di.getItemPrice() %>원</span>
	                                            </div>
                                        </a>
                                    </li>
 										<% } %>

 									<% } %>

                                </ul>
                        <!-- 탑 슬라이더 구역 -->
                    </div>
                </div>
                <!-- 여기까지 슬라이더 전체 영역 -->

				<%-- 탑 배너 --%>
                <!-- 본문 게시글 시작 -->
                <div class="main_type2 bg">
                    <div class="main_event">
                        <div class="tit_goods">
                            <h3 class="tit">
                            <!-- 아이콘 있는 버전, h3에 링크 있음 -->
                                <a href="/newItemList.it?currentPage=1" class="name">
                                    <span class="ico">따끈 따끈 신상품</span>

                                </a>
                            </h3>
                        </div>
                        <div class="list_goods">
                            <ul data-title="이벤트 소식" data-section="event" class="list_goods_ul">

                            	<% if(newList.isEmpty()) { %>
                            		<div class="item">등록된 상품이 없습니다.</div>
                            	<% } else {%>

                            		<% for(Item ni : newList) { %>
		                            	<li>
		                                    <li data-index="1" style="padding-bottom: 10px;">
		                                        <a class="thumb_goods" href="/itemDetail.it?bno=<%=ni.getItemCode()%>">
		                                            <img src="<%= ni.getItemImg() %>" alt="상품이미지" class="thumb"
		                                            style="background-image: url('');">
		                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
		                                        </a>
		                                        <div class="info_goods">
		                                            <div class="inner_info">
		                                                <span class="name">
		                                                    <a  href="/itemDetail.it?bno=<%=ni.getItemCode()%>" class="txt" style="font-size: x-large; font-weight: 700;"><%= ni.getItemName() %></a>
		                                                </span>
		                                                <span class="desc">
		                                                    <a href="/itemDetail.it?bno=<%=ni.getItemCode()%>" class="txt" style="font-size: initial;"><%= ni.getItemText() %></a>
		                                                </span>	
		                                                <br>
		                                                <p style="text-align : center;"><span style="color : red; font-weight : bold; font-size : 18px;"><%= (int)(ni.getItemDiscount()*100) %>%&nbsp;</span>
	                                                <span class="slidePrice"><%= ni.getDiscountPrice() %>원</span>
	                                               </p>
	                                               <p style="margin-left : 150px; margin-top : 7px">
	                                                <span class="slideCost" style="font-size : 18px"><%= ni.getItemPrice() %>원</span>
	                                                </p>
		                                                	
                                                		
		                                            </div>
		                                        </div>
		                                    </li>
                            		<% } %>

                            	<% } %>

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

                        <!-- 바텀 슬라이터 구역 -->
                                <ul id="slideUlTag" class="autoplay">
									<% if(bestList.isEmpty()) { %>
										<div class="item">등록된 상품이 없습니다.</div>
									<% } else { %>

										<% for(Item bi : bestList) { %>
										 <li>
										 <h1><i style="color: red; text-shadow: 2px -7px 8px orange;">TOP </i><%= ranking %></h1>
	                                        <a class="slideLinkTag" href="/itemDetail.it?bno=<%=bi.getItemCode()%>">
	                                            <img src="<%= bi.getItemImg() %>" style="width: 90%; height: 310px;">
	                                              <div class="slideText-area">
	                                                <span class="name">
                                                    <h3 class="slideTitle-text" style="font-weight: 800"><%= bi.getItemName() %></h3>
                                                    <h4 class="slideTitle-text" style="font-size : 15px;"><%= bi.getItemText() %></h4>
	                                                 </span>
	                                                 <p><span style="color : red; font-weight : bold; font-size : 18px;"><%= (int)(bi.getItemDiscount()*100) %>%&nbsp;</span>
	                                                <span class="slidePrice"><%= bi.getDiscountPrice() %>원</span>
	                                               </p>
	                                                <span class="slideCost" style="font-size : 18px; margin-top : 10px;"><%= bi.getItemPrice() %>원</span>
	                                            </div>
	                                        </a>
	                                    </li>
	                                    <% ranking++; %>
										<% } %>
									<% } %>
                                </ul>
                        <!-- 바텀 슬라이더 구역 -->

                    </div>
                </div>
                <!-- 여기까지 슬라이더 전체 영역 -->

                <!-- 본문 게시글 시작 -->

                <%--

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
                                            <img src="/resources/img/과일1.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('');">
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
                                            <img src="/resources/img/과일2.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('');">
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
                                            <img src="/resources/img/과일3.jpg" alt="상품이미지" class="thumb"
                                            style="background-image: url('');">
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
                --%>
                <!-- 본문 게시글 끝 -->

                <div style="height: 40px; background-color: rgba(254, 116, 119, 0.241); line-height: 40px; margin-top: 100px;">
                    <div style="display: flex; justify-content: center;">
                       <a href="/noticelist.no?currentPage=1">
                        
                        	<span style="font-weight : bold; font-size : 17px;">공지사항 :</span>&nbsp; 마이무당에 오신것을 환영합니다!
                        </a>
                    </div>
                    
                </div>
            </div>

        </div>

	 		<%@ include file="../common/footer.jsp" %>
       </div>


    <script>
        $(document).ready(function() {
        	console.log($("#s").text())
            $('.autoplay').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                draggable: true,
                prevArrow : "<button type='button' class='slick-prev'></button>",
                nextArrow : "<button type='button' class='slick-next'></button>",
                slide: 'li'
            })

        });

    </script>
</body>
</html>