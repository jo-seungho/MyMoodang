<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.admin.shop.item.model.vo.Item, java.util.ArrayList, com.kh.admin.common.model.vo.AdminPageInfo"%> 
<% 
	AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi"); 
	ArrayList<Item>list = (ArrayList<Item>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage(); 
	int startPage = pi.getStartPage(); 
	int endPage = pi.getEndPage(); 
	int maxPage = pi.getMaxPage();
	String category = request.getParameter("category");
	
%>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>관리자 페이지</title>
        <%@ include file="common2.jsp" %>
        <link rel="stylesheet" href="/resources/css/shop/item_management.css" />
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

        <%@ include file="sidebar.jsp" %>
        

          <div id="layoutSidenav_content">
            <main>
              <div class="container px-6 white">
                <div class="item_state" align="left">
                  <li class="item_list_manage"><h2>상품 리스트 관리</h2></li>
                </div>
                <hr />
                <div class="row">
                  <div class="col btn-hover">
                    <button class="btn" id="btn1">전체 <span class="list-btn"><%= pi.getTotalCount() %></span></button>
                    <button class="btn" id="btn2">판매 <span class="list-btn"><%= pi.getSaleCount() %></span></button>
                    <button class="btn" id="btn3">판매중지 <span class="list-btn"><%= pi.getSoldCount() %></span></button>
                  </div>
                </div>

                <div>
                  <a class="item_registration" href="/inItemForm.ad">
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
                    <% if (list.isEmpty()) { %>
                    <tr>
                      <td colspan="7">게시글이 없습니다.</td>
                    </tr>

                    <% } else { %> <% for (Item i : list) { %>
                    <tr>
                      <td><%= i.getItemCode() %></td>
                      <td><%= i.getItemDate() %></td>
                      <% if (i.getItemImg() == null) { %>
                      <td><img src="/resources/img/noimage.png" style="width: 80px; height: 50px" /></td>
                      <% } else { %>
                      <td><img src="<%= i.getItemImg()%>" style="width: 80px; height: 50px" /></td>
                      <% } %>
                      <td><%= i.getItemName() %></td>
                      <td><%= i.getItemStock() %></td>
                      <td><%= i.getItemPrice() %></td>
                      <td><%= i.getItemStatus() %></td>
                    </tr>
                    <% } %> <% } %>
                  </tbody>
                </table>

   
                <ul class="pagination" style="margin-top: 50px">
                  <% if(currentPage != 1) { %>
                  <li class="page-item">
                  	<a href="/itemList.ad?page=<%= startPage %>&category=<%=category%>">&lt;&lt;</a>
                  </li>
                  <li class="page-item">
                  	<a href="/itemList.ad?Page=<%= currentPage -1 %>&category=<%=category%>">&lt;</a>
                  </li>
                  <% } else { %>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&lt;&lt;</a>
                  </li>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&lt;</a>
                  </li>
                  <% } %> <% for(int p = startPage; p <= endPage; p++) { %> <% if(p == currentPage) { %>
                  <li class="page-item active">
                  <a class="page-link" href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  </li>
                  <% } else { %>
                  <li class="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= p %>&category=<%=category%>"><%= p %></a>
                  </li>
                  <% } %> 
                  	<% } %> 
                  <% if(currentPage != maxPage) { %>
                  <li lass="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= currentPage + 1 %>&category=<%=category%>">&gt;</a>
                  </li>
                  <li lass="page-item">
                  <a class="page-link" href="/itemList.ad?page=<%= maxPage %>&category=<%=category%>">&gt;&gt;</a>
                  </li>
                  <% } else { %>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&gt;</a>
                  </li>
                  <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">&gt;&gt;</a>
                  </li>
                  <% } %>
                </ul>

                <br /><br />
              </div>
            </main>
          </div>


        <script>
          $(document).ready(function () {
        	  if ($('tbody tr td').eq(0).text() == '게시글이 없습니다.') {
                  $('tbody tr td').css('cursor', 'default');
                } else {
                	$('tbody tr').click(function () {
                        location.href = '/itemDetail.ad?code=' + $(this).children().eq(0).text();
                      });
                    }
                });
        	  
        	  

          $(document).ready(function () {
            if ('<%= category %>' == 'a') {
            	$('#btn1').addClass('underline');
            	$('#btn2').removeClass('underline');
                $('#btn3').removeClass('underline');
            } else if ('<%= category %>' == 'y') {
                $('#btn2').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn3').removeClass('underline');
            }
            else if ('<%= category %>' == 'n') {
                $('#btn3').addClass('underline');
                $('#btn1').removeClass('underline');
                $('#btn2').removeClass('underline');
            }
            else $('#btn1').addClass('underline');

            // Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
            $('#btn1').click(function () {
              location.href = '/itemList.ad?page=1&category=a';
            });

            // Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
            $('#btn2').click(function () {
              location.href = '/itemList.ad?page=1&category=y';
            });

            // Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
            $('#btn3').click(function () {
              location.href = '/itemList.ad?page=1&category=n';
            });
          });
        </script>
        
  </body>
</html>
