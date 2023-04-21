// 회원정보 수정 (비밀번호확인) 폼으로 연결 컨트롤러
// 2023-04-19 김서영

package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.MemberRessult;

/**
 * Servlet implementation class MemberUpdateCheckPwdFormController
 */
@WebServlet("/updateCheckPwd.me")
public class MemberUpdateCheckPwdFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateCheckPwdFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		if(session.getAttribute("loginUser") == null) { // 로그인 전 => alert로 경고 날린 후 메인페이지로 응답

			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");

			response.sendRedirect(request.getContextPath());

		} else { // 로그인 후

			request.getRequestDispatcher("views/member/edit_my_info_pw_check.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
