<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.admin.board.inquiry.model.vo.Inquiry, com.kh.common.model.vo.PageInfo" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");

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
  </style>

  <body class="sb-nav-fixed">
  
  	<%@ include file="sidebar.jsp" %>

      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>1대1 문의 관리</h2>
            <hr />
            <!-- 
            <div style="height: 60px"><button type="button" id="btn" class="btn">글쓰기</button></div> -->

            <div>
              <button type="button" id="btn" class="btn">글쓰기</button>
              <form role="search">
                <button type="submit" id="btn" class="btn">검색하기</button>
                <input type="search" class="form-control" placeholder="" aria-label="Search" style="width: 30%; float: right" />
              </form>
            </div>
            <table class="table table-hover center">
              <thead>
                <tr>
                  <th>문의번호</th>
                  <th>문의유형</th>
                  <th>회원아이디</th>
                  <th>문의제목</th>
                  <th>문의날짜</th>
                </tr>
              </thead>
              <tbody>
              <%for(Inquiry in : list){ %>
                <tr>
                  <td><%=in.getInqNo() %></td>
                  <td><%=in.getInquiryType() %></td>
                  <td><%=in.getMemberId() %></td>
                  <td><%=in.getTitle() %></td>
                  <td><%=in.getDateCreate() %></td>
                </tr>
                <%} %>
              </tbody>
            </table>
            <br />
			<div align="center" class="paging-area">
	
				<% if(currentPage != 1) { %>
					<button onclick="location.href = '/noticelist.ad?currentPage=<%= currentPage - 1 %>';">
						&lt;
					</button>
				<% } %>
			
				<% for(int p = startPage; p <= endPage; p++) { %>
					<% if(p != currentPage) { %>
						<button onclick="location.href = '/noticelist.ad?currentPage=<%= p %>';">
							<%= p %>
						</button>
					<% } else { %>
						<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
						<button disabled><%= p %></button>
					<% } %>
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button onclick="location.href = '/noticelist.ad?currentPage=<%= currentPage + 1 %>';">
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
