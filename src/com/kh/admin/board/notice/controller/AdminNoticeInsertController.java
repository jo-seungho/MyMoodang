// 관리자 공지사항 작성하기 컨트롤러
// 2023-04-20 소현아

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
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/noticeInsert.ad")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().insertNotice(n);
		
		// 4. 결과에 따른 응답페이지 지정
		if(result > 0) { // 성공 => 공지사항 리스트 (/jsp/list.no) 로 url 재요청
			
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			response.sendRedirect("/noticelist.ad?currentPage=1");
			
		} else { // 실패 => 에러페이지 응답
			
			request.setAttribute("errorMsg", "공지사항 등록 실패");
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
