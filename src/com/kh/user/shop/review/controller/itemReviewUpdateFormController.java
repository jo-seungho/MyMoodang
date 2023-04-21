package com.kh.user.shop.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.shop.item.model.vo.ItemImg;
import com.kh.common.MyFileRenamePolicy;
import com.kh.user.shop.item.model.vo.Attachment;
import com.kh.user.shop.review.model.service.itemReviewService;
import com.kh.user.shop.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class itemReviewUpdateController
 */
@WebServlet("/itemReviewUp.it")
public class itemReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Review re = new itemReviewService().selectReview(bno);


		
		
		request.setAttribute("re", re);

		request.getRequestDispatcher("views/user/shop/item/itemReviewUpdate.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
