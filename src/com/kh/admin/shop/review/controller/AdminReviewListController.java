// 리뷰관리 조회용 컨트롤러 
// 2023-04-25 소현아

package com.kh.admin.shop.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.shop.review.model.service.ReviewService;
import com.kh.admin.shop.review.model.vo.Review;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdminReviewListController
 */
@WebServlet("/reviewList.ad")
public class AdminReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new ReviewService().selectListCount();

		currentPage = Integer.parseInt((request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")));

		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/boardLimit);


		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;


		endPage = startPage + pageLimit - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Review> list = new ReviewService().selectReviewList(pi);
		

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);


		request.getRequestDispatcher("views/admin/review.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
