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
import com.kh.user.shop.review.model.vo.Review;

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
		
		
		
		// 상품을 클릭 했을 때 상품번호를 받아와서 상품 상세보기 페이지로 이동
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		

		// 상품 조회수 증가용 서비스 호출
		int result = new ItemService().increaseCount(bno);
		
		
		

		if(result > 0) { // 조회수 증가 성공 시 상품 상세보기 페이지로 이동
			
			//--------------------------------------------------------------------------------------
			
			// 상품 상세보기용 서비스 호출
			Item i = new ItemService().selectItem(bno);

			ArrayList<Attachment> list = new ItemService().selelctAttachmentList(bno);
			
			String category = i.getItemCategory();
			
			ArrayList<Attachment> clist = new ItemService().selelctAttachmentCategory(category);
			
			//--------------------------------------------------------------------------------------

			// 리뷰 리스트 서비스 호출

			 ArrayList<Review> rlist = new ItemService().selectReviewList(bno);
			 
			//--------------------------------------------------------------------------------------
	
			 int listCount = new ItemService().selectReviewListCount(bno);
			 
	
	

			// 응답데이터 전달용 request 객체에 저장
			request.setAttribute("i", i);
			request.setAttribute("list", list);
			request.setAttribute("clist", clist);
			request.setAttribute("rlist", rlist);

			request.setAttribute("listCount", listCount);

			

		} else { // 조회수 증가 실패 시 에러페이지로 이동
			request.setAttribute("", "");
		}	

		
		request.getRequestDispatcher("views/shop/item_detail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}