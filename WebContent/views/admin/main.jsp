<%@page import="com.kh.admin.common.model.vo.AdminPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	AdminPage a = (AdminPage) request.getAttribute("mainPage");
	int male = a.getMaleCount();
	int female = a.getFemaleCount();
	int uncheck = a.getUncheckedCount();
%>
<html lang="en">
<head>
<%@ include file="common2.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>

<title>관리자 메인</title>

<!-- jquery 및 라이브러리 -->
<style>
.card-body:hover {
	background-color: #f6fbfd;
	cursor: pointer;
}
</style>
</head>

<body class="sb-nav-fixed">
	<%@ include file="sidebar.jsp"%>

	<div id="layoutSidenav_content">
		<main style="background-color: #f6fbfd">
			<div class="container-fluid px-4">
				<h2>메인 및 통계 페이지</h2>
				<hr />
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card text-black mb-4 text-center">
							<div class="card-header">회원 수</div>
							<div class="card-body member">
								<p class="fa fa-users"></p>
								<%=a.getTotalMemberCount()%>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card text-black mb-4 text-center">
							<div class="card-header">총 매출</div>
							<div class="card-body member">
								<p class="fa fa-won"></p>
								<%=a.getTotalPaymentAmount()%>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card text-black mb-4 text-center">
							<div class="card-header">문의 대기</div>
							<div class="card-body inquiry">
								<i class="fa fa-comment fa-fw"></i>
								<%=a.getInquiryNullCount()%>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card text-black mb-4 text-center">
							<div class="card-header">문의 완료</div>
							<div class="card-body inquiry">
								<i class="fa fa-check"></i>
								<%=a.getInquiryNotNullCount()%>
							</div>
						</div>
					</div>
				</div>
				<h5>문의 목록</h5>
				<hr />
				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> 사이트 남녀 비율
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> 상품 카테고리 분류
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
				</div>

		
			<br />
		</main>
	</div>

	<script>
		$(document).ready(function() {
			$('.member').click(function() {
				location.href = '/listMember.ad';
			});

			$('.inquiry').click(function() {
				location.href = '/inquiryList.ad?currentPage=1';
			});
		});

		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		
		var ctx = document.getElementById('myPieChart');
		
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ '남성', '여성', '선택안함' ],
				datasets : [ {
					data : [ <%=male%>, <%=female%>, <%=uncheck%> ],
					backgroundColor : [ '#007bff', '#dc3545', '#ffc107' ],
				}, ],
			},
		});
		
		var ctx = document.getElementById("myBarChart");
		var myLineChart = new Chart(ctx, {
			  type: 'bar',
			  data: {
			    labels: ["제로음료", "무가당", "단백질", "도시락", "기타"],
			    datasets: [{
			      backgroundColor: "#FF6699",
			      borderColor: "#FF6699",
			      data: [20, 30, 40, 15, 5],
			    }],
			  },
			  options: {
			    scales: {
			      xAxes: [{
			        time: {
			          unit: 'month'
			        },
			        gridLines: {
			          display: false
			        },
			        ticks: {
			          maxTicksLimit: 6
			        }
			      }],
			      yAxes: [{
			        ticks: {
			          min: 0,
			          max: 100,
			          maxTicksLimit: 5
			        },
			        gridLines: {
			          display: true
			        }
			      }],
			    },
			    legend: {
			      display: false
			    }
			  }
			});
	</script>


</body>
</html>
