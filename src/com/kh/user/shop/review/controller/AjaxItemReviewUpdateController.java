package com.kh.user.shop.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.review.model.service.itemReviewService;
import com.kh.user.shop.review.model.vo.Review;

/**
 * Servlet implementation class AjaxItemReviewUpdateController
 */
@WebServlet("/AjaxItemReviewUp.re")
public class AjaxItemReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxItemReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// 상품번호 뽑기
		int bno = Integer.parseInt(request.getParameter("bno"));
		// 수정할 값
		//String title = request.getParameter("title");
		String content = request.getParameter("content");
		//int starPoint = Integer.parseInt(request.getParameter("starpoint"));

		

		Review re = new Review();
		re.setReviewNo(bno);
		//re.setTitle(title);
		re.setContent(content);
		//re.setStarPoint(starPoint);

		int result = new itemReviewService().updateReview(re);

		
		if(result > 0) { 
			 request.getSession().setAttribute("alertMsg", "리뷰 수정에 성공했습니다.");
		 }
		 	
		 
		else {
			 request.setAttribute("msg", "리뷰 수정에 실패하였습니다.");
		}


		// Gson 을 이용하여 응답 데이터 넘기기
		response.setContentType("application/json; charset=UTF-8");

		new Gson().toJson(result, response.getWriter());

		};


		

			
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
