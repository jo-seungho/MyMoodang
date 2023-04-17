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

public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); // 세션 정보 가져오기


        // 세션 정보가 있고, 관리자 권한이 있는지 검증
        if (session != null && session.getAttribute("id") != null && session.getAttribute("id").equals("admin")) {
            chain.doFilter(request, response); // 다음 필터로 넘어가거나, 요청 처리
        } else {
            res.sendRedirect("/views/common/accessDenied.jsp"); // 관리자 권한이 없는 경우 접근 거부 페이지로 리다이렉트
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
}