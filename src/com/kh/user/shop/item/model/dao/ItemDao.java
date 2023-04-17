package com.kh.user.shop.item.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.shop.item.model.vo.Attachment;
import com.kh.user.shop.item.model.vo.Item;

public class ItemDao {
	
	private Properties prop = new Properties();

	public ItemDao() {

		String fileName = ItemDao.class.getResource("/sql/item/item-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//-------------------------------------------------------------------------------------------------


	/**
     * 상품 상세보기에서 조회수 증가
     * 2023-04-16 이태화
     * @param itemcode
	 * @param conn
     * @return
     */
    public int increaseCount(Connection conn, int itemcode) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("increaseCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, itemcode);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
	/**
     * 상품 상세보기
     * 2023-04-16 이태화
     * @param itemcode
	 * @param conn
     * @return
     */
    public Item selectItem(Connection conn, int itemcode) {
        Item i = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectItem");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, itemcode);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                i = new Item();

            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rset);
        	JDBCTemplate.close(pstmt);
        }
        
        return i;
    }
    
	/**
     * 상품 상세보기에서 이미지 조회
     * 2023-04-16 이태화
     * @param itemcode
	 * @param conn
     * @return
     */
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int itemcode) {

		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemcode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();

				
				at.setItemImage(rset.getString("ITEM_IMAGE"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
    
    
    
    
    
//	-----------------------어드민-------------------------------
    /**
     * 상품관리에서 총 상품 갯수 조회
     * 2023-04-15 최명진
     * @param conn
     * @return
     */
    public int selectListCount(Connection conn) {
		// SELECT 문 => ResultSet (1행1열, 단일값, 숫자값) => int

				// 1. 필요한 변수들 먼저 셋팅
				int listCount = 0;
				PreparedStatement pstmt = null;
				ResultSet rset = null;

				// 2. 쿼리문 작성
				String sql = prop.getProperty("selectListCount");

				// 3. 쿼리문 실행
				try {
					pstmt = conn.prepareStatement(sql);
					rset = pstmt.executeQuery();

					if (rset.next()) {
						listCount = rset.getInt("COUNT");
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				System.out.println(listCount);
				return listCount;
			}

    
    /**
     * 어드민 상품관리 리스트 출력
     * 2023-04-15 최명진
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectItemListAd(Connection conn, PageInfo pi) {
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectItemListAd");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				Item i = new Item();
				
				i.setItemCode(rset.getInt("ITEM_CODE"));
				i.setItemDate(rset.getString("ITEM_DATE"));
				i.setItemImg(rset.getString("ITEM_IMAGE"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemStock(rset.getInt("ITEM_STOCK"));
				i.setItemPrice(rset.getInt("ITEM_PRICE"));
				i.setItemStatus(rset.getString("ITEM_STATUS"));
				
				list.add(i);
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
     * 전체 상품 리스트 조회
     * 2023-04-16 조승호
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectItemList(Connection conn, PageInfo pi) {
		
		ArrayList<Item> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						  rset.getInt("ITEM_CODE")
						, rset.getString("ITEM_DATE")
						, rset.getString("ITEM_CATEGORY")
						, rset.getString("ITEM_IMAGE")
						, rset.getString("ITEM_NAME")
						, rset.getString("ITEM_TEXT")
						, rset.getInt("ITEM_STOCK")
						, rset.getInt("ITEM_PRICE")
						, rset.getInt("ITEM_HITS")
						, rset.getString("ITEM_STATUS")
						));
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