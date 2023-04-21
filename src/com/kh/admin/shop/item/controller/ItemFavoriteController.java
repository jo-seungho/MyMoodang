package com.kh.admin.shop.item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.member.model.vo.AdMember;
import com.kh.admin.shop.item.model.service.ItemService;


@WebServlet("/heart.ad")
public class ItemFavoriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemFavoriteController() { }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		String action = request.getParameter("action");
		ItemService item = new ItemService();
		AdMember m = (AdMember) request.getSession().getAttribute("adminUser");
		int mno = m.getMemberNo();

		if(action.equals("check")) { 
			int result = item.checkFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}else if(action.equals("add")) {
			int result = item.addFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}else if(action.equals("remove")) {
			int result = item.deleteFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
