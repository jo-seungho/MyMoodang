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

<link rel="stylesheet" href="/resources/css/common/reset.css" />
<link rel="stylesheet" href="/resources/css/common/header.css" />
<link rel="stylesheet" href="/resources/css/board//one.css">
<link rel="stylesheet" href="/resources/css/common/footer.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/header.js"></script>
<script defer src="/resources/js/board/one.js"></script>

<title>1 : 1 문의</title>
</head>
<body>
	<!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->
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
								<li class="on"><a href="#">공지사항</a></li>
								<li><a href="#">자주하는 질문</a></li>
								<li class="one"><a href="#">1 : 1 문의 </a></li>
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


							<table id="nb1" align="center">
								<thead>
									<tr>
										<th class="n1">번호</th>
										<th class="n3">제목</th>
										<th class="n5">작성일</th>
										<th class="n5">답변상태</th>
									</tr>
								</thead>

								<tbody id="sd1">
									<% if(list.isEmpty()) { %>
										<tr>
											<td colspan="4">조회된 1:1 문의 리스트가 없습니다.</td>
										</tr>
									<% } else { %>

										<% for(Inquiry in : list) { %>
											<tr id="sd1_q1">
												<th class="s1"><%= in.getInqNo() %></th>
												<th class="s3"><%= in.getTitle() %></th>
												<th class="s5"><%= in.getDateCreate() %></th>

												<% if(in.getReplyContents() != null) { %>
													<th class="s6">[답변완료]</th>
												<% } else {%>
													<th class="s6">[답변대기]</th>
												<% } %>
											</tr>

											<tr id="sd1_q2">
												<td></td>
												<td colspan="2"><pre class="text1"><%= in.getDescription() %></pre>
												</td>
												<td align="center"><span> <a href="">수정</a>&nbsp;|
														<a href="">삭제</a>
												</span></td>
											</tr>


											<tr id="sd1_a">
												<td colspan="5">
													<div class="d3">

													<% if(in.getReplyContents() != null) { %>
														<pre class="text2">
					                                    <span>
					                                      안녕하세요. <br>
					                                      대한민국 1등 건강쇼핑몰 마이무당입니다.
					                                    </span>
					                                    <span id="replyContent">
					                                      <%= in.getReplyContents() %>
					                                    </span>
					                                    <span id="mmName">-마이무당-</span> <br>
					                                    <span id="replyDate"><%= in.getReplyDate() %></span>
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

							<div class="container mt-3" align="center">
								<ul class="pagination" style="justify-content: center">
									<% if(currentPage != 1) { %>
									<li class="page-item"><a class="page-link"
										href="/list.in?currentPage=<%= currentPage - 1 %>">Previous</a></li>
									<% } %>

									<% for(int p = startPage; p <= endPage; p++) {%>
									<% if(p == currentPage) { %>
									<li class="page-item active"><a class="page-link"
										href="/list.in?currentPage=<%= p %>"><%= p %></a></li>
									<% } else { %>
									<li class="page-item"><a class="page-link"
										href="/list.in?currentPage=<%= p %>"><%= p %></a></li>
									<% } %>
									<% } %>

									<% if(currentPage != maxPage) { %>
									<li class="page-item"><a class="page-link"
										href="/list.in?currentPage=<%= currentPage + 1 %>">Next</a></li>
									<% } %>
								</ul>
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