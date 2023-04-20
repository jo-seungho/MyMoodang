package com.kh.admin.shop.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.common.model.vo.AdminPageInfo;
import com.kh.admin.shop.order.model.service.OrderService;
import com.kh.admin.shop.order.model.vo.CategoryOrder;
import com.kh.admin.shop.order.model.vo.Order;

@WebServlet("/order.ad")
public class OrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderListController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount = new OrderService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("page"));

		ArrayList<Order> list = null;

		String category = request.getParameter("category");

		int saleCount = new OrderService().selectOrderStatusCount(category);
		int soldCount = new OrderService().selectOrderStatusCount(category);

		AdminPageInfo pi = null;

		if (category.equals("A")) {
			pi = calculatePage(listCount, currentPage, listCount, saleCount, soldCount);
			list = new OrderService().selectAllOrderList(pi);
		} else if (category.equals("Y")) {
			pi = calculatePage(saleCount, currentPage, listCount, saleCount, soldCount);
			list = new OrderService().selectStatusOrderList(pi, category);
		} else if (category.equals("N")) {
			pi = calculatePage(soldCount, currentPage, listCount, saleCount, soldCount);
			list = new OrderService().selectStatusOrderList(pi, category);
		}

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/admin/order.jsp").forward(request, response);
		
		/*
		 * response.setContentType("application/json; charset=UTF-8");
		 * 
		 * 
		 * CategoryOrder co = new CategoryOrder(pi, list); new Gson().toJson(co,
		 * response.getWriter());
		 */
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public AdminPageInfo calculatePage(int currentCount, int currentPage, int totalCount, int saleCount, int soldCount) {
		int pageLimit = 10;

		int boardLimit = 10;

		int maxPage = (int) Math.ceil((double) currentCount / boardLimit);

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		return new AdminPageInfo(currentCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, totalCount, saleCount, soldCount);

	}
}
