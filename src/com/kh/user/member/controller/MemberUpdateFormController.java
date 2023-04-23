// 2023-04-17 김서영

package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

/**
 * Servlet implementation class MemberEditInfoController
 */
@WebServlet("/updateForm.me")
public class MemberUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateFormController() {
        super();
        // TODO Auto-generated constructor stubs
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String password = request.getParameter("pwdCheck");

		Member m = new MemberService().selectMemberInfo(memberId);

//		System.out.println("로그인 한 사람 나와라" + m);

		request.getRequestDispatcher("views/member/edit_my_info.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
