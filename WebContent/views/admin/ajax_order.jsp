<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.admin.shop.order.model.vo.Order, 
    java.util.ArrayList, 
    com.kh.admin.common.model.vo.AdminPageInfo"%>

<%
	AdminPageInfo pi = (AdminPageInfo) request.getAttribute("pi");
ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("list");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.select-forms {
	float : right; 
	height : 37px; 
	margin-right : 5px;
}

</style>
</head>
<body>	
	
			<div class="container px-6 white">
				<h2>회원 주문 관리</h2>
				<hr />
				<div class="row">
					<div class="col btn-hover">
						<button class="btn<%= category.equals("A") ? " underline" : "" %>" id="btn1">
						    전체 <span class="list-btn"><%= pi.getTotalCount() %></span>
						</button>
						<button class="btn<%= category.equals("B") ? " underline" : "" %>" id="btn2">
						    배송준비중 <span class="list-btn"><%= pi.getSaleCount() %></span>
						</button>
						<button class="btn<%= category.equals("C") ? " underline" : "" %>" id="btn3">
						    배송중 <span class="list-btn"><%= pi.getSaleCount() %></span>
						</button>
						<button class="btn<%= category.equals("D") ? " underline" : "" %>" id="btn4">
						    배송완료 <span class="list-btn"><%= pi.getCompleteCount() %></span>
						</button>
					</div>
				</div>
				<!-- 
            <div style="height: 60px"><button type="button" id="btn" class="btn">글쓰기</button></div> -->

				<div class="row">
				<div class="col-12">
					<button type="button" id="btn" class="btn">글쓰기</button>
					<form action="/order.ad">
					
						<button type="submit" id="btn" class="btn" onsubmit="checkSearch();">검색하기</button>
				
						<input type="hidden" name="page" value="<%= currentPage %>">
						<input type="hidden" name="category" value="<%= category %>">
						<input type="search" name="search" id="searchText" class="form-control" placeholder="검색어를 입력하세요"
							style="width: 30%; float: right" />
							
						<select class="form-select-sm select-forms" name="value">
						  <option value="MEMBER_ID">주문자 ID</option>
						  <option value="SHIPPING_ADDR">배송주소</option>
						</select>
					</form>
					</div>
				</div>
				<table class="table table-hover center">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문자 ID</th>
							<th>결제금액</th>
							<th>주문일자</th>
							<th>배송주소</th>
							<th>배송상태</th>
						</tr>
					</thead>
					<tbody>
<%
							for (Order o : list) {
						%>
						<tr>
							<td><%=o.getOrderNo()%></td>
							<td><%=o.getMemberId()%></td>
							<td><%=o.getPaymentAmount()%></td>
							<td><%=o.getOrderDate()%></td>
							<td><%=o.getShipAddr()%></td>
							<th>

								<div class="btn-group">
									<select class="form-select-sm" name="status">
										<option value="배송준비중"
											<%if (o.getOrderStatus().equals("배송준비중"))
	out.print("selected");%>>배송준비중</option>
										<option value="배송중"
											<%if (o.getOrderStatus().equals("배송중"))
	out.print("selected");%>>배송중</option>
										<option value="배송완료"
											<%if (o.getOrderStatus().equals("배송완료"))
	out.print("selected");%>>배송완료</option>

									</select>

									<button class="btn btn-secondary btn-sm modi">수정</button>
								</div>
							</th>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
				<br />

				<ul class="pagination" style="">
					<%
						if (currentPage != 1) {
					%>
					<li class="page-item"><a
						href="/order.ad?page=<%=startPage%>&category=<%=category%>">&lt;&lt;</a>
					</li>
					<li class="page-item"><a
						href="/order.ad?page=<%=currentPage - 1%>&category=<%=category%>">&lt;</a>
					</li>
					<%
						} else {
					%>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">&lt;&lt;</a></li>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">&lt;</a></li>
					<%
						}
					%>
					<%
						for (int p = startPage; p <= endPage; p++) {
					%>
					<%
						if (p == currentPage) {
					%>
					<li class="page-item active"><a class="page-link"
						href="/order.ad?page=<%= p %>&category=<%=category%>"><%=p%></a>
					</li>
					<%
						} else {
					%>
					<li class="page-item"><a class="page-link"
						href="/order.ad?page=<%= p %>&category=<%=category%>"><%=p%></a>
					</li>
					<%
						}
					%>
					<%
						}
					%>
					<%
						if (currentPage != maxPage) {
					%>
					<li class="page-item"><a class="page-link"
						href="/order.ad?page=<%=currentPage + 1%>&category=<%=category%>">&gt;</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="/order.ad?page=<%=maxPage%>&category=<%=category%>">&gt;&gt;</a>
					</li>
					<%
						} else {
					%>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">&gt;</a></li>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">&gt;&gt;</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<br />
			
			
			<script>
			
			$(document).ready(function() {
				
				$('.pagination a').click(function(e) {
			        e.preventDefault(); // 기본 이벤트 방지
			        
			        var url = $(this).attr('href'); // 페이지 URL 가져오기
			        
			        // 쿼리 스트링에서 page 값을 가져오기
			        var page = url.split('?')[1].split('&').find(function(param) {
			            return param.split('=')[0] === 'page';
			        }).split('=')[1];
			        var category = url.split('?')[1].split('&').find(function(param) {
			            return param.split('=')[0] === 'category';
			        }).split('=')[1];
			        
			        // 브라우저 URL 변경
			       
			        
			        // 페이지 로드
			        handleButtonClick(page, category);
			    });
			    
			    // 브라우저 뒤로 가기/앞으로 가기 이벤트 핸들러 등록
			    window.onpopstate = function(event) {
			        if (event.state) {
			            loadPage(event.state.page);
			        }
			    };
			
				
				$('.modi').click(function() {
					var orderNo = $(this).parent().parent()
							.parent().children().eq(0).text();
					var status = $(this).parent().children().eq(0)
							.val();
					$.ajax({
						url : 'orderStatus.ad',
						type : 'post',
						data : {
							orderNo : orderNo,
							status : status,
						},
						success : function(data) {
							alert('주문상태가 변경되었습니다.');
							window.onload();
						},
					});
				});
	
				function handleButtonClick(page, category) {
				    $('.btn').removeClass('underline');
				    
				    $(this).addClass('underline');
				    
				    $.ajax({
				        url: 'order.ad',
				        type: 'get',
				        data: {
				            page: page,
				            category: category
				        },
				        success: function(list) {
				            $('main').html(list);
				        },
				        error: function() {
				            console.log('댓글리스트 조회용 ajax 통신 실패');
				        },
				    });
				}

				$('#btn1').click(function() {
				    handleButtonClick.call(this, '1', 'A');
				});
				$('#btn2').click(function() {
				    handleButtonClick.call(this, '1', 'B');
				});
				$('#btn3').click(function() {
				    handleButtonClick.call(this, '1', 'C');
				});
				$('#btn4').click(function() {
				    handleButtonClick.call(this, '1', 'D');
				});
			});
			
			function checkSearch() {
				  var searchInput = document.getElementById("searchText");
				  if (searchInput.value == "") {
				    alert("Please enter a search query");
				    return false; // prevent form submission
				  }
				  return true; // allow form submission
				}

			//검색어 입력안하면 경고창 띄우기
			
						
			</script>
</body>
</html>