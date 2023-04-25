package com.kh.admin.shop.item.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.item.model.vo.ItemImg;
import com.kh.common.MyFileRenamePolicy;
import com.kh.user.shop.item.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/itemUpdate.ad")
public class itemUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public itemUpdateController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		

		if (ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 전송 파일 용량 제한 : 10Mbyte로 제한한다면
			int maxSize = 1024 * 1024 * 10;

			// 1_3. 파일 저장 경로(resources/thumbnail_upfiles)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			int code = Integer.parseInt(multiRequest.getParameter("code"));
			String name = multiRequest.getParameter("name");
			int stock = Integer.parseInt(multiRequest.getParameter("stock"));
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String text = multiRequest.getParameter("text");
			String content = multiRequest.getParameter("content");
			double discount = Double.parseDouble(multiRequest.getParameter("discount"))*0.01;
			String status = multiRequest.getParameter("status");
			String category = multiRequest.getParameter("category");
			
			Item it = new Item();
			
			it.setItemName(name);
			it.setItemStock(stock);
			it.setItemPrice(price);
			it.setItemText(text);
			it.setDescription(content);
			it.setItemDiscount(discount);
			it.setItemStatus(status);
			it.setItemCategory(category);
			
			String key = "file1";
			
			ItemImg at = null;
			
			if (multiRequest.getOriginalFileName(key) != null) {
				// 첨부파일이 있을 경우
				// Attachment 객체를 생성하여 파일 정보를 담는다.
				at = new ItemImg();

				at.setItemImgPath("/resources/item_upfiles/" + multiRequest.getFilesystemName(key));
							
				at.setItemImgLevel(1);
				
			}
			
			int result = new ItemService().updateItem(code, at, it);
			
			
			if (result > 0) { // 성공

				request.getSession().setAttribute("alertMsg", "상품 수정 성공");

				response.sendRedirect("/itemList.ad?page=1&category=a");

			} else {

				request.getSession().setAttribute("alertMsg", "상품 수정 실패");

				response.sendRedirect("/itemList.ad?page=1&category=a");
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
