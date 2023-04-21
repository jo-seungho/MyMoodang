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

			int i = 0;
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(++i, startRow);
			pstmt.setInt(++i, endRow);

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
}
