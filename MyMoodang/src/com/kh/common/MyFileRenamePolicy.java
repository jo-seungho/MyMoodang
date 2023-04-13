package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

//내 입맛대로 파일명을 수정시키는 객체
public class MyFileRenamePolicy implements FileRenamePolicy {

	
	// 반드시  미완성된 rename 메소드를 오버라이딩 해야함 (반드시 구현해야 함)
	// 기존의 파일을 전달받아서 파일명 수정작업 후 수정된 파일 자체를 반환해주는 메소드
	@Override
	public File rename(File originFile) {
		//originFile : 원본 파일 객체
		
		// 원본파일명이 "aaa.jpg" 라면..
		String originName = originFile.getName(); // "aaa.jpg"
		
		// 수정파일명 : 파일업로드된시간(년월일시분초) + 5자리랜덤값(10000~99999)
		// 확장자명 : 원본파일의 확장자 그대로
		// => 파일명이 최대한 겹치지 않게
		
		//원본명 		-> 		수정명
		//aaa.jpg			20230406134025xxxxx.jpg
		
		// 1. 파일업로드된시간(년월일시분초) => String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //java.util.Date
		
		// 2. 5자리 랜덤값 (10000~ 99999) => int randNum;
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 3. 원본파일의확장자 => String ext;
		// .jpg, .png, .txt, .pdf, ...
		// =>파일명 중간에 .이 들어가는 경우도 있기 때문에
		// 항상 원본파일명에서 가장 맨 마지막의 .의 인덱스를 기준으로 파일명과 확장자명을 나눈다.
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 1 + 2 + 3
		String changeName = currentTime + ranNum + ext;
		
		
		return new File(originFile.getParent(), changeName);
		
		
		
	}
	
	
}
