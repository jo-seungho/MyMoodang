package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.MemberCommon;


@WebServlet("/updateMember.ad")
public class AdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminUpdateMemberController() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String grade = request.getParameter("grade");
		String status = request.getParameter("status");
		System.out.println(grade);
		System.out.println(status);
		MemberCommon.gender(gender);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
