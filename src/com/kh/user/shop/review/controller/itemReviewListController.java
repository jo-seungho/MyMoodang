package com.kh.user.shop.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.shop.review.model.service.itemReviewListService;
import com.kh.user.shop.review.model.vo.Review;

/**
 * Servlet implementation class itemReviewListController
 */
@WebServlet("/itemReviewList.it")
public class itemReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

			// 상품번호 뽑기
			int bno = Integer.parseInt(request.getParameter("bno"));
			
			System.out.println(bno);
			
			
			
			// 전체 리뷰 리스트 조회 후 조회결과 담기
			ArrayList<Review> rlist = new itemReviewListService().selectReviewList(bno);

			

			// GSON 을 이용하여 응답데이터 넘기기
			 response.setContentType("application/json; charset=UTF-8");
			 
			 new Gson().toJson(rlist, response.getWriter());

			 

	
			// 응답페이지 포워딩
			// request.setAttribute("rlist", rlist);
			
			

			// request.getRequestDispatcher("views/shop/itemReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
