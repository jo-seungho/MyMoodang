package com.kh.user.shop.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.order.model.service.OrderService;
import com.kh.user.shop.order.model.vo.Order;

/**
 * Servlet implementation class insertOrderController
 */
@WebServlet("/insertOrder")
public class insertOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		String phone = ((Member)request.getSession().getAttribute("loginUser")).getPhone();
		
		int totalPay = Integer.parseInt(request.getParameter("totalPay"));
		
		int address = new OrderService().SelectAddress(userNo);
		
		Order o = new Order(phone, userNo, address, totalPay);
		
		int result = new OrderService().insertOrder(o);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
