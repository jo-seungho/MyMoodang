// 비밀번호 수정용 컨트롤러
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
 * Servlet implementation class AjaxMemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class AjaxMemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberUpdatePwdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPwd = request.getParameter("oldPwd");
		String upPwd = request.getParameter("upPwd");

		// 로그인한 유저의 아이디 가져오기
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();

		Member m = new MemberService().selectMemberInfo(memberId);

		System.out.println("m : " + m);
		System.out.println("upPwd : " + upPwd);

		// 서비스단 보내기
		boolean result = new MemberService().updatePwdMember(m, upPwd);

		System.out.println("컨트롤러 결과 : " + result);

		MemberRessult mr = new MemberRessult();

		if(result = true) { //비밀번호 수정 성공

			m.setPassword(upPwd);

			mr.setMessage(m.getName() + "님의 비밀번호가 성공적으로 수정 되었습니다.");
			mr.setSuccess("Y");
			mr.setMemberId(memberId);
			mr.setMemberNo(m.getMemberNo());

		} else {   // 비밀번호 수정 실패
			mr.setMessage(m.getName() + "님의 비밀번호 수정에 실패하였습니다.");
			mr.setSuccess("N");
		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
