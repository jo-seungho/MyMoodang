// 관리자 1:1문의 상세조회 컨트롤러
// 2023-04-21 소현아
package com.kh.admin.board.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.board.inquiry.model.service.InquiryService;
import com.kh.admin.board.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class AdminInquiryDetailController
 */
@WebServlet("/inquiryDetail.ad")
public class AdminInquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 int inqNo = Integer.parseInt(request.getParameter("ino"));
		 
		 Inquiry in = new InquiryService().selectInquiry(inqNo);
		 System.out.println(in);
		 request.setAttribute("in",in);
		 
		 request.getRequestDispatcher("views/admin/inquiry_detail.jsp").forward(request, response);
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
