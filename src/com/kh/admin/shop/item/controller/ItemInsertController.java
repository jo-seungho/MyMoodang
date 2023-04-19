package com.kh.admin.shop.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.shop.item.model.service.ItemService;
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.item.model.vo.ItemImg;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/itemInsert.ad")
public class ItemInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemInsertController() {
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

			String itemName = multiRequest.getParameter("itemName");
			int itemStock = Integer.parseInt(multiRequest.getParameter("itemStock"));
			int itemPrice = Integer.parseInt(multiRequest.getParameter("itemPrice"));
			
			String itemText = multiRequest.getParameter("itemText");

			int itemDiscount = 0;
			String itemDiscountParam = multiRequest.getParameter("itemDiscount");

			if (itemDiscountParam != null && !itemDiscountParam.trim().isEmpty()) {
			    itemDiscount = Integer.parseInt(itemDiscountParam);
			}

			// Filter에서 예외 처리
			try {
//			    chain.doFilter(request, response);
			} catch (NumberFormatException e) {
			    // 예외 처리 로직
			}
			
			String itemStatus = multiRequest.getParameter("itemStatus");
			String itemCategory = multiRequest.getParameter("itemCategory");

			Item i = new Item();
			i.setItemName(itemName);
			i.setItemStock(itemStock);
			i.setItemPrice(itemPrice);

			i.setItemText(itemText);
			i.setItemDiscount(itemDiscount * 0.01);
			i.setItemStatus(itemStatus);
			i.setItemCategory(itemCategory);

			ArrayList<ItemImg> list = new ArrayList<ItemImg>();

			for (int j = 1; j <= 4; j++) {
				String key = "file" + j;

				if (multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이 있을 경우
					// Attachment 객체를 생성하여 파일 정보를 담는다.
					ItemImg at = new ItemImg();

					at.setItemImgPath("/resources/item_upfiles/" + multiRequest.getFilesystemName(key));
					String a = at.getItemImgPath();

					// 파일 레벨 설정
					// 대표이미지는 1, 나머지는 2
					if (j == 1) {
						at.setItemImgLevel(1);
					} else {
						at.setItemImgLevel(2);
					}

					// Attachment 객체를 ArrayList에 추가
					list.add(at);
				}

			}

			int result = new ItemService().insertItem(i, list);

			if (result > 0) { // 성공

				request.getSession().setAttribute("alertMsg", "상품 추가 성공");

				response.sendRedirect("/itemList.ad?page=1&category=a");

			} else {

				request.getSession().setAttribute("alertMsg", "상품 추가 실패");

				response.sendRedirect("/itemList.ad?page=1&category=a");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
