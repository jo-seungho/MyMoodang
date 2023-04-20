<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<%@ include file="common2.jsp"%>
<title>관리자 페이지</title>

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

<body class="sb-nav-fixed">
	<%@ include file="sidebar.jsp"%>

	<div id="layoutSidenav_content">
		<main>
			<div class="container px-6 white">
				<h2>공지사항 관리</h2>
				<hr />
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
							<th colspan="1">글 번호</th>
							<th colspan="1">제목</th>
							<th colspan="1">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3</td>
							<td>마이 팀 무당 화이팅 안내</td>
							<td>2023-04-10 12:25:40</td>
						</tr>
						<tr>
							<td>2</td>
							<td>마이무당 판매 안내</td>
							<td>2023-04-01 10:14:52</td>
						</tr>
						<tr>
							<td>1</td>
							<td>My Mudang 품질철학에 대해 알려드립니다!</td>
							<td>2023-03-31 09:14:42</td>
						</tr>
					</tbody>
				</table>
				<br />

				<div class="pagination">
					<a href="#">&lt;</a> <a href="#">1</a> <a class="active" href="#">2</a>
					<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
				</div>
			</div>
			<br />
		</main>
	</div>

	<!-- td 클릭시 notice_detail.html로 이동 -->
	<script>
		$(document).ready(function() {
			$('tbody tr').click(function() {
				location.href = 'notice_detail.html';
			});
		});
	</script>
	<!-- <script src="assets/demo/chart-area-demo.js">
    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    -->
</body>
</html>
