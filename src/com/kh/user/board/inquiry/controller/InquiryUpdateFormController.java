// 1:1 문의 수정 페이지로 포워딩
// 2023-04-18 김서영

package com.kh.user.board.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.inquiry.model.service.InquiryService;
import com.kh.user.board.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryUpdateFormController
 */
@WebServlet("/updateForm.in")
public class InquiryUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ino = Integer.parseInt(request.getParameter("ino"));

		Inquiry in = new InquiryService().selectInquiry(ino);

//		System.out.println("조회해온 상세 정보" + in);  오케이
		request.setAttribute("in", in);

		request.getRequestDispatcher("views/board/oneUpdateForm.jsp").forward(request, response);  // 1:1 문의 수정 페이지로 포워딩
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
