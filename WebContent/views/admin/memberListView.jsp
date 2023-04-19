<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.admin.member.model.vo.Member, java.util.ArrayList"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>

<style>
.myTable>tbody>tr:hover {
	background-color: #f5f5f5;
}

.form-control {
	text-align: center;
}
</style>
</head>

<body>
	<%@ include file="sidebar.jsp"%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">
			<div>
				<i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY
					MOODANG</b>
			</div>
		</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group"></div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark --bs-blue"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="text-center">
							<img src="/resources/img/logo.png" class="rounded logo" alt="로고" />
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
									<ul class="dropdown-menu dropdown-menu-end"
										aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#!">로그아웃</a></li>
									</ul></li>
							</ul>
						</div>
						<a class="nav-link" href="main.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> 메인 / 통계
						</a> <a class="nav-link" href="item.html">
							<div class="sb-nav-link-icon">
								<i class="fa fa-fw fa-gift"></i>
							</div> 상품 관리
						</a> <a class="nav-link" href="order.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-shopping-cart"></i>
							</div> 주문 관리
						</a> <a class="nav-link" href="member.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 회원 관리
						</a> <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-list"></i>
							</div> 게시판 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="notice.html">공지사항 관리</a> <a
									class="nav-link" href="inquiry.html">1:1 문의 관리</a> <a
									class="nav-link" href="review.html">리뷰 관리</a>
							</nav>
						</div>
					</div>
				</div>
				<!-- <div class="sb-sidenav-footer"></div> sidenav의 footer-->
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container px-6 white">
					<h2>회원 관리</h2>
					<hr />

					<table class="myTable">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>성별</th>
								<th>등급</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Member m : list) {
							%>
							<tr>
								<td><%=m.getMemberNo()%></td>
								<td><%=m.getMemberId()%></td>
								<td><%=m.getName()%></td>
								<td><%=m.getGender()%></td>
								<td><%=m.getGradeNo()%></td>
								<td><%=m.getEnrollDate()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<br />
			</main>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModal">회원 정보 조회</h5>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="/updateMember.ad" form="#" method="post">
					<div class="modal-body">
						<!-- Hidden field to send the action to the server -->

						<div class="input-group mb-3">
							<span class="input-group-text" id="spanId">&nbsp;&nbsp;ID&nbsp;&nbsp;</span>
							<input type="text" class="form-control" id="userId"
								placeholder="아이디" aria-label="userId" aria-describedby="userId"
								readonly /> <span class="input-group-text" id="spanNo">회원번호</span>
							<input type="text" class="form-control" id="userNo"
								placeholder="회원번호" aria-label="userNo" aria-describedby="userNo"
								name="userNo" readonly />
						</div>

						<div class="input-group mb-3">
							<span class="input-group-text" id="spanName">이름</span> <input
								type="text" class="form-control" id="userName" placeholder="이름"
								aria-label="userName" aria-describedby="userName" readonly /> <span
								class="input-group-text" id="spanName">가입날짜</span> <input
								type="text" class="form-control" id="enrollDate"
								placeholder="가입날짜" aria-label="enrollDate"
								aria-describedby="enrollDate" readonly />
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="spanName">성별</span> <input
								type="text" class="form-control" id="gender" placeholder="성별"
								aria-label="gender" aria-describedby="gender" name="gender"
								readonly /> <span class="input-group-text" id="spanPay">결제금액</span>
							<input type="text" class="form-control" id="pay"
								placeholder="결제금액" aria-label="pay" aria-describedby="pay"
								value="1,000,000원" readonly />
						</div>

						<div class="input-group mb-3">
							<button class="btn btn-outline-secondary dropdown-toggle"
								type="button" data-bs-toggle="dropdown" aria-expanded="false">등급</button>
							<ul class="dropdown-menu drop1">
								<li><a class="dropdown-item" href="#">왕초보당</a></li>
								<li><a class="dropdown-item" href="#">초보당</a></li>
								<li><a class="dropdown-item" href="#">중수당</a></li>
								<li><a class="dropdown-item" href="#">고수당</a></li>
							</ul>
							<input type="text" class="form-control" id="grade"
								aria-label="text" name="grade" readonly />

							<button class="btn btn-outline-secondary dropdown-toggle"
								type="button" data-bs-toggle="dropdown" aria-expanded="false">상태</button>
							<ul class="dropdown-menu drop2">
								<li><a class="dropdown-item" href="#">활성</a></li>
								<li><a class="dropdown-item" href="#">비활성</a></li>
							</ul>
							<input type="text" class="form-control" id="status"
								aria-label="text" name="status" readonly />
						</div>
						<div class="input-group mb-3"></div>
					</div>

					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-bs-dismiss="modal">닫기</button>
						<button class="btn btn-primary" type="submit">저장하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('tbody').on('click', 'td', function() {
				var getUserNo = $(this).closest('tr').find('td:eq(0)').text();
				$.ajax({
					url : 'selectMember.ad',
					type : 'get',
					data : {
						userNo : getUserNo
					},

					success : function(result) {
						console.log(result);
						if (result != null) {
							//result라는 json으로 받아온 객체값을 각각의 변수에 저장

							//모달에게 값을 전달
							$('#userNo').val(result.memberNo);
							$('#userId').val(result.memberId);
							$('#userName').val(result.name);
							$('#email').val(result.email);
							$('#birthDate').val(result.birthDate);
							$('#enrollDate').val(result.enrollDate);
							$('#gender').val(result.gender);
							$('#grade').val(result.gradeNo);
							$('#status').val(result.status);
							$('#pay').val(result.totalMoney);

							$('#myModal').modal('show');
						}
					},
					error : function(e) {
						alert('회원을 조회할 수 없습니다');
					},
				});
			});
		});

		//dropdown-menu에 있는 값 가져와서 input에 넣기
		$('.drop1 li a').click(function() {
			var text = $(this).text();
			$(this).parents('.input-group').find('#grade').val(text);
		});

		$('.drop2 li a').click(function() {
			var text = $(this).text();
			$(this).parents('.input-group').find('#status').val(text);
		});
	</script>
	<!-- <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script> -->
</body>
</html>
</Member>
</Member>
