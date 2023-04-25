package com.kh.user.shop.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.order.model.service.OrderService;
import com.kh.user.shop.order.model.vo.Order;

/**
 * Servlet implementation class OrderCompleteController
 */
@WebServlet("/orderComplete")
public class OrderCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCompleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		// int orderSelect = Integer.parseInt(request.getParameter("orderSelect"));
		
		ArrayList<Order> list = new OrderService().SelectOrderComplete(userNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/shop/orderComplete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
