package com.kh.admin.shop.item.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;


@WebServlet("/itemDetail.ad")
public class ItemDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ItemDetailController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemCode = Integer.parseInt(request.getParameter("code"));
		
		Item item = new ItemService().selectItem(itemCode);
		
		if(item != null) {
			
			request.setAttribute("item", item);
			
			request.getRequestDispatcher("views/admin/item_detail.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
