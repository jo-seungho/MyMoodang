package com.kh.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Converter;
import com.kh.admin.member.model.dao.MemberDao;
import com.kh.admin.member.model.service.MemberService;
import com.kh.admin.member.model.vo.Member;

//2023-04-14 최명진
//회원상세페이지에서 회원 정보 업데이트
@WebServlet("/updateMember.ad")
public class AdminUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminUpdateMemberController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String status = request.getParameter("status");
		String grade = Converter.convert(request.getParameter("grade"));

		Member m = new Member();
		m.setMemberNo(userNo);
		m.setStatus(status);
		m.setGradeNo(grade);
		
		int result = new MemberService().updateMemberAd(m);

		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			response.sendRedirect("/listMember.ad");
		} else {
			request.getSession().setAttribute("alertMsg", "회원 정보 수정에 실패했습니다.");
			response.sendRedirect("/listMember.ad");
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
