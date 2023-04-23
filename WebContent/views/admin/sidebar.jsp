<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

	<a class="navbar-brand ps-3" href="/main.ad"><div>
			<i class="fas fa-bug" style="color: red"></i><b>&nbsp; MY MOODANG</b>
		</div></a>

	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>

	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="input-group"></div>
	</form>
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
					<a class="nav-link" href="/main.ad">
						<div class="sb-nav-link-icon">
							<i class="fas fa-home"></i>
						</div> 메인 / 통계
					</a> <a class="nav-link" href="/itemList.ad">
						<div class="sb-nav-link-icon">
							<i class="fa fa-fw fa-gift"></i>
						</div> 상품 관리
					</a> <a class="nav-link" href="/orderList.ad">
						<div class="sb-nav-link-icon">
							<i class="fas fa-shopping-cart"></i>
						</div> 주문 관리
					</a> <a class="nav-link" href="/listMember.ad">
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
							<a class="nav-link" href="/noticelist.ad?currentPage=1">공지사항 관리</a> <a
								class="nav-link" href="/inquiryList.ad?currentPage=1">1:1 문의 관리</a> <a
								class="nav-link" href="review.html">리뷰 관리</a>
						</nav>
					</div>
				</div>
			</div>
		</nav>
	</div>