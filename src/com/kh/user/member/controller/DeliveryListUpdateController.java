// 2023-04-20 / 배송지 수정 기능 작성 중 / 이지환

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
 * Servlet implementation class DeliveyListUpdateController
 */
@WebServlet("/update.de")
public class DeliveryListUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryListUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//
		request.setCharacterEncoding("UTF-8");
		

	
		 
				HttpSession session = request.getSession();
				
			//	 ShippingAddress updateMS = new ShippingAddress(shipNo);
				    Member loginUser = (Member) session.getAttribute("loginUser");
				    int memberNo = loginUser.getMemberNo();
				    ArrayList<ShippingAddress> shippingAddressList = new MemberService().manageMyShippingAddressList(memberNo);
				// shipNo 추가
				int shipNo = Integer.parseInt(request.getParameter("shipNo"));
		        String updateShipAddr = request.getParameter("address");
		        String updateShipAddrInfo = request.getParameter("user_detail_address");
		        String updateShipName = request.getParameter("name");
		        String updatePhone = request.getParameter("mobileInp");

		       
		     //   int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

		      //  System.out.println("memberNo는 " + memberNo);
		        ShippingAddress updateMS = new ShippingAddress();
		     //   updateMS.setShipNo(shipNo);
		        
		        
		        System.out.println(updateMS + "set됬나");
		        updateMS.setShipNo(shipNo);
		        updateMS.setShipAddr(updateShipAddr);
		        updateMS.setShipAddrInfo(updateShipAddrInfo);
		        updateMS.setPhone(updatePhone);
		        updateMS.setShipName(updateShipName);
		        updateMS.setMemberNo(memberNo);
		     //   updateMS.setMemberNo(memberNo);
		        
		        System.out.println("updateMS는");
		        System.out.println(updateMS);
		        
		      //  updateMS = new ShippingAddress(updateMS);
		        int result = new MemberService().updateShippingAddress(updateMS);

		        if (result > 0) {
		        	 response.setContentType("text/html; charset=UTF-8");
		            session.setAttribute("alertMsg", "성공적으로 배송지 정보가 수정되었습니다.");
		            session.setAttribute("isSuccess", true);
		            
		            response.sendRedirect("/deliveryList.do");
		       } else {
		          request.setAttribute("errorMsg", "수정에 실패했습니다.");
		            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
