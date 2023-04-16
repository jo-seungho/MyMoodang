package com.kh.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.shop.item.model.service.ItemService;
import com.kh.shop.item.model.vo.Attachment;
import com.kh.shop.item.model.vo.Item;

/**
 * Servlet implementation class itemDetailController
 */
@WebServlet("/itemDetail.it")
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
		
		// 클릭했을 때 상품코드(상품번호)를 받아옴
		int itemCode = Integer.parseInt(request.getParameter("code"));
		
		// 상품 조회수 증가용 서비스 먼저 호출
		int result = new ItemService().increaseCount(itemCode);

		if(result > 0) { // 상품 조회수 증가에 성공 했을 경우 => 해당 상품 상세조회 후 item_detail.jsp로 이동
			
			// 상품 상세조회용 서비스 호출
			Item i = new ItemService().selectItem(itemCode);
			
			// 상품사진들에 대한 정보 조회
			ArrayList<Attachment> list = new ItemService().selectAttachmentList(itemCode);

			// 상품 상세조회 결과를 request에 담아서 전달
			request.setAttribute("i", i);
			request.setAttribute("list", list);

			request.getRequestDispatcher("views/shop/item_detail.jsp").forward(request, response);
		} else { // 상품 조회수 증가에 실패 했을 경우 => 에러페이지
			request.setAttribute("", "");
		}	

		
		
		
		//request.getRequestDispatcher("views/shop/item_detail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
