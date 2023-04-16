package com.kh.shop.item.controller;
// 2023-04-15 
// 조승호

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
 * Servlet implementation class itemListController
 */
@WebServlet("/itemList.it")
public class itemListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		int listCount; 		// 현재 총 게시글의 갯수
		int currentPage; 	// 현재 페이지 (즉, 사용자가 요청하는 페이지)
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 최대 페이지 갯수
		int boardLimit; 	// 한 페이지에 보여질 게시글의 최대 개수 (몇개 단위씩 끊어서 볼거냐)
		int maxPage; 		// 가장 마지막 페이지가 몇 번째 페이지인지 (즉, 총 페이지 수)
		int startPage; 		// 페이지 하단에 보여질 페이징바의 시작수
		int endPage; 		// 페이지 하단에 보여질 페이징바의 끝수
		
		listCount = new ItemService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		boardLimit = 9;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		 if(endPage > maxPage) {
			 endPage = maxPage;
		 }
		
		 PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
				  boardLimit, maxPage, startPage, endPage);
		
		 
		 ArrayList<Item> list = new ItemService().selectItemList(pi);
		 
		 String category = request.getParameter("category");
		 System.out.println(category);
		 
		 request.setAttribute("pi", pi);
		 request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/shop/itemList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
