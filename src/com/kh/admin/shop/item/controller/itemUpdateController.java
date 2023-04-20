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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
