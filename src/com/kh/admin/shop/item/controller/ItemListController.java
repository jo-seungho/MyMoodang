package com.kh.admin.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.common.model.vo.AdminPageInfo;

import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;

/**
 * 어드민 상품관리 컨트롤러
 * 
 * @author PC
 *
 */
@WebServlet("/itemList.ad")
public class ItemListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemListController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount = new ItemService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("page"));

		ArrayList<Item> list = null;

		String category = request.getParameter("category").toUpperCase();

		int saleCount = new ItemService().selectListSale("Y");
		int soldCount = new ItemService().selectListSale("N");

		AdminPageInfo pi = null;

		if (category.equals("A")) {
			pi = calculatePage(listCount, currentPage, listCount, saleCount, soldCount);
			list = new ItemService().selectItemList(pi);
		} else if (category.equals("Y")) {
			pi = calculatePage(saleCount, currentPage, listCount, saleCount, soldCount);
			list = new ItemService().selectSaleItemList(pi, category);
		} else if (category.equals("N")) {
			pi = calculatePage(soldCount, currentPage, listCount, saleCount, soldCount);
			list = new ItemService().selectSaleItemList(pi, category);
		}

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/admin/itemListView.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public AdminPageInfo calculatePage(int currentCount, int currentPage, int totalCount, int saleCount,
			int soldCount) {
		int pageLimit = 10;

		int boardLimit = 10;

		int maxPage = (int) Math.ceil((double) currentCount / boardLimit);

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		return new AdminPageInfo(currentCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage,
				totalCount, saleCount, soldCount);

	}

}
