<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

<link rel="stylesheet" href="/resources/css/board/onelist.css">


<script defer src="/resources/js/board/oneoneList.js"></script>

<title>1 : 1 문의 글 작성</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 1 : 1 문의 글 작성 영역 시작 -->
	<div id="container">
		<div id="main">
			<div id="content">
				<div class="page_aticle aticle_type2">
					<div id="snb" class="snb_my" style="position: absolute;">
						<h2 class="tit_snb">고객센터</h2>
						<div class="inner_sub">
							<ul class="list_menu">
								<li><a href="/notice.no">공지사항</a></li>
								<li><a href="/fqa">자주하는 질문</a></li>
								<li class="on"><a href="/list.in">1 : 1 문의 </a></li>
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
						<form id="one-section" style="margin-top: 50px;" action="/insert.in" method="POST">


							<div class="typeWrapper">
								<p class="oneCategory">유형*</p>	<br><br><br>
								<select id="inType" name="inquiryType" class="categorySelect">
									<option disabled selected>문의 유형을 선택해 주세요.</option>
									<option >주문/결제/반품/교환 문의</option>
									<option>이벤트/쿠폰 문의</option>
									<option>상품 문의</option>
									<option>배송 문의</option>
									<option>기타 문의</option>
								</select>
							</div>

							<div class="oneTitle">
								<p>제목*</p> <br><br><br>
								<input type="text" id="in_title" name="tltle" placeholder="제목을 입력해주세요.">
							</div>

							<div class="oneContent">
								<p>내용*</p>
								<textarea id="in_content" name="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
							</div>

							<button type="submit" id="dbtn" onclick="return inquiryInsert_btn();">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 1:1 페이지 영역 끝 -->

	<%@ include file="../common/footer.jsp"%>


</body>
</html>
