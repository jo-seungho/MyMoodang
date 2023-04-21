<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.user.shop.item.model.vo.*, com.kh.user.shop.review.model.vo.Review
    , com.kh.user.member.model.vo.Member"
%>

<%
    Item i = (Item)request.getAttribute("i");
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
    ArrayList<Attachment> clist = (ArrayList<Attachment>)request.getAttribute("clist");
    ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
    
    Review re = (Review)request.getAttribute("re");
    
    
/*     System.out.println("re : " + re); */
    
%>





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/shop/item_detail.css">
    <link rel="stylesheet" href="/resources/css/board/item_review_common.css">
    <link rel="stylesheet" href="/resources/css/board/item_review_reset.css">
    <link rel="stylesheet" href="/resources/css/board/item_review.css">
    <link rel="stylesheet" href="/resources/css/board/mymoodang_order_list.css">
    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/common/footer.css" />
    <link rel="stylesheet" href="/resources/css/member/edit_my_info_pw_check.css" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script defer src="/resources/js/common/header.js"></script>

    <script src="/resources/js/shop/item_detail.js"></script>
    <script src="/resources/js/board/item_review_common.js"></script>
    <script src="/resources/js/board/item_review_my.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="/resources/js/common/header.js"></script>

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
		  
          /* 모달 창 스타일 */
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.6);
		}
		
		.modal-content {
		  background-color: white;
		  margin: 10% auto;
		  padding: 100px;
		  border: 1px solid #888;
		  width: 50%;
		  max-width: 600px;
		  position: relative;
		  border-radius: 8px;
		}
		
		/* 닫기 버튼 스타일 */
		.close {
		  position: absolute;
		  top: 5px;
		  right: 10px;
		  font-size: 30px;
		  font-weight: bold;
		  cursor: pointer;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		/* 입력 필드 스타일 */
		input[type="text"],
		textarea {
		  width: 100%;
		  box-sizing: border-box;
		  border: none;
		  border-bottom: 2px solid #ccc;
		  resize: vertical;
		  font-size: 13px; /* placeholder 폰트 크기 조정 */
		}
		
		/* 저장 버튼 스타일 */
		.save-btn {
		  background-color: lightgray;
		  color: white;
		  padding: 12px 20px;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  float: right;
		  margin-top: 5px;
		}
		
		.save-btn:hover {
		  background-color: red;
		}
		
		input[type="text"],
		textarea {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  box-sizing: border-box;
		  border: none;
		  border-bottom: 2px solid #ccc;
		  resize: vertical;
		}
		
		/* 제목과 내용 사이 간격 늘리기 */
		h2 + input[type="text"],
		h2 + textarea {
		  margin-top: 16px;
		}
		
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0,0,0,0.4);
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: 15% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 100%;
		}
		
		.modal-header h2 {
		  margin-top: 0;
		}
		
		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.content {
		width: 10%;
		}
		
		
		form {
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		}
		
		 label {
	    font-weight: bold;
	    margin-right: 10px;
	    width: 100px;
	  }
		
	  input[type="text"],
	  textarea {
	    padding: 10px;
	    font-size: 16px;
	    border: none;
	    border-radius: 5px;
	    box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.1);
	    margin-bottom: 20px;
	    width: 400px;
	  }
				
	  textarea {
	    resize: none;
	    height: 250px;
	  }

		select {
		  padding: 10px;
		  font-size: 16px;
		  border: none;
		  border-radius: 5px;
		  box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.1);
		  margin-bottom: 20px;
		}
		
		button[type="submit"] {
		  padding: 10px;
		  background-color: #4CAF50;
		  color: white;
		  border: none;
		  border-radius: 5px;
		  font-size: 16px;
		  cursor: pointer;
		}
		
		button[type="submit"]:hover {
		  background-color: #3e8e41;
		}
		</style>
		
        
  </head>
  <body>
    <!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->

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
								<%--         <% if(loginUser != null) { %> --%>
								            <tr>
										      <th colspan="1">
										        <button id="review-register-btn" class="reviewbtn" style="text-align: center; font-size: large;">리뷰 등록</button>
										      </th>
										    </tr>
										 <%--    <% } %> --%>
										    <br><br>
									
								          <tr>
								            <th onclick="sortTable(0)" width="100px">번호</th>
								            <th onclick="sortTable(1)" width="135px">작성일</th>
								            <th onclick="sortTable(2)" width="120px">별점</th>
								            <th onclick="sortTable(3)">제목</th>
								            <th onclick="sortTable(4)"width="100px">작성자</th>

								          </tr>
								        </thead>
								        <tbody>
								                                              
									<% if(rlist.isEmpty()) { %>
											<tr>
											<td colspan="5">조회된 1:1 문의 리스트가 없습니다.</td>
											</tr>
									<% } else { %>
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
	        								  <button><a href = "/itemReviewDel.it?rno=<%= r.getReviewNo() %>&bno=<%= i.getItemCode() %>" type="button" class=delete>삭제</a></button> 
	        								  <button type="button" class="update-btn">수정</button>
									        </td>
									      </tr>
									    <%} %>
								    
								   <%} %>
								    
								  </tbody>
								      </table>
								      
								  <!-- 모달 창 -->
							
							
									<!--  리뷰 수정용 폼 -->
                                <div id="update-modal" class="modal">
                                    <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <h2 align="center">리뷰 수정</h2>
                                    <br><br><br>
                                    <h2>제목 수정</h2>
                                    <input type="text" id="update-title" >
                                    <h2>내용 수정</h2>
                                    <textarea  id="update-content" ></textarea>
                                    <button type="button" class="save-btn">저장</button>
                                    </div>
                                </div>
                                
                                
                                <div id="review-modal" class="modal">
								  <div class="modal-content">
								    <div class="modal-header">
								      <span class="close"></span>
								      <h2 align="center">리뷰 등록</h2>
								      <br>
								    </div>
								    <div class="modal-body">
								    
								    
								      <!-- 리뷰 등록 폼 -->
							<form action="/itemReviewIn.it" method="post">
							  <div>
							    <label for="title">제목:</label>
							    <input type="text" id="title" name="title">
							  </div>
							  
							  <div>
							    <label for="contentinsert">내용:</label>
							    <textarea id="contentinsert" name="contentinsert"></textarea>
							  </div>
							  
							  <div>
							    <label for="starpoint">별점:</label>
							    <select id="starpoint" name="starpoint">
							      <option value="1">1</option>
							      <option value="2">2</option>
							      <option value="3">3</option>
							      <option value="4">4</option>
							      <option value="5">5</option>
							    </select>
							  </div>
				<%-- 		  <input type="hidden" name="rno" id="rno" value="<%= re.getReviewNo() %>"> --%>
						  
							  <input type="hidden" name="bno" id="bno" value="<%= i.getItemCode() %>">   
							  <div id="modal">
							    <button type="submit" id="close-btn">등록</button>
							  </div>
							</form>                       
                                
                                    
												

					
                                    </div>
                                </div>
                            </div>
                        </div>
    
                    <script>
     
                  	  //-----------------------토글 js----------------------------------
                        function toggleContent(reviewNo) {
                    	    var contentRow = document.getElementById("content" + reviewNo);
                    	    if (contentRow.style.display === "none") {
                    	      contentRow.style.display = "table-row";
                    	    } else {
                    	      contentRow.style.display = "none";
                    	    }
                    	  }
                      //-----------------------별 js----------------------------------
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
                            stars += "&#9733;"; 
                          } else {
                            stars += "&#9734;"; 
                          }
                        }
                        return stars;
                      }
                    
                      //-----------------------별 js----------------------------------
                      
                      
                      
             
                      let postRows = document.querySelectorAll(".post");
                    
          
                      postRows.forEach(function(row) {
                        let rating = parseInt(row.querySelector("td:nth-child(3)").innerText);
                        let stars = displayStars(rating);
                        row.querySelector("td:nth-child(3)").innerHTML = stars;
                      });
                      
                     
                      

                      // 모달창 열기
                    var updateBtn = document.querySelector(".update-btn");
                    var modal = document.getElementById("update-modal");
                    var closeBtn = document.querySelector(".close");


     

                    // 모달창 닫기
                    closeBtn.addEventListener("click", function() {
                    modal.style.display = "none";
                    });

                    // 수정 내용 저장
                    var saveBtn = document.querySelector(".save-btn");
                    var updateTitle = document.getElementById("update-title");
                    var updateContent = document.getElementById("update-content");

                    document.getElementById("review-register-btn").addEventListener("click", function() {
                   	  var modal = document.getElementById("review-modal");
                   	  modal.style.display = "block";
                   	});

                   	// 모달 창 외부를 클릭하면 모달 창을 닫음
                   	window.onclick = function(event) {
                   	  var modalInsert = document.getElementById("review-modal");
                   	  if (event.target == modalInsert) {
                   		modalInsert.style.display = "none";
                   	  }
                   	}
                   	
                   	
					       
                    		
                    </script>
                    
                    


      <%@ include file="../common/footer.jsp" %>
   

  </body>
</html>