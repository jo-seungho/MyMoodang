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
  	<link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board/notice.css">
    <title>1:1 문의 관리</title>
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
     .pagediv strong:hover {
    	cursor : pointer;
    }
  </style>

  <body class="sb-nav-fixed">
  
  	<%@ include file="sidebar.jsp" %>

      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>1대1 문의 관리</h2>
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
                  <th>문의번호</th>
                  <th>문의유형</th>
                  <th>회원아이디</th>
                  <th>문의제목</th>
                  <th>문의날짜</th>
                  <th>답변여부</th>
                </tr>
              </thead>
              <tbody>
              <% for(Inquiry in : list) { %>
                <tr>
                  <td><%=in.getInqNo() %></td>
                  <td><%=in.getInquiryType() %></td>
                  <td><%=in.getMemberId() %></td>
                  <td><%=in.getTitle() %></td>
                  <td><%=in.getDateCreate() %></td>
                  <td><%=in.getReplyState() %></td>
                </tr>
                <% } %>
              </tbody>
            </table>
            <br />
			<div align="center" class="paging-area">
								 
		        <div class="layout-pagination">
		             <div class="pagediv">
							
						<a href="/inquiryList.ad?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page" style="border : 1px solid lightgray;">이전 페이지로 가기</a>

							<span>
								<% for(int p = startPage; p <= endPage; p++) { %>
										
									<% if(p != currentPage) { %>
											
										<strong onclick="location.href = '/inquiryList.ad?currentPage=<%= p %>';" class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
											<%= p %>
										</strong>
									<% } else { %>
								<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
												
									<strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px; background-color: lightgray; "><%= p %></strong>
									<% } %>
								<% } %>
							</span>

                                <a href="/inquiryList.ad?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page" style="border : 1px solid lightgray;">다음 페이지로 가기</a>
										
								</div>
							</div>
					
					</div>
           
          </div>
          <br />
        </main>
        
        <script>
        $(document).ready(function () {
            $("tbody tr").click(function () {
            	
            	let ino = $(this).children().eq(0).text();
              location.href = "/inquiryDetail.ad?ino="+ino;
            });
          });
		</script>
      </div>
  </body>
</html>
