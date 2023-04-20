package com.kh.admin.shop.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.order.model.service.OrderService;
import com.kh.admin.shop.order.model.vo.Order;

@WebServlet("/order.ad")
public class AjaxOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxOrderListController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount = new OrderService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		String search = request.getParameter("search");
		String value = request.getParameter("value");
		
		ArrayList<Order> list = null;

		String category = request.getParameter("category");

		if (category.equals("B"))
			category = "배송준비중";

		if (category.equals("C"))
			category = "배송중";

		if (category.equals("D"))
			category = "배송완료";

		int readyCount = new OrderService().selectOrderStatusCount("배송준비중");
		int shipCount = new OrderService().selectOrderStatusCount("배송중");
		int completeCount = new OrderService().selectOrderStatusCount("배송완료");
//		int listCount = new OrderService().selectListCount(searchKeyword);

		AdminPageInfo pi = null;

		if (category.equals("A")) {
			pi = calculatePage(listCount, currentPage, listCount, readyCount, shipCount, completeCount);
			list = new OrderService().selectAllOrderList(pi);
		} else if (category.equals("배송준비중")) {
			pi = calculatePage(readyCount, currentPage, listCount, readyCount, shipCount, completeCount);
			list = new OrderService().selectStatusOrderList(pi, category);
		} else if (category.equals("배송중")) {
			pi = calculatePage(shipCount, currentPage, listCount, readyCount, shipCount, completeCount);
			list = new OrderService().selectStatusOrderList(pi, category);
		} else if (category.equals("배송완료")) {
			pi = calculatePage(completeCount, currentPage, listCount, readyCount, shipCount, completeCount);
			list = new OrderService().selectStatusOrderList(pi, category);
		}

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/admin/ajax_order.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public AdminPageInfo calculatePage(int currentCount, int currentPage, int totalCount, int readyCount, int shipCount,
			int completeCount) {
		int pageLimit = 10;

		int boardLimit = 10;

		int maxPage = (int) Math.ceil((double) currentCount / boardLimit);

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		return new AdminPageInfo(currentCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage,
				totalCount, readyCount, shipCount, completeCount);
	}
}
