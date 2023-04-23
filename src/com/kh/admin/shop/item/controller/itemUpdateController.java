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
		
		
		int maxSize = 1024 * 1024 * 10;

		// 1_3. 파일 저장 경로(resources/thumbnail_upfiles)
		String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");

		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new MyFileRenamePolicy());
		
		String[] fileNamed = multiRequest.getParameterValues("names");
		int code = Integer.parseInt(multiRequest.getParameter("code"));
		
		ArrayList<ItemImg> list = new ItemService().selectImgList(code);
		
		
//		for(ItemImg img : list) {
//			System.out.println(img.getItemImgPath().substring(img.getItemImgPath().lastIndexOf("/") + 1));
//		}
		
		 Enumeration<String> fileNames = multiRequest.getFileNames();
	        while (fileNames.hasMoreElements()) {
	        	String fileName = fileNames.nextElement();
	        	 String originalFileName = multiRequest.getOriginalFileName(fileName);
	             String fileSystemName = multiRequest.getFilesystemName(fileName);
	             String contentType = multiRequest.getContentType(fileName);
//	             File file = multiRequest.getFile(fileName); 파일을 올리는 메소드임
	        	
	        	System.out.println("있었던 파일 이름 : " + fileNamed);
	        }
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
