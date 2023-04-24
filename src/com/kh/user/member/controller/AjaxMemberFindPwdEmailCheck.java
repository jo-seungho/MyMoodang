// 비밀번호 이메일로 찾기
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
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.util.UUIDRandom;
import com.kh.user.member.model.vo.ExtraPwdResult;
import com.kh.user.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwdEmailCheck
 */
@WebServlet("/findPwdMailCheck.me")
public class AjaxMemberFindPwdEmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberFindPwdEmailCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		Member m = new Member();
		m.setName(name);
		m.setEmail(email);

		//
		int result = new MemberService().findPwdMember(m);

		String extraPwd = new UUIDRandom().extraPwd();
		ExtraPwdResult ex = new ExtraPwdResult();

		if(result > 0) { // 회원 정보 조회 됨

			int upResult = new MemberService().updateExtraPwd(extraPwd, m);


			if(upResult > 0) { // 임시비밀번호로 수정됨
				ex.setExtraPwd(extraPwd);
				ex.setSuccess("Y");
				ex.setMessage("입력하신 이메일로 임시비밀번호가 전송되었습니다. 이메일을 확인하세요.");
			} else { // 임시비밀번호로 수정안됨
				ex.setSuccess("N");
				ex.setMessage("임시비밀번호 전송에 실패했습니다.");
			}
		} else { // 회원 정보 조회 안 됨
			ex.setSuccess("N");
			ex.setMessage("입력하신 정보가 올바르지 않습니다.");
		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(ex, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
