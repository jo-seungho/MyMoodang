package com.kh.admin.board.inquiry.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.admin.board.inquiry.model.vo.Inquiry;


public class InquiryDao {

	private Properties prop = new Properties();

	public InquiryDao() {

		String fileName = InquiryDao.class.getResource("/sql/admin/inquiry/inquiry-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 1:1문의 리스트 조회수 메소드
	 * 2023-04-21 소현아
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql =prop.getProperty("selectListCount");

		try {
			
			pstmt = conn.prepareStatement(sql); 

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;

	}



	/**
	 * 1:1 문의 리스트 조회용 메소드
	 * 2023-04-21 소현아
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectInquiryList(Connection conn, PageInfo pi) {
		
		ArrayList<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectInquiryList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				 list.add(new Inquiry(rset.getInt("INQ_NO")
						        , rset.getString("INQUIRY_TYPE")
						        , rset.getString("MEMBER_ID")
						        , rset.getString("TITLE")
						        , rset.getString("DATE_CREATE")));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}
	
	/**
	 * 1:1문의 상세조회 메소드
	 * 2023-04-21 소현아
	 * @param conn
	 * @param inqNo
	 * @return
	 */
	public Inquiry selectInquiry(Connection conn, int inqNo) {
		
		Inquiry in = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquiryDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,inqNo);
			
			rset=pstmt.executeQuery();

			if(rset.next()) {
				
				in = new Inquiry(rset.getString("TITLE")	
						       , rset.getInt("INQ_NO")
						       , rset.getString("INQUIRY_TYPE")
						       , rset.getString("MEMBER_ID")
						       , rset.getString("DATE_CREATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return in;
	}
	
	
	public int insertInquiry(Connection conn, Inquiry in) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
	    String sql = prop.getProperty("insertInquiry");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,in.getTitle());
			pstmt.setString(2,in.getReplyContents());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
	    
	    return result;
		
		
		
		
	}

	/**
	 * 답변완료 게시글 구하기
	 * 2023-04-22 최명진
	 * @param conn
	 * @return
	 */
	public int selectInquiryCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectInquiryCount");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();	

			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;

	}

	/**
	 * 답변 미완료 게시글 구하기
	 * 2023-04-22 최명진
	 * @param conn
	 * @return
	 */
	public int selectNotInquiryCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectNotInquiryCount");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();	

			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;


	}
	
	
	
}
