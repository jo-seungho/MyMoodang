// 1:1 문의 수정용 컨트롤러
// 2023-04-18 김서영

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
 * Servlet implementation class AjaxInquiryUpdateController
 */
@WebServlet("/update.in")
public class AjaxInquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInquiryUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int inqNo = Integer.parseInt(request.getParameter("ino"));
		String title = request.getParameter("title");
		String description = request.getParameter("content");
		String inquiryType = request.getParameter("type");

		Inquiry in = new Inquiry(inqNo, title, description, inquiryType);

//		System.out.println("받은 파라미터 값" + in);

//		Inquiry inAll = new Inquiry();
//		inAll = new InquiryService().selectInquiry(in);
//
//		System.err.println("조회해온 상세 정보" + inAll);

		int result = new InquiryService().updateInquiry(in);
		InquiryResult inResult = new InquiryResult();

		if(result > 0) {  // 성공
			inResult.setSuccess("Y");
			inResult.setMessage(/*m.getName() +*/ "님의 1:1문의가 수정되었습니다.");
			System.out.println(inResult.getMessage());
		} else {  // 실패
			inResult.setSuccess("N");
			inResult.setMessage("1:1 문의 수정에 실패했습니다.");
			System.out.println(inResult.getMessage());
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(inResult, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
