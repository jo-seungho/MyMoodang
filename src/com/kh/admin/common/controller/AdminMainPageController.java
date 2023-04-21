package com.kh.admin.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.inquiry.model.service.InquiryService;
import com.kh.user.member.model.vo.Member;


@WebServlet("/main.ad")
public class AdminMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminMainPageController() {
    	
    	
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		SELECT COUNT(*) FROM INQUIRY
//		WHERE REPLY_CONTENTS IS NULL;
//		
//		int count = new InquiryService().selectListCount();
//
//		SELECT COUNT(*) FROM INQUIRY
//		WHERE REPLY_CONTENTS IS NOT NULL;
//
//		SELECT SUM(TOTAL_MONEY) FROM MEMBER
//		ORDER BY TOTAL_MONEY;
//
//		SELECT COUNT(*) FROM MEMBER;
		
		
		
		
		
		
		
		request.getRequestDispatcher("/views/admin/main.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

	