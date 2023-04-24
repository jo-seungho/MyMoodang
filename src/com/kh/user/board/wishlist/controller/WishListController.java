package com.kh.user.board.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.user.board.wishlist.model.service.WishListService;
import com.kh.user.board.wishlist.model.vo.WishList;
import com.kh.user.member.model.vo.Member;

@WebServlet("/wishList.wi")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WishListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("loginUser");
		if (m == null) {
			request.setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
			request.getRequestDispatcher("/").forward(request, response);
		} else {

			int id = m.getMemberNo();

			int listCount;
			int currentPage;
			int pageLimit;
			int boardLimit;

			int maxPage;
			int startPage;
			int endPage;

			listCount = new WishListService().selectListCount(id);

			currentPage = Integer.parseInt((request.getParameter("page") == null ? "1" : request.getParameter("page")));

			pageLimit = 10;
			boardLimit = 10;

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

			endPage = startPage + pageLimit - 1;

			if (endPage > maxPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

			ArrayList<WishList> list = new WishListService().selectWishList(pi, id);

			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.getRequestDispatcher("views/board/wishlist.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
