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
      margin-left: 10px;
      margin-bottom: 10px;
    }
  </style>

  <body class="sb-nav-fixed">
  
  	<%@ include file="sidebar.jsp" %>
    

      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>1대1 문의 관리</h2>
            <hr />
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
                  <th>문의번호</th>
                  <th>문의유형</th>
                  <th>회원아이디</th>
                  <th>문의제목</th>
                  <th>문의날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>상품문의</td>
                  <td>hyuna95</td>
                  <td>언제 입고되나요?</td>
                  <td>2023-03-24 06:18:21</td>
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
    <!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
  </body>
</html>
