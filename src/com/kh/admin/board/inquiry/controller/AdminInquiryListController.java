// 1:1문의 리스트 조회용 컨트롤러
// 2023-04-21 소현아

package com.kh.admin.board.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.board.inquiry.model.service.InquiryService;
import com.kh.admin.board.inquiry.model.vo.Inquiry;
import com.kh.common.model.vo.PageInfo;

import com.kh.admin.board.inquiry.model.service.InquiryService;
import com.kh.admin.board.inquiry.model.vo.Inquiry;


/**
 * Servlet implementation class InquiryListController
 */
@WebServlet("/inquiryList.ad")
public class AdminInquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그인 유저의 회원 번호 조회
		// => 로그인 기능 구현되면 붙일 예정


		// 페이징 처리 하기!!
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new InquiryService().selectListCount();

		currentPage = Integer.parseInt((request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")));

		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/boardLimit);


		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;


		endPage = startPage + pageLimit - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Inquiry> list = new InquiryService().selectInquiryList(pi);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);


		request.getRequestDispatcher("views/admin/inquiry.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
