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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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
						    배송중 <span class="list-btn"><%= pi.getSoldCount() %></span>
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
					
						<button type="button" id="btn" class="btn searchBtn">검색하기</button>
				
						<input type="hidden" name="page" value="<%= currentPage %>">
						<input type="hidden" name="category" value="<%= category %>">
						<input type="search" name="search" class="form-control" placeholder="검색어를 입력하세요" required
							style="width: 30%; float: right" />
							
						<select class="form-select-sm select-forms" name="value">
						  <option value="MEMBER_ID">주문자 ID</option>
						  <option value="SHIPPING_ADDR">배송주소</option>
						</select>
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
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModal">주문 내역 조회</h5>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<!-- Hidden field to send the action to the server -->

						<div class="input-group mb-3">
							<span class="input-group-text" id="spanId">&nbsp;&nbsp;ID&nbsp;&nbsp;</span>
							<input type="text" class="form-control" id="memberId"
								placeholder="아이디" aria-label="memberId" aria-describedby="memberId"
								readonly /> <span class="input-group-text" id="spanNo">주문번호</span>
							<input type="text" class="form-control" id="orderNo" name="orderNo"
								placeholder="주문번호" aria-label="orderNo" aria-describedby="orderNo"
								readonly />
						</div>

						<div class="input-group mb-3">
							<span class="input-group-text" id="spanName">번호</span> <input
								type="text" class="form-control" id="phone" placeholder="휴대폰 번호"
								aria-label="userName" aria-describedby="userName" readonly /> <span
								class="input-group-text" id="spanName">주문날짜</span> <input
								type="text" class="form-control" id="orderDate"
								placeholder="주문날짜" aria-label="orderDate"
								aria-describedby="orderDate" readonly />
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="spanName">주소</span> <input
								type="text" class="form-control" id="shipAddr" placeholder="주소"
								aria-label="shipAddr" aria-describedby="shipAddr"
								readonly /> 
						</div>

	
						<div class="input-group mb-3">
						
						<img src="/resources/img/닭가슴살샐러드3.jpg" style="width : 150px; height : 150px;">
							<span class="input-group-text" id="spanItem">주문 상품</span>
							<input type="text" class="form-control" id="itemList"
									aria-label="text" readonly />
									
						</div>
						
						
						
						
						<div class="input-group mb-3">
							<span class="input-group-text" id="spanPay">결제금액</span>
							<input type="text" class="form-control" id="pay"
								placeholder="결제금액" aria-label="pay" aria-describedby="pay"
								value="" readonly />
						</div>
						

						
						<div class="input-group mb-3">
							<span class="input-group-text" id="spanItem">요청 사항</span>
							<input type="text" class="form-control" id="request"
									aria-label="text" readonly />
						</div>
						
						
					</div>

					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-bs-dismiss="modal">닫기</button>
						<button class="btn btn-danger deleteBtn" type="button" style="margin-bottom : 4px;">삭제</button>
					</div>
				</form>
			</div>
		</div>
		</div>

	
			
			
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
			        
			        // 페이지 로드
			        handleButtonClick(page, category);
			    });
			    
			    // 브라우저 뒤로 가기/앞으로 가기 이벤트 핸들러 등록
			    window.onpopstate = function(event) {
			        if (event.state) {
			            loadPage(event.state.page);
			        }
			    };
			    
			    
			    
			    
			    $('.deleteBtn').click(function() {

					confirm('정말 삭제하시겠습니까?');

					if (confirm) {
						var orderNo = $('#orderNo').val();
						$.ajax({
							url : 'orderDelete.ad',
							type : 'post',
							data : {
								orderNo : orderNo,
							},
							success : function(data) {
								alert('주문이 삭제되었습니다.');
								window.location.reload();
							},
						});
					}
				});
			    
			
				
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
							window.location.reload();
						},
					});
				});
	
				 function handleButtonClicked(page, category, search, value) {
				    $('.btn').removeClass('underline');
				    
				    $(this).addClass('underline');
				    
				    $.ajax({
				        url: 'order.ad',
				        type: 'post',
				        data: {
				            page: page,
				            category: category,
				            search : search,
				            value : value
				        },
				        success: function(list) {
				            $('main').html(list);
				        },
				        error: function() {
				            console.log('댓글리스트 조회용 ajax 통신 실패');
				        },
				    });
				} 
				
				function handleButtonClick(page, category) {
				    $('.btn').removeClass('underline');
				    
				    $(this).addClass('underline');
				    
				    $.ajax({
				        url: 'order.ad',
				        type: 'post',
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
				
				
				 $('.searchBtn').click(function() {
				    var search = $('input[name="search"]').val();
				    var value = $('select[name="value"]').val();
				    var page = $('input[name="page"]').val();
				    var category = $('input[name="category"]').val();

				    handleButtonClicked(page, category, search, value);
				});
				 
				 
				 
				 
				 $('tbody').on('click', 'td', function() {
						var getOrderNo = $(this).closest('tr').find('td:eq(0)').text();
						$.ajax({
							url : 'selectOrder.ad',
							type : 'get',
							data : {
								orderNo : getOrderNo
							},

							success : function(result) {
								console.log(result);
								if (result != null) {
									console.log(result);
									//모달에게 값을 전달
									$('#orderNo').val(result.orderNo);
									$('#memberId').val(result.memberId);
									$('#itemList').val(result.itemList);
									$('#request').val(result.request);
									$('#phone').val(result.phone);
									$('#orderDate').val(result.orderDate.replace(/\t+/g, " "));
									$('#orderstatus').val(result.orderStatus);
									$('#pay').val(result.paymentAmount + '원');
									$('#shipAddr').val(result.shipAddr); 
									

									$('#myModal').modal('show');
								}
							},
							error : function(e) {
								alert('회원을 조회할 수 없습니다');
							},
						});
					});
				 
				 
				//dropdown-menu에 있는 값 가져와서 input에 넣기
					$('.drop1 li a').click(function() {
						var text = $(this).text();
						$(this).parents('.input-group').find('#orderstatus').val(text);
					});
				 
				 
				 
				
				
				});	
			</script>
</body>
</html>