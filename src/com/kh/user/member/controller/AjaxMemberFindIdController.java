package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.MemberFindId;

/**
 * Servlet implementation class AjaxMemberFindIdController
 */
@WebServlet("/findId.me")
public class AjaxMemberFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberFindIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		Member m = new Member( name, phone);

		Member fi = new MemberService().findId(m);	// 아이디 찾기 용

		MemberFindId findId = new MemberFindId();

		if(fi != null) { // 아이디 조회 됨
			findId.setSuccess("Y");
//			findId.setMessage("아이디 찾기에 성공하였습니다.");

		} else { // 조회되는 아이디가 없음
			findId.setSuccess("N");
			findId.setMessage("조회된 회원이 없습니다.");
		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(findId, response.getWriter());



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
