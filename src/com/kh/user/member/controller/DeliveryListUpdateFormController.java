/* 2023.03.24 배송지 수정 폼 컨트롤러 이지환 */

package com.kh.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.ShippingAddress;

/**
 * Servlet implementation class DeliveryListUpdateFormController
 */
@WebServlet("/updateForm.de")
public class DeliveryListUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryListUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	    
		   int shipNo = Integer.parseInt(request.getParameter("shipNo"));
		

		  ShippingAddress h  = new MemberService().selectByShipNo(shipNo);

		    request.setAttribute("updateMS", h);

		    request.getRequestDispatcher("/views/shop/delivery_modify.jsp").forward(request, response);
		
		

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
