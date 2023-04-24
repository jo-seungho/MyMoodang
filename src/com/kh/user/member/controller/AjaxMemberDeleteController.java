// 회원탈퇴용 컨트롤러
// 2023-04-20 김서영

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
 * Servlet implementation class AjaxMemberDeleteController
 */
@WebServlet("/delete.me")
public class AjaxMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberDeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String password = request.getParameter("pwd");
//		System.out.println("password : " + password); 들어옴

		// 로그인 한 유저의 아이디, 비밀번호 가져오기
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
//		String password = ((Member)session.getAttribute("loginUser")).getPassword();
//		System.out.println("memberId : " + memberId);  들어옴

		Member m = new Member();
		m.setMemberId(memberId);
		m.setPassword(password);
		System.out.println(m);

		int result = new MemberService().deleteMember(m);

		MemberRessult mr = new MemberRessult();

		if(result > 0) { // 탈퇴성공
			mr.setSuccess("Y");
			mr.setMessage("성공적으로 회원 탈퇴 되었습니다. 그 동안 마이무당을 이용해주셔서 감사합니다.");
		} else { // 탈퇴 실패
			mr.setSuccess("N");
			mr.setMessage("회원탈퇴에 실패했습니다. 조금만 더 마이무당과 함께해 주세요.");
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mr, response.getWriter());

//		if(result > 0) { //탈퇴 성공
//			session.setAttribute("alertMsg", "성공적으로 회원 탈퇴 되었습니다. 그 동안 마이무당을 이용해주셔서 감사합니다.");
//
// 			// 로그아웃 처리
// 			session.removeAttribute("loginUser");
//
// 			response.sendRedirect("/main");   => sendRedirect를 하면 request가 리셋됨!! 그러므로
//
//		} else {   // 탈퇴 실패
//			request.setAttribute("errorMsg", "회원탈퇴에 실패했습니다. 조금만 더 마이무당과 함께해 주세요.");
//
//			// 포워딩 => 에러페이지로
//			request.getRequestDispatcher("/main").forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
