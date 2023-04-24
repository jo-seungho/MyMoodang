/* 2023.04.24 이지환 */


/* 2023-04-19 / url 매핑값 및 서비스로 값 넘기는 메소드명 수정 및 파일명 통일(deliberyList -> deliveryList) / 이지환 */
package com.kh.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.ShippingAddress;

/**
 * Servlet implementation class DeliberyList
 */

/* 2023-04-19 / url매핑값 delibery_List.do 에서 deliveryList.do 로 수정 / 이지환 */
@WebServlet("/deliveryList.do")
public class DeliveryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 2023.04.19 / 개인 회원의 본인 배송지 리스트 조회 / 이지환
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		/* 2023.04.19 / 로그인한 회원의 정보가 담기는 것까진 확인했음 / 이지환 */
		HttpSession session = request.getSession();
		  // 로그인한 회원 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    int memberNo = loginUser.getMemberNo();
		 
	    
	    ArrayList<ShippingAddress> shippingAddressList = new MemberService().manageMyShippingAddressList(memberNo);
	    
	    System.out.println(shippingAddressList);
	    
	    request.setAttribute("list", shippingAddressList);
	    request.getRequestDispatcher("/views/shop/deliveryList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
