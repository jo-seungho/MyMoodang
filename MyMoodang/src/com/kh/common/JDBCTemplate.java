package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;



public class JDBCTemplate {
	
	// 1. Connection 객체 생성  (DB접속)
	public static Connection getConnection() {
		
		Properties prop = new Properties(); // Map 계열 컬렉션 (key+value)
		
		//읽어들이고자 하는 driver.properties 파일의 물리적인 경로 
		String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		
		try {
			prop.load(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Connection conn = null;

		//1 - 1. 드라이버 등록
		try {
			Class.forName(prop.getProperty("driver"));

			//2. Connection 객체 생성 (DB접속)
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//2. 전달받은 Connection 객체를 가지고 commit 해주는 메소드
	
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null & !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	//4. 전달받은 Connection 객체를 반납시켜주는 메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//5. 전달받은 Statement 객체를 반납시켜주는 메소드
	//=> 다형성을 이용하여 Statement, PreparedStatement, CallableStatement 모두 받을 수 있도록 처리
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//6. 전달받은 ResultSet 객체를 반납시켜주는 메소드
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
