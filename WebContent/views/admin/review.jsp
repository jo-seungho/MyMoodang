<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.admin.shop.review.model.vo.Review, com.kh.common.model.vo.PageInfo"%>
<%
	// 필요한 데이터들 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

	// 자주 쓰일법한 변수들 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
	
	String checkedStar = "<span class=\"fa fa-star checked\"></span>";
    String uncheckedStar = "<span class=\"fa fa-star\"></span>";
    String stars = "";

%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<%@ include file="common2.jsp" %>
    <title>관리자 페이지</title>

  </head>

  <style>
    #btn {
      background-color: #fe7477;
      color: white;
      border: 1px solid white;
      float: right;
      margin-left: 10px;
      margin-bottom: 10px;
    }
    .checked {
      color: orange;
    }
    
    .pagediv strong:hover {
    	cursor : pointer;
    }
  </style>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>
   <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board/notice.css">


      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>상품 리뷰 관리</h2>
            <hr />
            
            <div>
            
              <form role="search">
                <button type="submit" id="btn" class="btn">검색하기</button>
                <input type="search" class="form-control" placeholder="" aria-label="Search" style="width: 30%; float: right" />
              </form>
            </div>
            <table class="table table-hover center">
              <thead>
                <tr>
                  <th>제품코드</th>
                  <th>별점</th>
                  <th>리뷰제목</th>
                  <th>회원아이디</th>
                  <th>작성날짜</th>
                </tr>
              </thead>
              <tbody>
              <% for(Review r : list) { %>
                <tr>
                  <td><%=r.getItemCode() %></td>
                  
                  
                    	<% for (int i = 1; i <= 5; i++) {%>
					        <%if (i <= r.getStarPoint()) {%>
					           <% stars += checkedStar; %>
					       <% } else { %>
					       		<% stars += uncheckedStar; %>
      						<% } %>
					   <% } %> 
					    <td><%=stars%></td>
					    
					    <% stars = ""; %>
					 
                  <td><%=r.getTitle() %></td>
                  <td><%=r.getMemberId() %></td>
                  <td><%=r.getWriteDate() %></td>
                </tr>
                <%} %>
              </tbody>
            </table>
            <br />

 <div align="center" class="paging-area">
								 
		                          <div class="layout-pagination">
		                            <div class="pagediv">
							
										
											<a href="/reviewList.ad?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page" style="border : 1px solid lightgray;">이전 페이지로 가기</a>

									
										<span>
										<% for(int p = startPage; p <= endPage; p++) { %>
										
											<% if(p != currentPage) { %>
											
												<strong onclick="location.href = '/reviewList.ad?currentPage=<%= p %>';" class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
													<%= p %>
												</strong>
											<% } else { %>
												<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
												
												<strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px; background-color: lightgray; "><%= p %></strong>
											<% } %>
										<% } %>
										</span>

                                			<a href="/reviewList.ad?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page" style="border : 1px solid lightgray;">다음 페이지로 가기</a>
										
										</div>
									</div>
					
							</div>
	</div>
          </div>
          <br />
        </main>
      </div>
      
        <script>
        $(document).ready(function () {
            $("tbody tr").click(function () {
            	
            	let rno = $(this).children().eq(0).text();
            	console.log(rno);
              location.href = "/reviewList.ad?rno="+rno;
            });
          });
        
		</script>

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
