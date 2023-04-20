<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

	<%@ include file="common2.jsp" %>
    <title>Document</title>

    <!-- jquery 및 라이브러리 -->
  </head>

  <body class="sb-nav-fixed">
    <%@ include file="sidebar.jsp"%>
    

      <div id="layoutSidenav_content">
        <main style="background-color: #f6fbfd">
          <div class="container-fluid px-4">
            <h2>메인 및 통계 페이지</h2>
            <hr />
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
  </body>
</html>
