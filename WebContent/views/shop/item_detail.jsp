<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.user.shop.item.model.vo.*, com.kh.user.shop.review.model.vo.Review"
    %>

<%
    Item i = (Item)request.getAttribute("i");
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
    ArrayList<Attachment> clist = (ArrayList<Attachment>)request.getAttribute("clist");
    ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
    String category = i.getItemCategory();
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
    <link rel="stylesheet" href="/resources/css/shop/item_detail.css">
    <link rel="stylesheet" href="/resources/css/board/item_review_common.css">
    <link rel="stylesheet" href="/resources/css/board/item_review_reset.css">
    <link rel="stylesheet" href="/resources/css/board/item_review.css">
    <link rel="stylesheet" href="/resources/css/board/mymoodang_order_list.css">
    <link rel="stylesheet" href="/resources/css/member/edit_my_info_pw_check.css" />

    <script src="/resources/js/shop/item_detail.js"></script>
    <script src="/resources/js/board/item_review_common.js"></script>
    <script src="/resources/js/board/item_review_my.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <title>상품상세페이지</title>
      <style>
            /* 테이블 스타일 */
            table {
              width: 45%;
              border-collapse: collapse;
              font-size: 16px;
              margin: auto;

            }
            th, td {
              padding: 12px;
              text-align: left;
              border-bottom: 1px solid #ddd;
              text-align: center;
            }
            th {
              background-color: #f8f8f8;
              color: #333;
              font-weight: bold;
              cursor: pointer;

            }
            tr:hover {
              background-color: #f9f9f9;
            }

            /* 게시물 내용 토글 스타일 */
            .content {
              display: none;
            }
            .content td {
              background-color: #f9f9f9;
              padding: 20px;
            }

            /* 게시물 제목 클릭 시 커서 스타일 변경 */
            .post td[onclick]:hover {
              color: #007bff;
              text-decoration: underline;
              cursor: pointer;
            }

            table tbody tr td:nth-child(3){
                color: red;
		            }
		            .content {
		    background-color: #f5f5f5;
		    border-bottom: 1px solid #ddd;
		  }
		  .content p {
		    margin: 10px;
		  }
		  .content button {
		    float: right;
		    margin: 5px;
		    padding: 5px;
		    background-color: lightgray;
		    color: black;
		    border: none;
		    cursor: pointer;
		    font-size : 15px;
		  }
		  .content button:hover {
		    background-color: red;
		  }
          </style>
  </head>
  <body>

      <%@ include file="../common/header.jsp" %>

            <!-- 상품 상세페이지 시작-->

                    <div id="main">
                        <div id="content" style="opacity: 1;">
                            <div class="section_view">
                                <div id="sectionView">
                                    <div class="inner_view">
                                        <div class="thumb" style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png);">
                                            <img src="<%= i.getItemImg() %>" alt="상품 대표 이미지" class="bg">

                                        </div>
                                        <p class="goods_name">
                                            <span class="btn_share">
                                                <button id="btnShare">공유하기</button>
                                            </span>
                                            <strong class="name"><%= i.getItemName() %></strong>
                                        </p>
                                        <p class="goods_price">
                                            <span class="position">
                                                <span class="dc">
                                                    <span>
                                                        <span class="discount" style="font-size: 22px; font-weight: 400; color: red;">30<!--<%= i.getItemDiscount() %>-->%&nbsp</span>

                                                    </span>
                                                    <span class="dc_price" style="font-size: 15px; font-weight: 400; color: red;">
                                                        <del style="font-size: 18px; font-weight: 400; color: lightgray;"><%= i.getDiscountPrice() %>원 </del>
                                                        <input type="hidden" value="<%= i.getDiscountPrice() %>">

                                                    </span>
                                                    <span class="won" style="font-size: 22px; margin-top: 10%;">&nbsp<b><%= i.getDiscountPrice() %>원</b></span>
                                                </span>

                                            </span>
                                            <span>
                                                <span class="txt_benefit">
                                                    <span class="ico_grade grade6">웰컴 5%</span>
                                                    <span class="point">
                                                        개당
                                                        <strong class="emphh">65원 적립(여긴 건들지마세요 제가 계산식 js에 넣어뒀어요)</strong>
                                                    </span>
                                                </span>
                                            </span>
                                        </p>
                                        <div class="goods_info">
                                            <dl class="list fst">
                                                <dt class="tit">정상가</dt>
                                                <dd class="desc"><%= i.getItemPrice() %></dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">할인가 </dt>
                                                <dd class="desc"><%= i.getDiscountPrice() %></dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">할인율</dt>
                                                <dd class="desc"><%= i.getItemDiscount() %>%</dd>
                                            </dl>
                                            <dl class="list">
                                                <dt class="tit">카테고리</dt>
                                                <dd class="desc"><%= i.getItemCategory() %></dd>
                                            </dl>


                                        </div>
                                    </div>
                                </div>

                                <div id="cartPut">
                                    <div class="cart_option cart_type2">
                                        <form action="">
                                            <div class="inner_option">
                                                <div class="in_option">
                                                    <div class="list_goods">
                                                        <ul class="list list_nopackage">
                                                            <li class="on">
                                                                <span class="tit_item">구매수량</span>
                                                                <div class="option">
                                                                    <span class="count">
                                                                        <button type="button" class="btn down on">수량내리기</button>
                                                                        <input type="number" readonly="readonly" value = 1 class="inp">
                                                                        <button  type="button" class="btn up on">수량올리기</button>
                                                                    </span>

                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="total">
                                                        <div class="price">
                                                            <strong class="tit">총 상품금액 : </strong>
                                                            <span class="sum">
                                                                <span class="num"><%= i.getDiscountPrice() %></span>
                                                                <span class="won"></span>
                                                            </span>
                                                        </div>
                                                        <p class="txt_point">
                                                            <span class="ico">적립</span>
                                                            <span class="point">
                                                                구매 시
                                                                <strong class="emph">65원 적립</strong>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="group_btn off">
                                                    <div class="view_function">
                                                        <button type="button" class="btn btn_save">찜 하기</button>
                                                    </div>
                                                    <span class="btn_type1">
                                                        <button type="submit" class="txt_type">장바구니 담기</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="layout-wrapper goods-view-area">
                                <div class="goods-add-product">
                                    <h3 class="goods-add-product-title">
                                        RELATED PRODUCT
                                    </h3>
                                    <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                                        <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">
                                            왼쪽으로 슬라이드 이동
                                        </button>
                                        <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">
                                            오른쪽으로 슬라이드 이동
                                        </button>
                                        <div class="goods-add-product-list-wrapper" style="height:320px;">
                                            <ul class="goods-add-product-list __slide-mover" style="left: 0px;">




                                            	<%  for(Attachment a : clist) { %>
                                                <li class="goods-add-product-item __slide-item">
                                                    <div class="goods-add-product-item-figure">
                                                        <a href="#" target="_blank">
                                                            <img src="<%= a.getItemImgPath() %>" class="goods-add-product-item-image">
                                                        </a>
                                                    </div>
                                                    <div class="goods-add-product-item-content">
                                                        <div class="goods-add-product-item-content-wrapper">
                                                            <p class="goods-add-product-item-name" style="font-size: 18px;" align="center"><%= a.getItemName() %></p>
                                                            <div class="category_item" align="center" style="font-size: 21px;">
                                                            <span class="goods-add-product-item-price2"><del style="font-size: 22px; font-weight: 400; color: red;"><%= a.getItemPrice() %>원</del>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                            <span class="goods-add-product-item-discountprice2"><%= a.getDiscountPrice() %>원</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <% } %>


                                            </ul>
                                        </div>
                                    </div>
                                </div>
                              </div>

                                <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation" >
                                    <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                                고객리뷰
                                                <span class="count_review">(0)</span>
                                            </a>
                                        </li>
                                        <li class="goods-view-infomation-tab qna-show">
                                            <a href="#goods-qna" class="goods-view-infomation-tab-anchor">
                                                1 : 1 문의
                                                <span>(0)</span>

                                            </a>
                                        </li>
                                    </ul>
                                    <div class="goods-view-infomation-content __active" id="goods-description">
                                        <div class="goods_wrap">
                                            <div class="goods_intro">
                                                <div class="pic">
                                                    <img src="<%= i.getItemImg() %>" style="width:1010px; height:671px;">
                                                </div>
                                                <div class="context last">
                                                    <h3>
                                                        <small>
                                                            <%= i.getItemName() %>
                                                        </small>
                                                        <%= i.getItemText() %>
                                                    </h3>
                                                    <p class="words">
                                                        <img src="<%= i.getItemImg() %>" style="width:1010px; height:671px;">
                                                    </p>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                                고객리뷰
                                                <span class="count_review">(0)</span>
                                            </a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-qna" class="goods-view-infomation-tab-anchor">1 : 1 문의
                                                <span>(0)</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="goods-view-infomation-content" id="goods-image">
                                        <div id="goods_pi">
                                            <p class="pic">
                                                <img src="">
                                            </p>
                                        </div>
                                    </div>


                                        <div class="happy_center fst">
                                            <ul class="goods-view-infomation-tab-group" style="display: flex; align-content: stretch; justify-content: center; ">
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a>
                                        </li>

                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                                                고객리뷰
                                                <span class="count_review">(0)</span>
                                            </a>
                                        </li>
                                        <li class="goods-view-infomation-tab">
                                            <a href="#goods-qna" class="goods-view-infomation-tab-anchor">1 : 1 문의
                                                <span>(0)</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="goods-view-infomation-content" id="goods-review">
                                   		<br>
									<table>
								        <thead>
								          <tr>
								            <th onclick="sortTable(0)" width="100px">번호</th>
								            <th onclick="sortTable(1)" width="135px">작성일</th>
								            <th onclick="sortTable(2)" width="120px">별점</th>
								            <th onclick="sortTable(3)">제목</th>
								            <th onclick="sortTable(4)"width="100px">작성자</th>
								          </tr>
								        </thead>
								        <tbody>
								    <% for(Review r : rlist){ %>
								      <tr class="post">
								        <td><%= r.getReviewNo()%></td>
								        <td><%= r.getWriteDate()%></td>
								        <td><%= r.getStarPoint()%></td>
								        <td onclick="toggleContent(<%= r.getReviewNo()%>)" style="cursor: pointer;"><%= r.getTitle()%></td>
								        <td>유저1</td>
								      </tr>
								      <tr class="content" id="content<%= r.getReviewNo()%>" style="display:none;">
								        <td colspan="6">
								          <p><%= r.getContent()%></p>
								          <a href = "/itemReviewDel.it?bno=<%= r.getReviewNo() %>" type="button" >수정</a> &nbsp
        								  <a href = "/itemReviewDel.it?bno=<%= r.getReviewNo() %>" type="button" >삭제</a>

								        </td>
								      </tr>
								    <%} %>
								  </tbody>
								      </table>




                                    </div>

                                </div>
                            </div>
                        </div>

                    <script>
                   <%--      $(function() {
                            selectReviewList();
                        });

                        // 리뷰 조회 요청용 ajax
                        function selectReviewList() {
                            $.ajax({
                                url: "itemReviewList.it",
                                type: "get",
                                data: { bno: <%= i.getItemCode() %> },

                                success: function(result) {

                                	//console.log(result);

                                	let sum = "";


                                     for(let i in result) {

                                        sum += "<tr>"
                                            + "<td>" + result[i].title + "</td>"
                                            + "<td>" + result[i].content + "</td>"
                                            + "<td>" + result[i].writeDate + "</td>"
                                            + "<td>" + result[i].starPoint + "</td>"
                                            + "</tr>";

                                        $("#goods-review tbody").html(result);
                                    }

                                },
                                error: function() {
                                    alert("리뷰 조회 실패");
                                }
                            });
                        } --%>

                        function toggleContent(reviewNo) {
                    	    var contentRow = document.getElementById("content" + reviewNo);
                    	    if (contentRow.style.display === "none") {
                    	      contentRow.style.display = "table-row";
                    	    } else {
                    	      contentRow.style.display = "none";
                    	    }
                    	  }

                      function sortTable(columnIndex) {
                        var table, rows, switching, i, x, y, shouldSwitch;
                        table = document.getElementsByTagName("table")[0];
                        switching = true;
                        while (switching) {
                          switching = false;
                          rows = table.getElementsByTagName("tr");
                          for (i = 1; i < (rows.length - 1); i++) {
                            shouldSwitch = false;
                            x = rows[i].getElementsByTagName("td")[columnIndex];
                            y = rows[i + 1].getElementsByTagName("td")[columnIndex];
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                              shouldSwitch = true;
                              break;
                            }
                          }
                          if (shouldSwitch) {
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                          }
                        }
                      }

                      function displayStars(rating) {
                        let stars = "";
                        for (let i = 1; i <= 5; i++) {
                          if (i <= rating) {
                            stars += "&#9733;"; // Full star
                          } else {
                            stars += "&#9734;"; // Empty star
                          }
                        }
                        return stars;
                      }

                      // Get all the rows with class "post"
                      let postRows = document.querySelectorAll(".post");

                      // Loop through each post row and update the "별점" column with stars
                      postRows.forEach(function(row) {
                        let rating = parseInt(row.querySelector("td:nth-child(3)").innerText);
                        let stars = displayStars(rating);
                        row.querySelector("td:nth-child(3)").innerHTML = stars;
                      });
                    </script>

      <%@ include file="../common/footer.jsp" %>

  </body>
</html>