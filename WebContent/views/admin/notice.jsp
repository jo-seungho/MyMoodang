<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.admin.board.notice.model.vo.Notice, com.kh.common.model.vo.PageInfo"%>
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

    <%@ include file="common2.jsp"%>
    <title>공지사항 관리</title>

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
    /* 고유한 */
  </style>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>
     <link rel="stylesheet" href="/resources/css/board/faq.css">
    <link rel="stylesheet" href="/resources/css/board/notice.css">

      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>공지사항 관리</h2>
            <hr />
            <!-- 
            <div style="height: 60px"><button type="button" id="btn" class="btn">글쓰기</button></div> -->

            <div>
              <button type="button" id="btn" class="btn" onclick="NoticeEnrollForm()">글쓰기</button>
              <form role="search">
                <button type="submit" id="btn" class="btn">검색하기</button>
                <input type="search" class="form-control" placeholder="" aria-label="Search" style="width: 30%; float: right" />
              </form>
            </div>
            <table class="table table-hover center">
              <thead>
                <tr>
                  <th colspan="0.1">글 번호</th>
                  <th colspan="1">제목</th>
                  <th colspan="1">작성일</th>
                </tr>
              </thead>
              <tbody>
              <%for(Notice n : list){ %>
                <tr>
                  <td><%=n.getNoticeNo() %></td>
                  <td><%=n.getNoticeTitle() %></td>
                  <td><%=n.getCreateDate() %></td>
                </tr>
                <%} %>
               
              </tbody>
            </table>
            <br />
			 		<div align="center" class="paging-area">
								 
		        <div class="layout-pagination">
		             <div class="pagediv">
							
						<a href="/noticelist.ad?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page" style="border : 1px solid lightgray;">이전 페이지로 가기</a>

							<span>
								<% for(int p = startPage; p <= endPage; p++) { %>
										
									<% if(p != currentPage) { %>
											
										<strong onclick="location.href = '/noticelist.ad?currentPage=<%= p %>';" class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
											<%= p %>
										</strong>
									<% } else { %>
								<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->
												
									<strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px; background-color: lightgray; "><%= p %></strong>
									<% } %>
								<% } %>
							</span>

                                <a href="/noticelist.ad?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page" style="border : 1px solid lightgray;">다음 페이지로 가기</a>
										
								</div>
							</div>
					
					</div>
          
          </div>
          <br />
        </main>
      </div>

    <!-- td 클릭시 notice_detail.html로 이동 -->
    <script>
      $(document).ready(function () {
        $("tbody tr").click(function () {
        	
        	let nno = $(this).children().eq(0).text();
          location.href = "/noticeForm.ad?nno="+nno;
        });
      });
      
      function NoticeEnrollForm(){
    	  location.href = "/noticeEnrollForm.ad?currentPage=1";
      }
    </script>
    <!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
   
  </body>
</html>