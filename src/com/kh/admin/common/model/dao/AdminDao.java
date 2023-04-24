package com.kh.admin.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.admin.common.model.vo.AdminPage;
import static com.kh.common.JDBCTemplate.*;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {

		String fileName = AdminDao.class.getResource("/sql/admin/main/main-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 어드민 페이지 메인 대쉬보드에 필요한 정보들을 표시하는 메소드
	 * 2023-04-22 최명진
	 * @param conn
	 * @return
	 */
	public AdminPage adminInfo(Connection conn) {

		AdminPage statistics = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("adminInfo");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			statistics = new AdminPage();

			while (rset.next()) {

				String type = rset.getString("type");
				int count = rset.getInt("count");

				switch (type) {
				case "inquiry_null_count":
					statistics.setInquiryNullCount(count);
					break;
				case "inquiry_not_null_count":
					statistics.setInquiryNotNullCount(count);
					break;
				case "total_member_count":
					statistics.setTotalMemberCount(count);
					break;
				case "total_payment_amount":
					statistics.setTotalPaymentAmount(count);
					break;
				case "M":
					statistics.setMaleCount(count);
					break;
				case "F":
					statistics.setFemaleCount(count);
					break;
				case "N":
					statistics.setUncheckedCount(count);
					break;
				case "기타":
					statistics.setEtc(count);
					break;
				case "단백질":
					statistics.setProtein(count);
					break;
				case "도시락":
					statistics.setLunch(count);
					break;
				case "무가당":
					statistics.setNoSugar(count);
					break;
				case "제로음료":
					statistics.setZero(count);
					break;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return statistics;

	}

}
