package com.kh.user.main.controller;
// 2023-04-18 조승호

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.shop.item.model.service.ItemService;
import com.kh.user.shop.item.model.vo.Item;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 ArrayList<Item> discountList = new ItemService().discountList();
		 ArrayList<Item> newList = new ItemService().newList();
		 ArrayList<Item> bestList = new ItemService().bestList();
		 // ArrayList<Item> newList = new ItemService().newList();
		
		
		
		 request.setAttribute("discountList", discountList);
		 request.setAttribute("newList", newList);
		 request.setAttribute("bestList", bestList);
		 // request.setAttribute("newList", newList);
		
		
		
		request.getRequestDispatcher("views/main/main.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
