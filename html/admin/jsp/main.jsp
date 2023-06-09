<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="index.jsp"%>
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
                <img src="resources/img/logo.png?after" class="rounded" alt="로고" style="width: 70%; height: 50%; margin-top: 10px" />
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <a class="nav-link" href="index.html">
                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                메인 / 통계
              </a>
              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                <div class="sb-nav-link-icon"><i class="fa fa-fw fa-gift"></i></div>
                상품 관리
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
              </a>
              <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="layout-static.html">Static Navigation</a>
                  <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                </nav>
              </div>
              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                주문 관리
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
              </a>
              <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                    Authentication
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                    <nav class="sb-sidenav-menu-nested nav">
                      <a class="nav-link" href="login.html">Login</a>
                      <a class="nav-link" href="register.html">Register</a>
                      <a class="nav-link" href="password.html">Forgot Password</a>
                    </nav>
                  </div>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                    Error
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                    <nav class="sb-sidenav-menu-nested nav">
                      <a class="nav-link" href="401.html">401 Page</a>
                      <a class="nav-link" href="404.html">404 Page</a>
                      <a class="nav-link" href="500.html">500 Page</a>
                    </nav>
                  </div>
                </nav>
              </div>
              <a class="nav-link" href="charts.html">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                회원 관리
              </a>
              <a class="nav-link" href="tables.html">
                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                게시판 관리
              </a>
            </div>
          </div>
          <!-- <div class="sb-sidenav-footer"></div> sidenav의 footer-->
        </nav>
      </div>

      <div id="layoutSidenav_content">
        <main style="background-color: #f6fbfd">
          <div class="container-fluid px-4">
            <h1 class="mt-4">2023-04-07(토)</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">메인 및 통계 페이지</li>
            </ol>
            <div class="row">
              <div class="col-xl-3 col-md-6">
                <div class="card text-black mb-4 text-center">
                  <div class="card-header">회원 수</div>
                  <div class="card-body">15</div>
                </div>
              </div>
              <div class="col-xl-3 col-md-6">
                <div class="card text-black mb-4 text-center">
                  <div class="card-header">총 매출</div>
                  <div class="card-body">9,942,000원</div>
                </div>
              </div>
              <div class="col-xl-3 col-md-6">
                <div class="card text-black mb-4 text-center">
                  <div class="card-header">문의 대기</div>
                  <div class="card-body">3</div>
                </div>
              </div>
              <div class="col-xl-3 col-md-6">
                <div class="card text-black mb-4 text-center">
                  <div class="card-header">문의 완료</div>
                  <div class="card-body">3</div>
                </div>
              </div>
            </div>
            <h5>문의 목록</h5>
            <hr />

            <table class="myTable">
              <thead>
                <tr>
                  <th>글 번호</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>작성일</th>
                  <th>작성자</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>11</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>10</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>9</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>상품문의</td>
                  <td>음료가 맛없음</td>
                  <td>2023-03-20</td>
                  <td>hyuna95</td>
                </tr>
              </tbody>
            </table>
            <br />
            <h5>주문 목록</h5>
            <hr />
            <table class="myTable">
              <thead>
                <tr>
                  <th>주문번호</th>
                  <th>회원 아이디</th>
                  <th>주문가격</th>
                  <th>주문상태</th>
                  <th>요청사항</th>
                  <th>주문날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>3</td>
                  <td>hyuna95</td>
                  <td>23000</td>
                  <td>배송 대기중</td>
                  <td>문 앞에 놔주세요</td>
                  <td>2023-03-24 06:18:21</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>mjjang</td>
                  <td>89000</td>
                  <td>배송 대기중</td>
                  <td>무인택배함에 놔주세요</td>
                  <td>2023-03-20 08:05:40</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>user01</td>
                  <td>23000</td>
                  <td>배송 완료</td>
                  <td>부재시 전화주세요</td>
                  <td>2023-03-18 13:14:52</td>
                </tr>
              </tbody>
            </table>
          </div>
          <br />
        </main>
      </div>
    </div>
    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
