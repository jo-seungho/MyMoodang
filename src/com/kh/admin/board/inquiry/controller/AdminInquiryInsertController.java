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
 * Servlet implementation class AdminInquiryInsertController
 */
@WebServlet("/inquiryInsert.ad")
public class AdminInquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String inquiryTitle = request.getParameter("title");
		String inquiryContent = request.getParameter("content");
		
		Inquiry in = new Inquiry();
		in.setTitle(inquiryTitle);
		in.setReplyContents(inquiryContent);
		
		int result = new InquiryService().insertInquiry(in);
		
		
		if(result > 0) { // 성공
			
			request.getSession().setAttribute("alertMsg", "문의답변이 성공적으로 등록되었습니다.");
			response.sendRedirect("/inquiryList.ad?currentPage=1");
			
		} else { // 실패
			
			request.setAttribute("alertMsg", "문의답변 등록 실패");
			request.getRequestDispatcher("/inquiryList.ad?currentPage=1").forward(request, response);
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
