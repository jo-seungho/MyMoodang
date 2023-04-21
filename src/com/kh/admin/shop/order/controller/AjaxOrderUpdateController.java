package com.kh.admin.shop.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.shop.order.model.service.OrderService;
import com.kh.admin.shop.order.model.vo.Order;

@WebServlet("/orderStatus.ad")
public class AjaxOrderUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxOrderUpdateController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String status = request.getParameter("status");
		Order o = new OrderService().updateOrderStatus(orderNo, status);

		response.setContentType("application/json; charset=UTF-8");

		if (o != null) {
			new Gson().toJson(o, response.getWriter());

		} else {
			response.getWriter().print(0);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
