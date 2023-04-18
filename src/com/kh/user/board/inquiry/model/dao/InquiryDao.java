package com.kh.user.board.inquiry.model.dao;

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
import com.kh.user.board.inquiry.model.vo.Inquiry;


public class InquiryDao {

	private Properties prop = new Properties();

	public InquiryDao() {

		String fileName = InquiryDao.class.getResource("/sql/user/Inquiry/inquiry-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}





	/**
	 * 로그인 유저의 1:1문의 리스트 조회 용 메소드
	 * 2023-04-17 김서영
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String sql =prop.getProperty("selectListCount");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(++i, 6);   // 로그인 기능이 구현되지 않았으므로 임시로 6번 회원만의 리스트 조회함

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("CNT");
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
	 * 2023-04-17 김서영
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectList(Connection conn, PageInfo pi) {

		ArrayList<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);

			int i = 0;
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			System.out.println(startRow);
			System.out.println(endRow);

			pstmt.setInt(++i, startRow);
			pstmt.setInt(++i, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				Inquiry in = new Inquiry();
				in.setInqNo(rset.getInt("INQ_NO"));
				in.setInquiryType(rset.getString("INQUIRY_TYPE"));
				in.setTitle(rset.getString("TITLE"));
				in.setDateCreate(rset.getString("DATE_CREATE"));
				in.setDescription(rset.getString("DESCRIPTION"));
				in.setReplyContents(rset.getString("REPLY_CONTENTS"));
				in.setReplyDate(rset.getString("REPLY_DATE"));

				list.add(in);
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
	 * 1:1 문의 작성 용 메소드
	 * => 회원가입 된 회원의 번호 추가 해야 함!!
	 * 2023-04-18 김서영
	 * @param conn
	 * @param in
	 * @return
	 */
	public int insertInquiry(Connection conn, Inquiry in) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertInquiry");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, in.getTitle());
			pstmt.setString(++i, in.getDescription());
			pstmt.setString(++i, in.getInquiryType());
			pstmt.setInt(++i, 6);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
