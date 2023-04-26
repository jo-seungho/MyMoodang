/* 2023.04.24 이지환 */

package com.kh.user.member.controller;

import java.io.IOException;
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
 * Servlet implementation class DeliveryAdd
 */
@WebServlet("/add.de")
public class DeliveryAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 /*
		
			*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		  // 로그인한 회원 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    int memberNo = loginUser.getMemberNo();
	    
	    
		String user_address = request.getParameter("user_address");
        String user_detail_address = request.getParameter("user_detail_address");
        int default_address = Integer.parseInt(request.getParameter("Default_address"));

        // Service 클래스 호출
        // ShippingAddress shippingAddress = new ShippingAddress(0, user_address, user_detail_address, default_address);
     // 회원 정보를 가져옵니다 (예: 로그인 세션)
        // ShippingAddress 객체를 생성하고 값을 설정합니다.
        ShippingAddress shippingAddress = new ShippingAddress();
        
        /* 2023.04.25 추가 (테스트 중) 이지환 */
        shippingAddress.setShipAddr(user_address);
        shippingAddress.setShipAddr(user_detail_address);
        
        // 기본 배송지 컬럼 만들어야되지 핞나
        shippingAddress.setDefault_address(default_address);
        int result = new MemberService().insertShippingAddress(shippingAddress);

        // 결과에 따라 성공/실패 페이지로 리다이렉트
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/deliveryList.do");
        } else {
            request.setAttribute("msg", "배송지 추가에 실패했습니다.");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
