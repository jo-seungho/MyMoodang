package com.kh.admin.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.model.service.AdminService;
import com.kh.admin.common.model.vo.AdminPage;


@WebServlet("/main.ad")
public class AdminMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMainPageController() {
    	
    	
    }

    /**
     * 어드민 메인페이지로 정보값 갖고 포워딩
     * 2023-04-22 최명진
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminPage page = new AdminService().adminInfo();

		if(page!= null) {
			request.setAttribute("mainPage", page);
			request.getRequestDispatcher("/views/admin/main.jsp").forward(request, response);

		} else {
			request.getSession().setAttribute("alertMsg", "메인페이지 조회에 실패하였습니다.");
			response.sendRedirect("/");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

	