
/* 2023.04.18 / 로그인 기능 / 이지환 */

package com.kh.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/loginForm.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		Member m = new Member();
		
		m.setMemberId(memberId);
		m.setPassword(password);
		
		Member loginMember = new MemberService().loginUser(m);
		
		if(loginMember == null) { // 로그인 실패 => 에러페이지로 포워딩함
			request.setAttribute("errorMsg", "로그인에 실패하였습니다.");
		
		request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		
		}
		 else { // 로그인 성공 => 메인페이지 응답
				
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", loginMember);
				
				session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
				response.sendRedirect("/");
			}
			
				
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
