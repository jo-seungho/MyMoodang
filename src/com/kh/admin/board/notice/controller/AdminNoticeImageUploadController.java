package com.kh.admin.board.notice.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/uploadFile")
public class AdminNoticeImageUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminNoticeImageUploadController() {}

	/**
	 * 이미지 업로드시 서버에 바로 이미지 저장하고 이미지 복호화 푸는 컨트롤러
	 * 2023-04-22 최명진
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
		String fileName = ""; // 파일명
		
		try{
	        // 파일업로드 및 업로드 후 파일명 가져옴
			MultipartRequest multi = new MultipartRequest(request, savePath, size, "utf-8", new MyFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String)files.nextElement(); 
			fileName = multi.getFilesystemName(file); 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		String uploadPath = "/resources/board_upfiles/" + fileName;
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("url", uploadPath);

		// Set the content type for the response
		response.setContentType("application/json; charset=UTF-8");

		// Convert the JsonObject to a JSON string using Gson
		String jsonResponse = new Gson().toJson(jsonObj);

		// Send the JSON response to the client
		response.getWriter().print(jsonResponse);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
