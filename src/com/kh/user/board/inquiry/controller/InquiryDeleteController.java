// 1:1 문의 삭제용 컨트롤러
//  2023-04-19 김서영

package com.kh.user.board.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.inquiry.model.service.InquiryService;

/**
 * Servlet implementation class InquiryDeleteController
 */
@WebServlet("/delete.in")
public class InquiryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ino = Integer.parseInt(request.getParameter("ino"));  // 1:1 문의 번호

//		System.out.println("문의 삭제 번호" + ino);
		int result = new InquiryService().deleteInquiry(ino);

		if(result > 0) {  // 삭제 성공
			request.setAttribute("alertMsg", "1:1 문의가 성공적으로 삭제되었습니다.");
//			System.out.println(result);
			response.sendRedirect("/list.in");
		} else { // 삭제 실패
			request.setAttribute("errorMsg", "1:1 문의 삭제에 실패하였습니다.");
//			System.out.println(result);
			request.getRequestDispatcher("views/board/one.jsp").forward(request, response);
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
