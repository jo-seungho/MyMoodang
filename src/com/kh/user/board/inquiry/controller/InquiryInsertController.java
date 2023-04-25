package com.kh.user.board.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.user.board.inquiry.model.service.InquiryService;
import com.kh.user.board.inquiry.model.vo.Inquiry;
import com.kh.user.board.inquiry.model.vo.InquiryResult;
import com.kh.user.member.model.vo.Member;

/**
 * Servlet implementation class InquiryInsertController
 */
@WebServlet("/insert.in")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");

		InquiryResult inResult = new InquiryResult();

		if(loginUser != null) {

			int memberNo = loginUser.getMemberNo();
			String name = loginUser.getName();

			String inquiryType = request.getParameter("type");
			String title = request.getParameter("title");
			String description = request.getParameter("content");

			Inquiry in = new Inquiry();
			in.setInquiryType(inquiryType);
			in.setTitle(title);
			in.setDescription(description);

//			System.out.println(in);

			int result = new InquiryService().insertInquiry(in, memberNo);

			System.out.println("과연 결과는?" + result);
			
			if(result > 0) {  // 성공
				inResult.setSuccess("Y");
				inResult.setMessage(name + "님의 1:1문의가 등록되었습니다.");
				System.out.println(inResult.getMessage());
			} else {  // 실패
				inResult.setSuccess("N");
				inResult.setMessage("1:1 문의 등록에 실패했습니다.");
				System.out.println(inResult.getMessage());
			}

		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(inResult, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
