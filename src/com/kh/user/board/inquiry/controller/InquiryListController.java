// 1:1문의 리스트 조회용 컨트롤러
// 2023-04-17 김서영

package com.kh.user.board.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.inquiry.model.service.InquiryService;
import com.kh.user.board.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryListController
 */
@WebServlet("/list.in")
public class InquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryListController() {
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

//		System.out.println(request.getParameter("currentPage") + "현재페이지");
		currentPage = Integer.parseInt((request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")));
//		System.out.println(currentPage + "두재페이지");

		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int)Math.ceil((double)listCount/boardLimit);

//		System.out.println(maxPage);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

//		System.out.println(startPage);

		endPage = startPage + pageLimit - 1;

//		System.out.println(endPage);

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Inquiry> list = new InquiryService().selectList(pi);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

//		list.stream().forEach(System.out::println);

		request.getRequestDispatcher("views/board/one.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
