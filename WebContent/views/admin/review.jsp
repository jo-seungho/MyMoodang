<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.user.board.notice.model.vo.Notice, com.kh.common.model.vo.PageInfo"%>
<%
	// 필요한 데이터들 뽑기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

	// 자주 쓰일법한 변수들 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
  </style>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>


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
                  <th>주문번호</th>
                  <th>별점</th>
                  <th>리뷰제목</th>
                  <th>회원아이디</th>
                  <th>작성날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>202302340054</td>
                  <td>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                  </td>
                  <td>최고에요</td>
                  <td>hyuna95</td>
                  <td>2023-03-24 06:18:21</td>
                </tr>

                <tr>
                  <td>202302340053</td>
                  <td>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                  </td>
                  <td>님들 여기서 먹지마셈</td>
                  <td>user01</td>
                  <td>2023-03-23 06:18:22</td>
                </tr>
              </tbody>
            </table>
            <br />

			<div align="center" class="paging-area">
	
				<% if(currentPage != 1) { %>
					<button onclick="location.href = '/reviewList.ad?currentPage=<%= currentPage - 1 %>';">
						&lt;
					</button>
				<% } %>
			
				<% for(int p = startPage; p <= endPage; p++) { %>
					<% if(p != currentPage) { %>
						<button onclick="location.href = '/reviewList.ad?currentPage=<%= p %>';">
							<%= p %>
						</button>
					<% } else { %>
						<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
						<button disabled><%= p %></button>
					<% } %>
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button onclick="location.href = '/reviewList.ad?currentPage=<%= currentPage + 1 %>';">
						&gt;
					</button>
				<% } %>
	
			</div>
          </div>
          <br />
        </main>
      </div>

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
