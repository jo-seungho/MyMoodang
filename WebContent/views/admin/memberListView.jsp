<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.admin.member.model.vo.AdMember, java.util.ArrayList"%>
<%
	ArrayList<AdMember> list = (ArrayList<AdMember>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>회원 관리</title>
<%@ include file="common2.jsp"%>

<style>
.myTable>tbody>tr:hover {
	background-color: #f5f5f5;
}

.form-control {
	text-align: center;
}
</style>
</head>

<body class="sb-nav-fixed">
	<%@ include file="sidebar.jsp"%>
	
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
							for (AdMember m : list) {
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
</body>
</html>
