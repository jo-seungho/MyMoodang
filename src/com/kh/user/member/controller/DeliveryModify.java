package com.kh.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeliveryModify
 */
@WebServlet("/modify.de")
public class DeliveryModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터에서 값을 받아옵니다.
        String shipAddr = request.getParameter("shipAddr");
        String shipAddrInfo = request.getParameter("shipAddrInfo");
        String phone = request.getParameter("phone");
        String shipName = request.getParameter("shipName");
        int shipNo = Integer.parseInt(request.getParameter("shipNo"));

        // DeliveryModifyController를 호출합니다.
        DeliveryModifyController controller = new DeliveryModifyController();
        boolean result = controller.modify(shipAddr, shipAddrInfo, phone, shipName, shipNo);

        // 업데이트 결과에 따라 응답합니다.
        if (result) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
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
