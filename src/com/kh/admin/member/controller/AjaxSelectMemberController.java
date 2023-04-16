package com.kh.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;


@WebServlet("/selectMember.ad")
public class AjaxSelectMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//ajax를 통해 memberNo을 받아와서 처리해주는 컨트롤러
	//2023-04-14 최명진
    public AjaxSelectMemberController() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("userNo"));
		
		Member m = new MemberService().selectMemberAd(id);
		
		response.setContentType("application/json; charset=UTF-8");
		
		
		
		if(m != null) {
			new Gson().toJson(m, response.getWriter());
		} else {
			response.getWriter().print(0);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
