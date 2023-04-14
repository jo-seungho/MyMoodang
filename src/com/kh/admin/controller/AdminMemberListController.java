package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

// 2023-04-14 최명진
// 회원관리 페이지에서 회원 리스트 불러오는 컨트롤러
@WebServlet("/listMember.ad")
public class AdminMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminMemberListController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Member> list = new MemberService().selectMemberList();

		request.setAttribute("list", list);

		request.getRequestDispatcher("views/admin/memberListView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
