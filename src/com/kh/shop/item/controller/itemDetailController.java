package com.kh.shop.item.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.shop.item.model.service.ItemService;
import com.kh.shop.item.model.vo.Item;

/**
 * Servlet implementation class itemDetailController
 */
@WebServlet("/item.it")
public class itemDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int itemNo = Integer.parseInt(request.getParameter("No"));

		int result = new ItemService().increaseCount(itemNo);

		if(result > 0) {
			
			Item i = new ItemService().selectItem(itemNo);
		} else {
			request.setAttribute("", "");
		}	

		
		
		
		request.getRequestDispatcher("views/shop/itemdetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
