package com.kh.user.shop.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.member.model.vo.Member;
import com.kh.user.shop.order.model.service.OrderService;
import com.kh.user.shop.order.model.vo.OrderImg;
import com.kh.user.shop.order.model.vo.OrderList;

/**
 * Servlet implementation class ItemOrderListController
 */
@WebServlet("/orderList.it")
public class ItemOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemOrderListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");

		if(loginUser != null) {
//		 로그인 유저의 회원 번호 조회
//		 => 로그인 기능 구현되면 붙일 예정
		int memberNo = loginUser.getMemberNo();

		// 페이징 처리 하기!!
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new OrderService().selectListCount(memberNo);

//				System.out.println(request.getParameter("currentPage") + "현재페이지");
		currentPage = Integer.parseInt((request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")));
//				System.out.println(currentPage + "두재페이지");

		pageLimit = 10;
		boardLimit = 3;

		maxPage = (int)Math.ceil((double)listCount/boardLimit);

//				System.out.println(maxPage);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

//				System.out.println(startPage);

		endPage = startPage + pageLimit - 1;

//				System.out.println(endPage);

		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<OrderList> list = new OrderService().selectList(pi, memberNo);

		// 첨부 이미지
		OrderImg img = new OrderService().maxImgSelect(memberNo);

		//////////////////////////////

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("img", img);

//				list.stream().forEach(System.out::println);

		request.getRequestDispatcher("views/shop/order_list.jsp").forward(request, response);

		} else {
			request.getRequestDispatcher("views/common/error500.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
