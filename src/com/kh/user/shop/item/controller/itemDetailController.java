package com.kh.user.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.shop.item.model.service.ItemService;
import com.kh.user.shop.item.model.vo.Attachment;
import com.kh.user.shop.item.model.vo.Item;

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

		// 상품을 클릭 했을 때 상품코드를 받아와서 상품 상세보기 페이지로 이동
		int itemcode = Integer.parseInt(request.getParameter("code"));

		// 상품 조회수 증가용 서비스 호출
		int result = new ItemService().increaseCount(itemcode);

		if(result > 0) { // 조회수 증가 성공 시 상품 상세보기 페이지로 이동
			
			// 상품 상세보기용 서비스 호출
			Item i = new ItemService().selectItem(itemcode);

			ArrayList<Attachment> list = new ItemService().selelctAttachmentList(itemcode);

			// 응답데이터 전달용 request 객체에 저장
			request.setAttribute("i", i);
			request.setAttribute("list", list);

		} else { // 조회수 증가 실패 시 에러페이지로 이동
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