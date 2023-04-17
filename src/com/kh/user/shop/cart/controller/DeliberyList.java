package com.kh.user.shop.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.ShippingAddress;

/**
 * Servlet implementation class DeliberyList
 */
@WebServlet("/delibery_List.do")
public class DeliberyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliberyList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session = request.getSession();
		 Member member = (Member)session.getAttribute("member");
		 
		 ArrayList<ShippingAddress> shippingAddressList = ShippingAddress.findShippingAddressByMemberNo(member.getMemberNo());
		ArrayList<Member> member = new ArrayList<>();
		
	    for(Member member : memberList) {
	        ShippingAddress delivery = ShippingAddress.findDeliveryByMemberNo(member.getMemberNo());
	        deliveryList.add(delivery);
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
