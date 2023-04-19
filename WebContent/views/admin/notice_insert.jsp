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

    <!-- include summernote css/js -->
    
    <script src="https://code.jquery.com/jquery-3.6.4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.js"></script>
    <script src="/resources/js/common/summernote-ko-KR.min.js"></script>
  </head>

  <style>
    #btn {
      background-color: #fe7477;
      color: white;
      border: 1px solid white;
      float: right;
      margin-right: 4px;
    }

    /* 자체적인 css */
    .row {
      float: none;
      margin: 0 auto;
    }

    /* col과 input text 라인 맞춰주기 */
    .col {
      line-height: 35px;
    }

    .btns {
      height: 100%;
      margin-top: 15px;
    }
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
                  <a class="nav-link" href="/noticelist.ad">공지사항 관리</a>
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
        <main style="height: 100%">
          <div class="container px-6 white">
            <br />
            <h2>공지사항 작성</h2>
            <hr />

            <form action="insert.no" method="POST">
              <div class="row center">
                <div class="col-xl-12"><input text class="form-control col-xl-6" value="" placeholder="제목을 입력해주세요" /></div>
              </div>
              <br />
              <textarea id="summernote"></textarea>
              <div class="btns">
                <button id="btn" class="btn" type="reset">취소</button>
                <button id="btn" class="btn" type="submit">작성</button>
              </div>
            </form>
          </div>
        </main>

        <script>
          $(document).ready(function () {
            //여기 아래 부분
            $('#summernote').summernote({
              height: 400, // 에디터 높이
              focus: true, // 에디터 로딩후 포커스를 맞출지 여부
              lang: 'ko-KR', // 한글 설정
              placeholder: '내용',
              disableResizeEditor: true, // 크기 조절 기능 삭제
              toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['color', ['forecolor', 'color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link', 'video']],
                ['view', ['fullscreen', 'help']],
              ],
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
              fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
            });
          });
          
          $.noConflict();
        </script>
      </div>
    </div>

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
