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
    <link rel="stylesheet" href="/resources/css/shop/item_manage_insert.css">
    <link rel="stylesheet" href="/resources/css/shop/item_manage_detail.css">
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
              <div class="state">
                <li class="item_manage_insert"><h2>상품 상세페이지</h2></li>
              </div>
            </div>

            <form id="item_manage_detail" name="item_manage_detail" enctype="multipart/form-data" method="">
              <table class="item_manage_detail_table">
                <tr>


                  <div class="insert-area">
                    <div id="img_view">
                      <div class="form-group row">
                        <label class="col-sm-2" style="margin-top: 15px;">* 대표 이미지</label>
                        <div class="col-sm-10">
                          <img id="img1" src="/resources/img/noimage.png" class="img-thumbnail" style="width: 500px; height: 300px;">
                          <input type="file"  id = "titleImg" name="productImage1" class="form-control" onchange="loadImg(this, 1);" required>
                        </div>
                      </div>

                    <div class="form-group row">
                      <label class="col-sm-2">* 상품명</label>
                      <div class="col-sm-3">
                        <input type="text" id="content" name="content" class="form-control_noImg1">
                      </div>  
                      <label class="col-count-2">* 수량(재고)</label>
                      <div class="col-count">
                        <input type="text" id="unitsInStock" name="unitsInStock" class="form-control_noImg1">
                      </div>
                      <label class="col-price-2">* 판매가격</label>
                      <div class="col-price">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control_noImg1">
                      </div>
                    </div>
                    
                    <div class="form-group row" style="margin-top: 20px;">
                      <label class="col-sm-2">* 내용</label>
                      <div class="col-sm-10">
                        <textarea id="name" rows="10" cols="50" class="form-control_noImg2"></textarea>
                      </div>


                      <div class="form-group row" style="margin: 0 auto; margin-top: 20px;">
                        <label class="col-sm-2">* 상품 할인율</label>
                        <div class="col-sm-10 discount">
                          <input type="number" id="discount"class="form-discount" placeholder="ex)    0.3" value="" style="width: 98px;">
                        </div>
                      </div>

                      
                      
                      <div class="form-group row" style="margin: 0 auto; margin-top: 20px;">
                        <label class="col-sm-2">* 상품 상태</label>
                        <div class="col-sm-10">
                          <select >
                            <option value="판매중">판매중</option>
                            <option value="판매중지">판매중지</option>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row" style="margin: 0 auto;  margin-top: 20px;">
                        <label class="col-sm-2">* 카테고리</label>
                        <div class="col-sm-10">
                          <select>
                            <option value="판매중">제로음료</option>
                            <option value="판매중지">단백질</option>
                            <option value="판매중지">무가당</option>
                          </select>
                        </div>
                      </div>
                </div>
              </div>


                </tr>
                <div class="detail-form">
                  <a href="item.html" class="btn btn-primary"  id="addBtn" style="margin-top: 40px; font-size : larger">수정하기</a>
                  <a href="item.html" class="btn btn-primary"  id="addBtn" style="margin-top: 40px; font-size : larger">삭제하기</a>
                  <a href="/html/admin/item_management.html" class="btn btn-primary"  id="listBtn"style="margin-top: 40px; font-size : larger">목록가기</a>
                </div>


              </table>

            </form>
            

            </div>
          </div>
        </main>
    <script>
      // class img-thumbnail 에 첨부파일 이미지 띄우기
      function loadImg(input, num) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('#img' + num).attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
        }
      }
      
    </script>
    <!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
  </body>
</html>
