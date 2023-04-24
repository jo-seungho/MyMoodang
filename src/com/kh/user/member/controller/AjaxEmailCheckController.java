// 이메일 인증용 컨트롤러
// 2023-04-23 김서영

package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.member.model.service.EmailService;
import com.kh.user.member.model.util.EmailAuth;
import com.kh.user.member.model.vo.EmailAuthResult;

/**
 * Servlet implementation class AjaxEmailCheckController
 */
@WebServlet("/emailCheck.me")
public class AjaxEmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxEmailCheckController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 인증번호 6자리 (숫자로만 랜덤생성)
		int authNo = new EmailAuth().authNo();

		// 이메일 보낼 때 필요한 변수들
		String email = request.getParameter("email");
		String title = "안녕하세요. 마이무당 인증메일 입니다.";
		String content = "안녕하세요. "
					+ "\n 즐겁고 건강한 음식, 마이무당 입니다. "
					+ "\n\n 요청하신 인증번호는 " + authNo + " 입니다. \n\n"
					+ "인증번호 입력 창에 해당 번호를 입력해주시기 바랍니다. "
					+ "\n\n 즐겁고 건강한 음식, 마이무당을 앞으로도 많이 찾아주시기 바랍니다. "
					+ "\n 사랑합니다. 고객님!";

//		System.out.println("이메일" + email);

		boolean result = new EmailService().sendEmail(email, title, content);

		EmailAuthResult ear = new EmailAuthResult();

		if(result) { // 인증번호 발신 성공
			ear.setSuccess("Y");
			ear.setMessage("인증번호가 입력하신 이메일로 발신되었습니다.");
			ear.setAuthNo(authNo);
		} else { // 인증번호 발신 실패
			ear.setSuccess("N");
			ear.setMessage("인증번호 발신에 실패하였습니다.");
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(ear, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
