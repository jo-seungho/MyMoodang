<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.common.model.vo.PageInfo,
				 java.util.ArrayList,
				 com.kh.user.board.inquiry.model.vo.Inquiry"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");


	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();


%>
<!--  jsp 변환 / 2023-04-18 김서영 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- header css -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/board/one.css">
<script src="/resources/js/board/one.js"></script>

<title>1 : 1 문의</title>
</head>
<body>



	<%@ include file="../common/header.jsp"%>


	<!-- 1 : 1 문의 영역 시작 -->
	<div id="container">
		<div id="main">
			<div id="content">
				<div class="page_aticle aticle_type2">
					<div id="snb" class="snb_my" style="position: absolute;">
						<h2 class="tit_snb">고객센터</h2>
						<div class="inner_sub">
							<ul class="list_menu">
								<li><a href="/noticelist.no">공지사항</a></li>
								<li><a href="/faq">자주하는 질문</a></li>
								<li class="one on"><a href="/list.in">1 : 1 문의 </a></li>
							</ul>
						</div>

					</div>
					<div id="viewOrderList" class="page_section section_orderlist">
						<div class="head_aticle">
							<h2 class="tit">
								1 : 1 문의 <span class="tit_sub"> 1:1문의를 접수해 주시면 상세히
									답변드리겠습니다 </span>
							</h2>
						</div>


						<form action="/insertForm.in" method="post">
							<button id="md" >문의 등록</button>
						</form>
						<!-- 1 : 1 문의 페이지 시작 -->
						<div id="one-section">


							<table id="nb1" align="center" style="border-collapse: separate;">
								<thead align="center">
									<tr>
										<th class="n1">번호</th>
										<th class="n3">제목</th>
										<th class="n5">작성일</th>
										<th class="n5">답변상태</th>
									</tr>
								</thead>

								<tbody id="sd1" align="center">
									<% if(list.isEmpty()) { %>
										<tr>
											<td colspan="4" align="center">조회된 1:1 문의 리스트가 없습니다.</td>
										</tr>
									<% } else { %>

										<% for(Inquiry in : list) { %>
											<tr class="sd1_q1">
												<th class="s1"><%= in.getInqNo() %></th>
												<th class="s3"><%= in.getTitle() %></th>
												<th class="s5"><%= in.getDateCreate() %></th>

												<% if(in.getReplyContents() != null) { %>
													<th class="s6">[답변완료]</th>
												<% } else {%>
													<th class="s6">[답변대기]</th>
												<% } %>
											</tr>

											<tr class="sd1_q2">
												<td></td>
												<td colspan="2"><pre class="text1" style="overflow:visible"><br><%= in.getDescription() %></pre>
												</td>
												<td align="center"><span> <a href="javascript:update_form('<%= in.getInqNo() %>');" id="update_form">수정</a>&nbsp;|
														<a href="javascript:delete_in('<%= in.getInqNo() %>');">삭제</a>
												</span></td>
											</tr>


											<tr align="center">
												<td colspan="5" class="d3 ">
													<!--  <div class="d3" align="center">  -->

													<% if(in.getReplyContents() != null) { %>
														<pre class="text2 sd1_q2">
<br><br>
<%= in.getReplyContents() %>
<br><br>

<span id="mmName" align="center">-마이무당-</span> <br>
<span id="replyDate" align="center"><%= in.getReplyDate() %></span>
						                                </pre>
													<% } %>
												</td>
											</tr>
									<!--  for 문 끝 -->
										<% } %>
									<!--  else 끝 -->
									<% } %>
									<!--  if 끝 -->
								</tbody>
							</table>

							<div align="center" class="paging-area">

		                          <div class="layout-pagination">
		                            <div class="pagediv">


											<a href="/list.in?currentPage=<%= currentPage - 1 %>" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>


										<span>
										<% for(int p = startPage; p <= endPage; p++) { %>

											<% if(p != currentPage) { %>

												<strong onclick="location.href = '/list.in?currentPage=<%= p %>';" class="layout-pagination-button layout-pagination-number __active" style="height: 32px;">
													<%= p %>
												</strong>
											<% } else { %>
												<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 -->

												<strong class="layout-pagination-button layout-pagination-number __active" style="height: 32px; background-color: lightgray; "><%= p %></strong>
											<% } %>
										<% } %>
										</span>

                                			<a href="/list.in?currentPage=<%= currentPage + 1 %>" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>

										</div>
									</div>

							</div>



						</div>

					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- 1:1 페이지 영역 끝 -->
	<%@ include file="../common/footer.jsp"%>
</body>
</html>