// 2023.04.25 / 기본 배송지 체크하고 저장 시 기본배송지도 업데이트 가능하도록 수정 / 이지환 

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


// 2023.04.25 / 기본배송지 추가 / 이지환


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
		        
		        // 2023.04.25 defaultAddress 추가
		        String defaultAddress = request.getParameter("Default_address");
		        if (defaultAddress != null) {
		            defaultAddress = "Y";
		        } else {
		            defaultAddress = "N";
		        }
		       
		       
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
		        
		        // defaultAddr 추가
		        updateMS.setDefaultAddress(defaultAddress);
		        System.out.println(defaultAddress + "는 기본주소지유무체크");
		        
		       
		        // 기존 기본 배송지를 "N"으로 변경하고 새로 선택된 배송지를 기본 배송지로 설정하는 로직
		        int result = new MemberService().updateDefaultAddress(shipNo, defaultAddress, memberNo);

		        if (result > 0) {
		            // 기본 배송지 업데이트 후, 나머지 정보 업데이트 진행
		        	
		        	String defaultMS = "Y";
		            result = new MemberService().updateShippingAddress(updateMS);
		            if (result > 0) {
		            	response.setContentType("text/html; charset=UTF-8");
		                session.setAttribute("alertMsg", "기본배송지를 포함한 배송지 정보가 수정되었습니다.");
		                session.setAttribute("isSuccess", true);
		                request.getRequestDispatcher("/deliveryList.do").forward(request, response);

		            } else {
		                request.setAttribute("errorMsg", "배송지 정보 수정에 실패하였습니다.");
		                request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		            }
		        } else {
		        	response.setContentType("text/html; charset=UTF-8");
		            session.setAttribute("alertMsg", "배송지를 수정하였습니다.");
		            request.getRequestDispatcher("/DeliveryList.do").forward(request, response);
		        }
		      //  response.setContentType("text/html; charset=UTF-8");
		       // request.getRequestDispatcher("/DeliveryList.do").forward(request, response);
		    }
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
