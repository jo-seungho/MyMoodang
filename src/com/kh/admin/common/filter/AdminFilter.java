package com.kh.admin.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.member.model.vo.Member;
import com.kh.admin.member.model.vo.AdMember;

public class AdminFilter implements Filter {
	public static final String NAME = "name";
	public static final String CODE = "code";
	public static final String SEARCH = "search";
	public static final String VALUE = "value";
	public static final String CATEGORY = "category";

	/**
	 * 2023-04-20 최명진
	 * 어드민 접근 제한 필터
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession userSession = req.getSession();
		AdMember ad = null;
		
		
		if (userSession != null) { // 사용자 세션이 존재하는 경우
			Member m = (Member) userSession.getAttribute("loginUser"); // 사용자 멤버객체를 가져옴

			if (m != null) {
				HttpSession adminSession = req.getSession(true); // 관리자 세션을 생성함

				ad = new AdMember();
				ad.setBirthDate(m.getBirthDate());
				ad.setEmail(m.getEmail());
				ad.setEnrollDate(m.getEnrollDate());
				ad.setGender(m.getGender());
				ad.setGradeNo(m.getGradeNo());
				ad.setMemberId(m.getMemberId());
				ad.setMemberNo(m.getMemberNo());
				ad.setModifyDate(m.getModifyDate());
				ad.setName(m.getName());
				ad.setPassword(m.getPassword());
				ad.setPhone(m.getPhone());
				ad.setStatus(m.getStatus());
				ad.setTotalMoney(m.getTotalMoney());

				adminSession.setAttribute("adminUser", ad);
			}
		}

		if (ad != null && ad.getMemberId().equals("admin")) {

			chain.doFilter(request, response);

		} else {
			res.sendRedirect("/");
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	public boolean isNumeric(String str) {
		if (str == null) {
			return false;
		}
		try {
			int num = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}
}