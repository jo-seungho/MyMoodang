package com.kh.admin.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.member.model.vo.AdMember;
import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.item.model.vo.ItemImg;


@WebServlet("/itemDetail.ad")
public class ItemDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ItemDetailController() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemCode = Integer.parseInt(request.getParameter("code"));
		
		ItemService iService = new ItemService();
		
		Item item = iService.selectItem(itemCode);
		ArrayList<ItemImg> list = iService.selectImgList(itemCode);
		

		AdMember m = (AdMember) request.getSession().getAttribute("adminUser");
		
		int memberNo = m.getMemberNo();
		

		
		
		if(item != null) {
			
			request.setAttribute("item", item);
			request.setAttribute("list", list);
			
			request.setAttribute("memberNo", memberNo);
			
			request.getRequestDispatcher("views/admin/item_detail.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
