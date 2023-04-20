package com.kh.admin.board.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.board.notice.model.service.NoticeService;
import com.kh.admin.board.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeDetailController
 */
@WebServlet("/noticedetail.ad")
public class AdminNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 0. 인코딩 설정 (POST)
		request.setCharacterEncoding("UTF-8");
		
			
		
			int noticeNo = Integer.parseInt(request.getParameter("nno"));
			String noticeTitle = request.getParameter("title");
			String noticeContent = request.getParameter("content");
			
			
			Notice n = new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			
	
			int result = new NoticeService().updateNotice(n);
			
			// 결과값에 따른 응답 처리
			if(result > 0) { // 성공 => 해당 게시글의 상세조회 페이지로 url 재요청
				
				request.getSession().setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
				
				response.sendRedirect(request.getContextPath() + "/noticelist.ad?nno=" + noticeNo);
				
			} else { // 실패 => 에러페이지 포워딩
				
				request.setAttribute("errorMsg", "일반게시판 수정 실패");
				
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
