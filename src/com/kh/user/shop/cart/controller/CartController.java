package com.kh.user.shop.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.cart.model.service.CartService;
import com.kh.user.shop.cart.model.vo.Cart;

/**
 * Servlet implementation class CartController
 */
// 2023-04-19 조승호
@WebServlet("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		// System.out.println(userNo);
		
		ArrayList<Cart> list = new CartService().selectCartList(userNo);
		
		request.setAttribute("list", list);
		
		// response.setContentType("application/json; charset=UTF-8");
		// Gson gson = new Gson();
		
		request.getRequestDispatcher("/views/shop/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
