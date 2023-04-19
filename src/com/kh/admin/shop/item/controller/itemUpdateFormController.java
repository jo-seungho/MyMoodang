package com.kh.admin.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.item.model.vo.ItemImg;


@WebServlet("/upItemForm.ad")
public class itemUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public itemUpdateFormController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int itemCode = Integer.parseInt(request.getParameter("code"));
		
		ItemService iService = new ItemService();
		
		Item item = iService.selectItem(itemCode);
		ArrayList<ItemImg> list = iService.selectImgList(itemCode);
		
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		
		request.getRequestDispatcher("views/admin/item_update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
