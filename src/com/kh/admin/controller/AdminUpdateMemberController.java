package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.Gender;
import com.kh.admin.common.Grade;
import com.kh.admin.common.Status;
import com.kh.member.model.vo.Member;

//2023-04-14 최명진
//회원상세페이지에서 회원 정보 업데이트
@WebServlet("/updateMember.ad")
public class AdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminUpdateMemberController() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String status = Status.getStatusCode(request.getParameter("status"));
		String gender = Gender.getGenderCode(request.getParameter("gender"));
		String grade = Grade.getMemberGradeCode(request.getParameter("grade"));

		Member m = new Member();
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
