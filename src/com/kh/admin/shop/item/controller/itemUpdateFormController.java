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
		
		List<ItemImg> filteredImages = list.stream()
                .filter(ItemImg -> ItemImg != null)
                .collect(Collectors.toList());
		
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i < filteredImages.size(); i++) {
		    sb.append("<img id=detailImg").append(i + 1)
		      .append(" src=\"").append(filteredImages.get(i).getItemImgPath())
		      .append("\" class=\"img-thumbnail\" style=\"width: 200px; height: 200px\" />");
		}
		for (int j = 0; j < list.size(); j++) {
		    String itemImg = list.get(j).getItemImgPath();
		    
		    // filteredImages에 이미지 파일명이 존재하면, 이미지 경로 생성하여 StringBuilder에 추가
		    if (filteredImages.contains(itemImg)) {
		        String imagePath = "/resources/item_upfiles/" + itemImg;
		        sb.append("<p class=\"div\" id=\"img").append(j).append("\" style=\"font-size: 13px\">")
		          .append(itemImg).append("</p>");
		    }
		}

		// StringBuilder에 저장된 문자열 출력
		String result = sb.toString();
		String imgTags = sb.toString();
		
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		request.setAttribute("img", imgTags);
		request.setAttribute("imgName", result);
		request.getRequestDispatcher("views/admin/item_update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
