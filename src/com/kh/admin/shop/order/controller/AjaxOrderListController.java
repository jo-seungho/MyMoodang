package com.kh.admin.shop.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	/**
	 * AJAX를 이용한 주문내역 조회페이지
	 * 2023-04-22 최명진
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderService orderService = new OrderService();
		int listCount = orderService.selectListCount();
		int readyCount = orderService.selectOrderStatusCount("배송준비중");
		int shipCount = orderService.selectOrderStatusCount("배송중");
		int completeCount = orderService.selectOrderStatusCount("배송완료");

		// Get parameters from the request
		int currentPage = Integer.parseInt((request.getParameter("page") == null ? "1" : request.getParameter("page")));

		String category = request.getParameter("category") == null ? "A" : request.getParameter("category");
		String value = request.getParameter("value");
		String search = request.getParameter("search");

	
		// Map category codes to status names
		Map<String, String> categoryMap = new HashMap<>();
		categoryMap.put(null, null);
		categoryMap.put("B", "배송준비중");
		categoryMap.put("C", "배송중");
		categoryMap.put("D", "배송완료");

		// Calculate page information based on category
		AdminPageInfo pi;
		if (categoryMap.containsKey(category)) {
		    String status = categoryMap.get(category);
		    pi = calculatePage(status, currentPage, listCount, readyCount, shipCount, completeCount);
		    ArrayList<Order> list = orderService.selectStatusOrderList(pi, status);
		    request.setAttribute("list", list);
		} else {
			
			if(value != null && search != null) {
				listCount = orderService.selectSearchAllCount(value, search);
				pi = calculatePage(null, currentPage, listCount, readyCount, shipCount, completeCount);
				ArrayList<Order> list = orderService.selectSearchAllOrderList(pi, value, search);
			    request.setAttribute("list", list);
			} else {
		    pi = calculatePage(null, currentPage, listCount, readyCount, shipCount, completeCount);
		    ArrayList<Order> list = orderService.selectAllOrderList(pi);
		    request.setAttribute("list", list);
			}
		}

		// Set attributes and forward to JSP
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/admin/ajax_order.jsp").forward(request, response);
		
		
	}


		// Calculate page information
		public AdminPageInfo calculatePage(String status, int currentPage, int listCount, int readyCount, int shipCount,
		                                   int completeCount) {
		    int pageLimit = 10;
		    int boardLimit = 10;

		    int currentCount;
		    if (status == null) {
		        currentCount = listCount;
		    } else if (status.equals("배송준비중")) {
		        currentCount = readyCount;
		    } else if (status.equals("배송중")) {
		        currentCount = shipCount;
		    } else {
		        currentCount = completeCount;
		    }

		    int maxPage = (int) Math.ceil((double) currentCount / boardLimit);
		    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		    int endPage = startPage + pageLimit - 1;
		    if (endPage > maxPage) {
		        endPage = maxPage;
		    }

		    return new AdminPageInfo(currentCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage,
		            listCount, readyCount, shipCount, completeCount);
		}
}
