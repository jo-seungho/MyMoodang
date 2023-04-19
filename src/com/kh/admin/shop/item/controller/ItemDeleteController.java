package com.kh.admin.shop.item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.shop.item.model.service.ItemService;


@WebServlet("/itemDelete.ad")
public class ItemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ItemDeleteController() {}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		String status = request.getParameter("status");
		
		int result = new ItemService().deleteItem(code, status);
		
		if(result > 0) { // 삭제 성공
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			response.sendRedirect("/itemList.ad?page=1&category=a");
		} else {
			request.setAttribute("alertMsg", "게시글 삭제에 실패했습니다.");
			response.sendRedirect("/itemList.ad?page=1&category=a");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
