// 2023-04-15 김서영
// 회원 가입 컨트롤러

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
import com.kh.user.member.model.vo.ShippingAddress;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class AjaxMemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxMemberInsertController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 아이디, 비밀번호, 이름, 이메일, 휴대폰, 우편번호, 주소, 상세주소 (여기까지가 필수입력사항<=) / 성별, 생년월일, //이용약관 2개필수
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String name = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNumber");
		String zipcode = request.getParameter("zipCode");
		String shipAddr = request.getParameter("shipAddr");
		String shipAddrInfo = request.getParameter("shipAddrInfo");

		// ---------------------------------------------------------------------

		String gender = request.getParameter("gender");
		String birthDate = request.getParameter("birthDate");

		Member m = new Member(memberId, password, name, birthDate, gender, email, phone);
		ShippingAddress addr = new ShippingAddress(shipAddr, shipAddrInfo, phone, zipcode);

		int result = new MemberService().insertMember(m, addr);

		MemberRessult memberRessult = new MemberRessult();

		if (result > 0) { // 가입 성공
			memberRessult.setSuccess("Y");
			memberRessult.setMessage(m.getName() + "님의 회원가입에 성공했습니다. 환영합니다.");
			memberRessult.setMemberNo(m.getMemberNo());

		} else { // 가입 실패
			memberRessult.setSuccess("N");
			memberRessult.setMessage("회원가입에 실패했습니다.");
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(memberRessult, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
