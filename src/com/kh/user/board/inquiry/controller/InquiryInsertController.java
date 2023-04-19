package com.kh.user.board.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.board.inquiry.model.service.InquiryService;
import com.kh.user.board.inquiry.model.vo.Inquiry;
import com.kh.user.board.inquiry.model.vo.InquiryResult;

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

		// 로그인 기능 구현 이후, 로그인유저의 아이디, 유저번호 뽑아내어야 함

		int inqNo = Integer.parseInt(request.getParameter("ino"));
		String inquiryType = request.getParameter("type");
		String title = request.getParameter("title");
		String description = request.getParameter("content");

		Inquiry in = new Inquiry(inqNo, title, description, inquiryType);

		System.out.println(in);

		int result = new InquiryService().insertInquiry(in);

		InquiryResult inResult = new InquiryResult();

		if(result > 0) {  // 성공
			inResult.setSuccess("Y");
			inResult.setMessage(/*m.getName() +*/ "님의 1:1문의가 등록되었습니다.");
			System.out.println(inResult.getMessage());
		} else {  // 실패
			inResult.setSuccess("N");
			inResult.setMessage("1:1 문의 등록에 실패했습니다.");
			System.out.println(inResult.getMessage());
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
