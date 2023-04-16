package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.shop.item.model.service.ItemService;
import com.kh.shop.item.model.vo.Item;

/**
 * 어드민 상품관리 컨트롤러
 * 
 * @author PC
 *
 */
@WebServlet("/itemList.ad")
public class AdminItemListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminItemListController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount; // 현재 총 게시글의 갯수
		int currentPage; // 현재 페이지 (즉, 사용자가 요청하는 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 페이지 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 (몇개 단위씩 끊어서 볼거냐)
		int maxPage; // 가장 마지막 페이지가 몇 번째 페이지인지 (즉, 총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수

		listCount = new ItemService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("page"));
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		pageLimit = 10;

		// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		ArrayList<Item> list = null;
		PageInfo pi = null;
		
		int enableCount = 5; 
		int unableCount = 3; 

		String category = request.getParameter("category");
		
		if (category.equals("a")) {
			pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, enableCount, unableCount);
			list = new ItemService().selectItemListAd(pi);
		} else if(category.equals("y")) {
			pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, enableCount, unableCount );
			list = new ItemService().selectItemListAd(pi);
		} else {
			pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, enableCount, unableCount);
			list = new ItemService().selectItemListAd(pi);
		}

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/admin/itemListView.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
