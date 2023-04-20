// 공지사항 삭제 컨트롤러
// 2023-04-20 소현아

package com.kh.admin.board.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminNoticeDeleteController
 */
@WebServlet("/noticedelete.ad")
public class AdminNoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
				int noticeNo = Integer.parseInt(request.getParameter("nno")); 
				
		
				int result = new NoticeService().deleteNotice(noticeNo);
				
				
				if(result > 0) { // 성공
					
					request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다.");
					
					response.sendRedirect("/noticelist.ad?currentPage=1");
					
				} else { // 실패 => 에러페이지 포워딩
					
					request.setAttribute("errorMsg", "공지사항 삭제 실패");
					
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
