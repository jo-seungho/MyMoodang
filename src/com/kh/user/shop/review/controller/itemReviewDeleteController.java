package com.kh.user.shop.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.shop.review.model.service.itemReviewService;

/**
 * Servlet implementation class itemReviewDeleteController
 */
@WebServlet("/itemReviewDel.it")
public class itemReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		int result = new itemReviewService().deleteReview(rno);
		
		System.out.println(result);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			response.sendRedirect("/itemDetail.it?bno=" + bno);
		} else {
			request.setAttribute("msg", "리뷰 삭제에 실패하였습니다.");
			request.getRequestDispatcher("").forward(request, response);
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
