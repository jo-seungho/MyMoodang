package com.kh.user.shop.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.shop.review.model.service.itemReviewService;
import com.kh.user.shop.review.model.vo.Review;

/**
 * Servlet implementation class itemReviewInsertController
 */
@WebServlet("/itemReviewIn.it")
public class itemReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public itemReviewInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		int mno = 1;
		//int rno = Integer.parseInt(request.getParameter("rno"));
		
	
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("contentinsert");
		int starPoint = Integer.parseInt(request.getParameter("starpoint"));
		
		Review re = new Review(mno, title, content, starPoint);
		

		

		int result = new itemReviewService().insertReview(re);
		

		
		
		request.setAttribute("re",re);

		
		 if(result > 0) { 
			 request.getSession().setAttribute("alertMsg", "게시글 작성에 성공했습니다.");
			 response.sendRedirect("/itemDetail.it?bno=" + bno);
		 }
		 	
		 
		 	else {
			 request.setAttribute("msg", "리뷰 작성에 실패하였습니다.");
			 request.getRequestDispatcher("").forward(request, response); }

		 
	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
