package com.kh.user.shop.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.cart.model.service.CartService;

/**
 * Servlet implementation class CountCartList
 */
@WebServlet("/count")
public class CountCartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountCartList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(((Member)request.getSession().getAttribute("loginUser")) != null) {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		int result = new CartService().countItem(userNo);
		
		response.setContentType("application/json; charset=UTF-8");
	
		PrintWriter out = response.getWriter();
		
		out.print(result);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
