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


@WebServlet("/selectOrder.ad")
public class AjaxSelectOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxSelectOrderController() {}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("orderNo"));
		
		Order o = new OrderService().selectOrder(id);
		
		response.setContentType("application/json; charset=UTF-8");
		
		if(o != null) {
			new Gson().toJson(o, response.getWriter());
		} else {
			response.getWriter().print(0);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
