// 공지사항 상세조회 컨트롤러 
// 2023-04-18 소현아
package com.kh.user.board.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.notice.model.service.NoticeService;
import com.kh.user.board.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/noticedetail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				// 글번호 뽑기
				int noticeNo = Integer.parseInt(request.getParameter("nno"));
				
				// System.out.println(boardNo);
				
				
				// 1. 조회수 증가
				int result = new NoticeService().increaseCount(noticeNo);
				
				// 2. 조회수 증가에 성공했다면 게시글 조회 (BOARD), 첨부파일 조회 (ATTACHMENT)
				if(result > 0) { // 조회수 증가 성공
					
				// 게시글 조회
				Notice n = new NoticeService().selectNotice(noticeNo);
					
				// 응답데이터 담기
				request.setAttribute("n", n);
					
				// 게시글 상세조회 페이지로 포워딩 
				request.getRequestDispatcher("views/board/notice_detail.jsp").forward(request, response);
					
				} else { // 에러페이지 포워딩
					
					request.setAttribute("errorMsg", "일반게시판 상세조회 실패");
					
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
