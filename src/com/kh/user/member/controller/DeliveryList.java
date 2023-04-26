/* 2023.04.24 이지환 */
 // 2023.04.25 회원별 배송지목록 중 그 회원의 배송지별로 기본 배송지 여부 확인 가능하도록 수정 


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
	 * 2023.04.25 / 회원별 배송지목록 중 배송지별로 기본 배송지 여부 확인 가능하도록 수정 / 이지환
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session = request.getSession();
		  // 로그인한 회원 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    int memberNo = loginUser.getMemberNo();
		 
	    
	    ArrayList<ShippingAddress> shippingAddressList = new MemberService().manageMyShippingAddressList(memberNo);
	    
	    // 기본 배송지용
	   ArrayList<ShippingAddress> shipDefault = (ArrayList<ShippingAddress>) request.getAttribute("defaultAddress");
	 
	    System.out.println(shippingAddressList);
	    
	    // 2023.04.25 그 회원의 기본배송지 배송지 목록별 해당 배송지의 기본배송지 설정 유무 조회 가능하도록 추가
	    request.setAttribute("defaultAddress", shipDefault);
	    
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
