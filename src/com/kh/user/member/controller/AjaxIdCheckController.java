// 2023-04-14 김서영

package com.kh.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxEmailCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxIdCheckController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId = request.getParameter("memberId");

		int count = new MemberService().idCheck(checkId); // 사용중 아이디 수 가져오기

		response.setContentType("text/html; charset=UTF-8");

		if (count > 0) { // 사용불가 일치하는 회원 있음
			response.getWriter().print("NN");
		} else { // 사용가능 일치하는 회원 없음
			response.getWriter().print("YY");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
