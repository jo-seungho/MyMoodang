<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.admin.shop.order.model.vo.Order, 
    java.util.ArrayList, 
    com.kh.admin.common.model.vo.AdminPageInfo"%>
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
		</main>
	</div>
	<script>
	
		$(function() {
			selectReplyList();
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
					$('main').html(list);
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
