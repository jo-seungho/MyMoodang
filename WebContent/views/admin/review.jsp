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
    .checked {
      color: orange;
    }
  </style>

  <body class="sb-nav-fixed">
  <%@ include file="sidebar.jsp" %>


      <div id="layoutSidenav_content">
        <main>
          <div class="container px-6 white">
            <h2>상품 리뷰 관리</h2>
            <hr />
            
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
                  <th>별점</th>
                  <th>리뷰제목</th>
                  <th>회원아이디</th>
                  <th>작성날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>202302340054</td>
                  <td>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                  </td>
                  <td>최고에요</td>
                  <td>hyuna95</td>
                  <td>2023-03-24 06:18:21</td>
                </tr>

                <tr>
                  <td>202302340053</td>
                  <td>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                  </td>
                  <td>님들 여기서 먹지마셈</td>
                  <td>user01</td>
                  <td>2023-03-23 06:18:22</td>
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
