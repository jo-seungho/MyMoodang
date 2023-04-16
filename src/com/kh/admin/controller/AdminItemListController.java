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

		int listCount; // 현재 총 게시글 수
		int currentPage; // 현재 페이지 (즉, 요청한 페이지)
		int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 수
		int boardLimit; // 한 페이지 내에 보여질 게시글 최대 수
		int maxPage; // 전체 페이지들 중에서의 가장 마지막 페이지 (즉, 총 페이지 수)
		int startPage; // 현재 페이지에 하단에 보여질 페이징 바의 시작 수 => 18페이지라면 11, 28페이지라면 21
		int endPage; // 현재 페이지에 하단에 보여질 페이징 바의 끝 수 => 18페이지라면 20, 28페이지라면 30

		listCount = new ItemService().selectListCount();
	
		// * currentPage = 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		// * pageLimit = 한 페이지 하단에 보여질 페이지 최대 수
		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Item> list = new ItemService().selectItemListAd(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/itemListView.jsp").forward(request, response);

		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
