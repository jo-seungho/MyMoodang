// 공지사항 수정용 컨트롤러
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
 * Servlet implementation class AdminNoticeDetailController
 */
@WebServlet("/noticeUpdate.ad")
public class AdminNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateController() {
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
				
				request.getSession().setAttribute("alertMsg", "공지사항이 성공적으로 수정되었습니다.");
				
				response.sendRedirect(request.getContextPath() + "/noticeForm.ad?nno=" + noticeNo);
				
			} else { // 실패 => 에러페이지 포워딩
				
				request.setAttribute("errorMsg", "공지사항 수정 실패");
				
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
