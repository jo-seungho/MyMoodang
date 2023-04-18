// 공지사항 리스트 조회용 컨트롤러
// 2023-04-14 소현아

package com.kh.admin.board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.board.notice.model.service.NoticeService;
import com.kh.admin.board.notice.model.vo.Notice;
import com.kh.common.model.vo.PageInfo;


/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/noticelist.ad")
public class AdminNoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 현재 총 게시글의 갯수
		int currentPage; // 현재 페이지 (즉, 사용자가 요청하는 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 페이지 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 (몇개 단위씩 끊어서 볼거냐)
		
		int maxPage; // 가장 마지막 페이지가 몇번째페이지인지 (즉, 총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		// * listCount : 총 게시글 갯수 (삭제된 게시글은 제외하고 카운트)
		listCount = new NoticeService().selectListCount();
		
		// System.out.println(listCount); // 107
		
		// * currentPage : 현재페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // "1" -> 1
		
		// System.out.println(currentPage);
		
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		//				 (페이지 목록들을 몇개씩 보여지게 할거냐)
		pageLimit = 10;
		boardLimit = 10;
		

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
								   boardLimit, maxPage, startPage, endPage);
			
		ArrayList<Notice> list = new NoticeService().selectNoticeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		// 응답페이지 포워딩
		request.getRequestDispatcher("views/admin/notice.jsp").forward(request, response);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
