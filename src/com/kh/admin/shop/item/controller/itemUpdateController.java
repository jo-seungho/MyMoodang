package com.kh.admin.shop.item.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/item_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			ArrayList<ItemImg> list = new ArrayList<ItemImg>();
			
			for (int i = 1; i <= 4; i++) {
				String key = "file" + i;
				if (multiRequest.getOriginalFileName(key) != null) {
					ItemImg img = new ItemImg();
				}
			}
		}
		
		//1. ==null인 경우 (사진안바꿈. 그대로 유지) else { 사진 한개라도 바뀜. 반복문으로 각 사진의 이름을 구해옴.
		// multiRequest.getOriginalFileName(key) != null) 을 통해 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
