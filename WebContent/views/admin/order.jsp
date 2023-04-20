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
<html lang="en">
<head>
<title>관리자 페이지</title>
<%@ include file="common2.jsp"%>
<link href="/resources/css/admin/order.css" rel="stylesheet" />
<script src="/resources/js/admin/order.js"></script>
</head>

<body class="sb-nav-fixed">

	<%@ include file="sidebar.jsp"%>

	<div id="layoutSidenav_content">
		<main>
			<div class="container px-6 white">
				<h2>회원 주문 관리</h2>
				<hr />
				<div class="row">
					<div class="col btn-hover">
						<button class="btn" id="btn1">
							전체 <span class="list-btn">17</span>
						</button>
						<button class="btn" id="btn2">
							배송중 <span class="list-btn">15</span>
						</button>
						<button class="btn" id="btn3">
							배송완료 <span class="list-btn">2</span>
						</button>
					</div>
				</div>
				<!-- 
            <div style="height: 60px"><button type="button" id="btn" class="btn">글쓰기</button></div> -->

				<div>
					<button type="button" id="btn" class="btn">글쓰기</button>
					<form role="search">
						<button type="submit" id="btn" class="btn">검색하기</button>
						<input type="search" class="form-control" placeholder=""
							aria-label="Search" style="width: 30%; float: right" />
					</form>
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

				<ul class="pagination">
					<%
						if (currentPage != 1) {
					%>
					<li class="page-item"><a
						href="/itemList.ad?page=<%=startPage%>&category=<%=category%>">&lt;&lt;</a>
					</li>
					<li class="page-item"><a
						href="/itemList.ad?Page=<%=currentPage - 1%>&category=<%=category%>">&lt;</a>
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
						href="/itemList.ad?page=<%=p%>&category=<%=category%>"><%=p%></a>
					</li>
					<%
						} else {
					%>
					<li class="page-item"><a class="page-link"
						href="/itemList.ad?page=<%=p%>&category=<%=category%>"><%=p%></a>
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
						href="/itemList.ad?page=<%=currentPage + 1%>&category=<%=category%>">&gt;</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="/itemList.ad?page=<%=maxPage%>&category=<%=category%>">&gt;&gt;</a>
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
		</main>
	</div>

	<script>
		$(document).ready(
				function() {
					$('.modi').click(
							function() {
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
										location.reload();
									},
								});
							});

					$('#btn1').addClass('underline');

					// Apply underline effect when clicking btn1, and remove underline effect for btn2 and btn3
					$('#btn1').click(function() {
						$('#btn1').addClass('underline');
						$('#btn2').removeClass('underline');
						$('#btn3').removeClass('underline');
					});

					// Apply underline effect when clicking btn2, and remove underline effect for btn1 and btn3
					$('#btn2').click(function() {
						$('#btn2').addClass('underline');
						$('#btn1').removeClass('underline');
						$('#btn3').removeClass('underline');
					});

					// Apply underline effect when clicking btn3, and remove underline effect for btn1 and btn2
					$('#btn3').click(function() {
						$('#btn3').addClass('underline');
						$('#btn1').removeClass('underline');
						$('#btn2').removeClass('underline');
					});
				});

		$(function() {
			selectReplyList();

			// 만약 댓글 조회를 실시간으로 하고 싶다면
			// 5초 간격마다 selectReplyList() 함수를 호출하도록 하면 된다.
			window.setInterval(selectReplyList, 5000);
		});

		function selectReplyList() {
			$.ajax({
				url : 'order.ad',
				type : 'get',
				data : {
					page : '1',
					category : 'A'
				},
				success : function(list) {
					a = list.pi
					boardLimit = a.boardLimit;

					currentPage = a.currentPage;

					endPage = a.endPage;

					listCount = a.listCount;

					maxPage = a.maxPage;

					pageLimit = a.pageLimit;

					saleCount = a.saleCount;

					soldCount = a.soldCount;

					startPage = a.startPage;

					totalCount = a.totalCount;

				},
				error : function() {
					console.log('댓글리스트 조회용 ajax 통신 실패');
				},
			});
		}
	</script>



	<!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
</body>
</html>
