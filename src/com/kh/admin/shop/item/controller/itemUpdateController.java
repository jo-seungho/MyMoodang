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
			ArrayList<ItemImg> originList = new ArrayList<ItemImg>();
			
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
			double discount = Double.parseDouble(multiRequest.getParameter("discount"))*0.01;
			String status = multiRequest.getParameter("status");
			String category = multiRequest.getParameter("category");
			
			ArrayList<ItemImg> list = new ArrayList<ItemImg>();
			Item it = new Item();
			
			it.setItemName(name);
			it.setItemStock(stock);
			it.setItemPrice(price);
			it.setItemText(text);
			it.setItemDiscount(discount);
			it.setItemStatus(status);
			it.setItemCategory(category);
			
			
			for (int i = 1; i <= 4; i++) {
	            String fileKey = "file" + i;
	            String nameKey = "name" + i;
	            String originalFileName = multiRequest.getOriginalFileName(fileKey);
	            if (originalFileName == null) {
	                continue; // 파일 업로드 안한 경우 건너뜀
	            }
	            String fileSystemName = multiRequest.getFilesystemName(fileKey);
	            File uploadedFile = new File(savePath + fileSystemName);
	            if (!uploadedFile.exists()) {
	                continue; // 업로드된 파일이 존재하지 않는 경우 건너뜀
	            }
	            String originalFileNames = multiRequest.getParameter(nameKey);
	            File originalFile = new File(savePath + originalFileNames);
	            if (originalFile.exists()) {
	                originalFile.delete(); // 기존 파일 삭제
	            }

	            ItemImg itemImg = new ItemImg();
	            itemImg.setItemImgPath(uploadedFile.getAbsolutePath());
	            itemImg.setItemImgLevel(i == 1 ? 1 : 2);
	            itemImg.setItemImgCode(code);
	            list.add(itemImg);
	            
	            
	            System.out.println(originalFileName);
	            System.out.println(originalFileNames);
	            System.out.println(itemImg);
	        }
			

//			int result = new ItemService().updateItem(code, it, list);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
