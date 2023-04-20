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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
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

    /* 고유한 */
  </style>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="index.html">
        <div><i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY MOODANG</b></div>
      </a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group"></div>
      </form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#!">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark --bs-blue" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <div class="text-center">
                <img src="/resources/img/logo.png" class="rounded logo" alt="로고" />
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <a class="nav-link" href="main.html">
                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                메인 / 통계
              </a>
              <a class="nav-link" href="item.html">
                <div class="sb-nav-link-icon"><i class="fa fa-fw fa-gift"></i></div>
                상품 관리
              </a>
              <a class="nav-link" href="order.html">
                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                주문 관리
              </a>
              <a class="nav-link" href="member.html">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                회원 관리
              </a>
              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                게시판 관리
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
              </a>
              <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="/noticelist.ad?currentPage=1">공지사항 관리</a>
                  <a class="nav-link" href="inquiry.html">1:1 문의 관리</a>
                  <a class="nav-link" href="review.html">리뷰 관리</a>
                </nav>
              </div>
            </div>
          </div>
          <!-- <div class="sb-sidenav-footer"></div> sidenav의 footer-->
        </nav>
      </div>

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
