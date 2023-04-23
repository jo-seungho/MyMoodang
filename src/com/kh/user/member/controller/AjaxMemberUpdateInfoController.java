// 내정보 수정용 컨트롤러
// 2023-04-20 김서영

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
import com.kh.user.member.model.vo.MemberRessult;

/**
 * Servlet implementation class AjaxMemberUpdateInfoController
 */
@WebServlet("/updateInfo.me")
public class AjaxMemberUpdateInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberUpdateInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Member m = new Member(memberId, name, birthDate, gender, email, phone);
//		System.out.println("값이 들어갔는가" + m);

		int result = new MemberService().updateInfoMember(m);

		MemberRessult mr = new MemberRessult();

		if(result > 0) { // 성공

			Member newMem = new Member(m.getMemberId(), m.getName(), m.getBirthDate(), m.getGender(), m.getEmail(), m.getPhone());

			mr.setMessage(m.getName() + "님의 정보가 성공적으로 수정 되었습니다.");
			mr.setSuccess("Y");
			mr.setMemberId(memberId);
		} else { // 실패
			mr.setMessage(m.getName() + "님의 정보수정에 실패하였습니다.");
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
