<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.board.inquiry.model.vo.Inquiry" %>

<%
	Inquiry in = (Inquiry)request.getAttribute("in");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/board/onelist.css">
<script src="/resources/js/board/oneoneList.js"></script>
<script src="/resources/js/board/oneUpdateForm.js"></script>

<title>1:1 문의 글 수정</title>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<input type="hidden" id="ino" name="ino" value="<%= in.getInqNo() %>">

	<!-- 1 : 1 문의 글 작성 영역 시작 -->
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
								<li class="one"><a href="/list.in">1 : 1 문의 </a></li>
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

						<!-- 1 : 1 문의 글 작성 페이지 시작 -->
						<form id="one-section">

							<div class="typeWrapper">
								<p class="oneCategory">유형*</p>	<br><br><br>
								<select id="inType" name="inquiryType" class="categorySelect">
									<option disabled selected><%= in.getInquiryType() %></option>
									<option >주문/결제/반품/교환 문의</option>
									<option>이벤트/쿠폰 문의</option>
									<option>상품 문의</option>
									<option>배송 문의</option>
									<option>기타 문의</option>
								</select>
							</div>

							<div class="oneTitle">
								<p>제목*</p> <br><br><br>
								<input type="text" id="in_title" name="tltle" placeholder="제목을 입력해주세요." value="<%= in.getTitle() %>">
							</div>

							<div class="oneContent">
								<p>내용*</p>
								<textarea id="in_content" name="content" cols="30" rows="10" placeholder="내용을 입력해주세요."><%= in.getDescription() %></textarea>
							</div>

							<button type="button" id="dbtn" onclick="inquiryUpdate_btn();">등록</button>
						</form>
					</div>
</body>
</html>