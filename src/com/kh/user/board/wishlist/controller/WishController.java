package com.kh.user.board.wishlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.user.board.wishlist.model.service.WishListService;
import com.kh.user.member.model.vo.Member;


@WebServlet("/heart.wi")
public class WishController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WishController() { }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		String action = request.getParameter("action");
		WishListService wish = new WishListService();
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int mno = m.getMemberNo();

		if(action.equals("check")) { 
			int result = wish.checkFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}else if(action.equals("add")) {
			int result = wish.addFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}else if(action.equals("remove")) {
			int result = wish.deleteFavorite(code, mno);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
