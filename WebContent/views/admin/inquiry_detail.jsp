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
            <h2>1대1 문의 내용</h2>
            <hr />
            <div class="container">
              <div class="row center">
                <div class="col-6 xl-6">제목</div>
                <div class="col-2 xl-2">문의유형</div>
                <div class="col-2 xl-2">작성자</div>
                <div class="col-2 xl-2">작성일</div>
              </div>
              <hr />
              <div class="row center">
                <div class="col-6 xl-6">1대1 문의에 대한 제목부분입니다.제목을 길게해볼게요</div>
                <div class="col-2 xl-2">상품문의</div>
                <div class="col-2 xl-2">healthy</div>
                <div class="col-2 xl-2">2023-03-24</div>
              </div>
            </div>
            <hr />
            <textarea class="form-control-plaintext col-sm-5" rows="10" readonly>안녕하세요 상품문의 합니다.</textarea>
            <hr />
            <br />
            <h2>1대1 문의 답변</h2>
            <hr />
            <form action="" method="POST">
              <div class="row center">
                <div class="col-xl-12"><input text class="form-control col-xl-12" value="" placeholder="제목을 입력해주세요" /></div>
              </div>
              <hr />
              <textarea class="form-control col-sm-5" rows="10">안녕하세요 고객님! 마이무당입니다. 상품 설명에서 자세한 정보 확인 부탁드립니다.</textarea>
              <div class="btns">
                <button id="btn" class="btn">목록</button>
                <button id="btn" class="btn" type="submit">글쓰기</button>
              </div>
              <br /><br />
            </form>
          </div>
        </main>
      </div>

    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
