<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/shop/item_management.css">

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
                <button class="btn" id="btn1">전체 <span class="list-btn">17</span></button>
                <button class="btn" id="btn2">판매 <span class="list-btn">15</span></button>
                <button class="btn" id="btn3">품절 <span class="list-btn">2</span></button>
              </div>
            </div>

            <div>
              <a class="item_registration" href="/html/admin/item_manage_insert.html">
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
                <tr>
                  <td>10</td>
                  <td>2023-04-10 12:25:40</td>
                  <td><img src="/resources/img/logo.png" style="width: 40px" /></td>
                  <td>무당이 텀블러</td>
                  <td>100</td>
                  <td>100,000원</td>
                  <td>판매중</td>
                </tr>

                <tr>
                  <td>9</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>2023-04-10 12:25:40</td>
                  <td></td>
                  <td></td>
                  <td>100</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>2023-04-01 10:14:52</td>
                  <td></td>
                  <td></td>
                  <td>200</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>2023-03-31 09:14:42</td>
                  <td></td>
                  <td></td>
                  <td>300</td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
            </table>

            <div class="pagination" style="margin-top: 50px">
              <a href="#">&lt;</a>
              <a href="#">1</a>
              <a class="active" href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">&gt;</a>
            </div>

            <br /><br />
          </div>
        </main>
      </div>
    </div>

    <script>
      $(document).ready(function () {
        $('tbody tr').click(function () {
          location.href = "/html/admin/item_manage_detail.html";
        });
      });

      $(document).ready(function () {
        // Apply underline effect when page loads for the first time
        $('#btn1').addClass('underline');

        // Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
        $('#btn1').click(function () {
          $('#btn1').addClass('underline');
          $('#btn2').removeClass('underline');
          $('#btn3').removeClass('underline');
        });

        // Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
        $('#btn2').click(function () {
          $('#btn2').addClass('underline');
          $('#btn1').removeClass('underline');
          $('#btn3').removeClass('underline');
        });

        // Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
        $('#btn3').click(function () {
          $('#btn3').addClass('underline');
          $('#btn1').removeClass('underline');
          $('#btn2').removeClass('underline');
        });
      });
    </script>
    <!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
  </body>
</html>
