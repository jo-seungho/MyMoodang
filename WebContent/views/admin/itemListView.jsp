<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.admin.shop.item.model.vo.Item, java.util.ArrayList, com.kh.admin.common.model.vo.AdminPageInfo"%> 
<% 
	AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi"); 
	ArrayList<Item>list = (ArrayList<Item>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage(); 
	int startPage = pi.getStartPage(); 
	int endPage = pi.getEndPage(); 
	int maxPage = pi.getMaxPage();
	String category = request.getParameter("category");
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
        <link rel="stylesheet" href="/resources/css/shop/item_management.css" />
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
                      <a class="nav-link" href="notice.html">공지사항 관리</a>
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
                <div class="item_state" align="left">
                  <li class="item_list_manage"><h2>상품 리스트 관리</h2></li>
                </div>
                <hr />
                <div class="row">
                  <div class="col btn-hover">
                    <button class="btn" id="btn1">전체 <span class="list-btn"><%= pi.getTotalCount() %></span></button>
                    <button class="btn" id="btn2">판매 <span class="list-btn"><%= pi.getSaleCount() %></span></button>
                    <button class="btn" id="btn3">품절 <span class="list-btn"><%= pi.getSoldCount() %></span></button>
                  </div>
                </div>

                <div>
                  <a class="item_registration" href="/itemForm.ad">
                    <button type="button" id="btn" class="btn">상품추가</button>
                  </a>
                  <form role="search">
                    <button type="submit" id="btn" class="btn">검색하기</button>
                    <input type="search" class="form-control" placeholder="" aria-label="Search" style="width: 30%; float: right" />
                  </form>
                </div>

                <table class="item_manage_list">
                  <thead>
                    <tr>
                      <th>NO</th>
                      <th>등록일</th>
                      <th>이미지</th>
                      <th>상품명</th>
                      <th>재고</th>
                      <th>판매가격</th>
                      <th>상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if (list.isEmpty()) { %>
                    <tr>
                      <td colspan="7">게시글이 없습니다.</td>
                    </tr>

                    <% } else { %> <% for (Item i : list) { %>
                    <tr>
                      <td><%= i.getItemCode() %></td>
                      <td><%= i.getItemDate() %></td>
                      <% if (i.getItemImg() == null) { %>
                      <td><img src="/resources/img/noimage.png" style="width: 80px; height: 50px" /></td>
                      <% } else { %>
                      <td><img src="<%= i.getItemImg()%>" style="width: 80px; height: 50px" /></td>
                      <% } %>
                      <td><%= i.getItemName() %></td>
                      <td><%= i.getItemStock() %></td>
                      <td><%= i.getItemPrice() %></td>
                      <td><%= i.getItemStatus() %></td>
                    </tr>
                    <% } %> <% } %>
                  </tbody>
                </table>

                <%-- <div class="pagination" style="margin-top: 50px">
                  <% if(currentPage != 1) { %>
                  <a href="/itemList.ad?page=<%= startPage %>&category=<%=category%>">&lt;&lt;</a>
                  <a href="/itemList.ad?Page=<%= currentPage -1 %>&category=<%=category%>">&lt;</a>
                  <% } else { %>
                  <a href="" class="disabled">&lt;&lt;</a>
                  <a href="">&lt;</a>
                  <% } %> <% for(int p = startPage; p <= endPage; p++) { %> <% if(p == currentPage) { %>
                  <a class="active" href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  <% } else { %>
                  <a href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  <% } %> <% } %> <% if(currentPage != maxPage) { %>
                  <a href="/itemList.ad?page=<%= currentPage + 1 %>&category=<%=category%>">&gt;</a>
                  <a href="/itemList.ad?page=<%= maxPage %>&category=<%=category%>">&gt;&gt;</a>
                  <% } else { %>
                  <a href="#">&gt;</a>
                  <a href="#">&gt;&gt;</a>
                  <% } %>
                </div> --%>
                <ul class="pagination" style="margin-top: 50px">
                  <% if(currentPage != 1) { %>
                  <li class="page-item">
                  	<a href="/itemList.ad?page=<%= startPage %>&category=<%=category%>">&lt;&lt;</a>
                  </li>
                  <li class="page-item">
                  	<a href="/itemList.ad?Page=<%= currentPage -1 %>&category=<%=category%>">&lt;</a>
                  </li>
                  <% } else { %>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&lt;&lt;</a>
                  </li>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&lt;</a>
                  </li>
                  <% } %> <% for(int p = startPage; p <= endPage; p++) { %> <% if(p == currentPage) { %>
                  <li class="page-item active">
                  <a class="page-link" href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  </li>
                  <% } else { %>
                  <li class="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  </li>
                  <% } %> 
                  	<% } %> 
                  <% if(currentPage != maxPage) { %>
                  <li lass="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= currentPage + 1 %>&category=<%=category%>">&gt;</a>
                  </li>
                  <li lass="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= maxPage %>&category=<%=category%>">&gt;&gt;</a>
                  </li>
                  <% } else { %>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&gt;</a>
                  </li>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&gt;&gt;</a>
                  </li>
                  <% } %>
                </ul>

                <br /><br />
              </div>
            </main>
          </div>
        </div>

        <script>
          $(document).ready(function () {
        	  if ($('tbody tr td').eq(0).text() == '게시글이 없습니다.') {
                  $('tbody tr td').css('cursor', 'default');
                } else {
                	$('tbody tr').click(function () {
                        location.href = '/itemDetail.ad?code=' + $(this).children().eq(0).text();
                      });
                    }
                });
        	  
        	  

          $(document).ready(function () {
            if ('<%= category %>' == 'a') {
            	$('#btn1').addClass('underline');
            	$('#btn2').removeClass('underline');
                $('#btn3').removeClass('underline');
            } else if ('<%= category %>' == 'y') {
                $('#btn2').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn3').removeClass('underline');
            }
            else if ('<%= category %>' == 'n') {
                $('#btn3').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn2').removeClass('underline');
            }
            else $('#btn1').addClass('underline');

            // Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
            $('#btn1').click(function () {
              location.href = '/itemList.ad?page=1&category=a';
            });

            // Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
            $('#btn2').click(function () {
              location.href = '/itemList.ad?page=1&category=y';
            });

            // Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
            $('#btn3').click(function () {
              location.href = '/itemList.ad?page=1&category=n';
            });
          });
        </script>
      </body>
    </html>
>
