<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .form-control {
      resize: none;
    }

    .btns {
      height: 100%;
      margin-top: 15px;
    }
  </style>

  <body class="sb-nav-fixed">
  	<%@ include file="sidebar.jsp" %>
  

      <div id="layoutSidenav_content">
        <main style="height: 100%">
          <div class="container px-6 white">
            <br />
            <h2>공지사항 수정</h2>
            <hr />

            <form action="" method="POST">
              <div class="row center">
                <div class="col">제목</div>
                <div class="col-xl-6"><input text class="form-control col-xl-6" value="MyMudang 품질철학에 대해 알려드립니다!" /></div>
                <div class="col">작성일</div>
                <div class="col-xl-2"><input text class="form-control col-xl-6" value="2023-03-24" /></div>
                <div class="col">조회수</div>
                <div class="col">24</div>
              </div>
              <hr />
              <textarea class="form-control col-sm-5" rows="15">마이무당의 첫번째 공지사항입니다! 저희 사이트에 오신것을 환영합니다.</textarea>
              <div class="btns">
                <button id="btn" class="btn">삭제</button>
                <button id="btn" class="btn" type="submit">수정</button>
                <button id="btn" class="btn">목록</button>
              </div>
            </form>
          </div>
        </main>
      </div>

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
