<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String storedValue = "2";
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
<!--     <link href="/resources/css/admin/order.css" rel="stylesheet" />
    <script src="/resources/js/admin/order.js"></script> -->

  </head>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>
  
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="../main.html">
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
            <h2>회원 주문 관리</h2>
            <hr />
            <div class="row">
              <div class="col btn-hover">
                <button class="btn" id="btn1">전체 <span class="list-btn">17</span></button>
                <button class="btn" id="btn2">판매 <span class="list-btn">15</span></button>
                <button class="btn" id="btn3">품절 <span class="list-btn">2</span></button>
              </div>
            </div>
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
                  <th>주문번호</th>
                  <th>주문자 ID</th>
                  <th>결제금액</th>
                  <th>주문일자</th>
                  <th>배송주소</th>
                  <th>배송상태</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>2</td>
                  <td>hyuna95</td>
                  <td>35,000원</td>
                  <td>2023-03-24 06:18:21</td>
                  <td>서울 영등포구 당산로 1길</td>
                  <th>
                    <div class="btn-group">
                      <select class="form-select-sm" name="status">
                         <option value="0" <% if (storedValue.equals("0")) out.print("selected"); %>>배송대기중</option>
                          <option value="1" <% if (storedValue.equals("1")) out.print("selected"); %>>배송중</option>
                          <option value="2" <% if (storedValue.equals("2")) out.print("selected"); %>>배송완료</option>
                      </select>
                      <button class="btn btn-secondary btn-sm modi">수정</button>
                    </div>
                  </th>
                </tr>

                <tr>
                  <td>1</td>
                  <td>user02</td>
                  <td>42,000원</td>
                  <td>2023-03-23 06:18:21</td>
                  <td>서울 영등포구 당산로 2길</td>
                  <th>
                    <div class="btn-group">
                      <select class="form-select-sm" name="status">
                         <option value="0" <% if (storedValue.equals("0")) out.print("selected"); %>>배송대기중</option>
                          <option value="1" <% if (storedValue.equals("1")) out.print("selected"); %>>배송중</option>
                          <option value="2" <% if (storedValue.equals("2")) out.print("selected"); %>>배송완료</option>
                      </select>
                      <button class="btn btn-secondary btn-sm modi">수정</button>
                    </div>
                  </th>
                </tr>
              </tbody>
            </table>
            <br />

            <div class="pagination">
              <a href="#">&lt;</a>
              <a href="#">1</a>
              <a class="active" href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">&gt;</a>
            </div>
          </div>
          <br />
        </main>
      </div>
    </div>

   

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
