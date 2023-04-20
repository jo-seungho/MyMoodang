<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,
    com.kh.user.shop.review.model.vo.Review "%>
<%
	ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
%>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            /* 테이블 스타일 */
            table {
              width: 45%;
              border-collapse: collapse;
              font-size: 16px;
              margin: auto;

            }
            th, td {
              padding: 12px;
              text-align: left;
              border-bottom: 1px solid #ddd;
              text-align: center;
            }
            th {
              background-color: #f8f8f8;
              color: #333;
              font-weight: bold;
              cursor: pointer;

            }
            tr:hover {
              background-color: #f9f9f9;
            }

            /* 게시물 내용 토글 스타일 */
            .content {
              display: none;
            }
            .content td {
              background-color: #f9f9f9;
              padding: 20px;
            }

            /* 게시물 제목 클릭 시 커서 스타일 변경 */
            .post td[onclick]:hover {
              color: #007bff;
              text-decoration: underline;
              cursor: pointer;
            }

            table tbody tr td:nth-child(3){
                color: red;
            }
          </style>
    </head>
    <body>
        <table>
        <thead>
          <tr>
            <th onclick="sortTable(0)" width="100px">번호</th>
            <th onclick="sortTable(1)" width="100px">작성일</th>
            <th onclick="sortTable(2)" width="100px">별점</th>
            <th onclick="sortTable(3)">제목</th>
            <th onclick="sortTable(4)"width="100px">작성자</th>
            <th onclick="sortTable(5)"width="100px">조회수</th>
          </tr>
        </thead>
        <tbody>
    <% for(Review r : rlist){ %>
      <tr class="post">
        <td><%= r.getReviewNo()%></td>
        <td><%= r.getWriteDate()%></td>
        <td><%= r.getStarPoint()%></td>
        <td onclick="toggleContent(<%= r.getReviewNo()%>)" style="cursor: pointer;"><%= r.getTitle()%></td>
        <td>유저1</td>
        <td>100</td>
      </tr>
      <tr class="content" id="content<%= r.getReviewNo()%>" style="display:none;">
        <td colspan="6">
          <p><%= r.getContent()%></p>
        </td>
      </tr>
    <%} %>
  </tbody>
      </table>
      <script>
      function toggleContent(reviewNo) {
    	    var contentRow = document.getElementById("content" + reviewNo);
    	    if (contentRow.style.display === "none") {
    	      contentRow.style.display = "table-row";
    	    } else {
    	      contentRow.style.display = "none";
    	    }
    	  }

      function sortTable(columnIndex) {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementsByTagName("table")[0];
        switching = true;
        while (switching) {
          switching = false;
          rows = table.getElementsByTagName("tr");
          for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("td")[columnIndex];
            y = rows[i + 1].getElementsByTagName("td")[columnIndex];
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              shouldSwitch = true;
              break;
            }
          }
          if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
          }
        }
      }

      function displayStars(rating) {
        let stars = "";
        for (let i = 1; i <= 5; i++) {
          if (i <= rating) {
            stars += "&#9733;"; // Full star
          } else {
            stars += "&#9734;"; // Empty star
          }
        }
        return stars;
      }

      // Get all the rows with class "post"
      let postRows = document.querySelectorAll(".post");

      // Loop through each post row and update the "별점" column with stars
      postRows.forEach(function(row) {
        let rating = parseInt(row.querySelector("td:nth-child(3)").innerText);
        let stars = displayStars(rating);
        row.querySelector("td:nth-child(3)").innerHTML = stars;
      });
    </script>

    </body>
    </html>