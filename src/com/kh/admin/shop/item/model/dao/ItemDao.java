package com.kh.admin.shop.item.model.dao;

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
import com.kh.admin.shop.item.model.vo.Item;
import com.kh.admin.shop.item.model.vo.ItemImg;

public class ItemDao {
	
	private Properties prop = new Properties();

	public ItemDao() {

		String fileName = ItemDao.class.getResource("/sql/admin/item/item-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** */
    public Item selectItem(Connection conn, int itemCode) {
        Item i = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectItem");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, itemCode);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                i = new Item();
                i.setItemCode(rset.getInt("ITEM_CODE"));
                i.setItem_hits(rset.getInt("ITEM_HITS"));
                i.setItemCategory(rset.getString("ITEM_CATEGORY"));
                i.setItemDiscount(rset.getDouble("ITEM_DISCOUNT"));
                i.setItemImg(rset.getString("ITEM_IMG_PATH"));
                i.setItemName(rset.getString("ITEM_NAME"));
                i.setItemPrice(rset.getInt("ITEM_PRICE"));
                i.setItemStock(rset.getInt("ITEM_STOCK"));
                i.setItemDate(rset.getString("ITEM_DATE"));
                i.setItemText(rset.getString("ITEM_TEXT"));
                i.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
                i.setItemStatus(rset.getString("ITEM_STATUS"));
                i.setDescription(rset.getString("DESCRIPTION"));
                
                i.setImgName(rset.getString("ITEM_IMG_PATH"));
               
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rset);
        	JDBCTemplate.close(pstmt);
        }
        
        return i;
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
				
				return listCount;
			}
    
    
	public int selectListSale(Connection conn, String category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectListSale");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
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
		
		return listCount;
	}


    
    /**
     * 어드민 상품관리 리스트 출력
     * 2023-04-15 최명진
     * @param conn
     * @param pi
     * @return
     */
	public ArrayList<Item> selectItemList(Connection conn, PageInfo pi) {
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectItemList");
		
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
				i.setItemImg(rset.getString("ITEM_IMG_PATH"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemStock(rset.getInt("ITEM_STOCK"));
				i.setItemPrice(rset.getInt("ITEM_PRICE"));
				i.setItemStatus(rset.getString("ITEM_STATUS"));
				i.setDescription(rset.getString("DESCRIPTION"));
				
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
	
	
	public ArrayList<Item> selectSaleItemList(Connection conn, PageInfo pi, String category) {
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectSaleItemList");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				Item i = new Item();
				
				i.setItemCode(rset.getInt("ITEM_CODE"));
				i.setItemDate(rset.getString("ITEM_DATE"));
				i.setItemImg(rset.getString("ITEM_IMG_PATH"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemStock(rset.getInt("ITEM_STOCK"));
				i.setItemPrice(rset.getInt("ITEM_PRICE"));
				i.setItemStatus(rset.getString("ITEM_STATUS"));
				i.setDescription(rset.getString("DESCRIPTION"));
				
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

	public int insertItem(Connection conn, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertItem");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getItemCategory());
			pstmt.setString(2, i.getItemName());
			pstmt.setInt(3, i.getItemStock());
			pstmt.setInt(4, i.getItemPrice());
			pstmt.setString(5, i.getItemText());
			pstmt.setDouble(6, i.getItemDiscount());
			
			pstmt.setString(7, i.getDescription());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	
	public int insertItemImg(Connection conn, ItemImg at) {
		int result = 0;
		// insert를 반복해서 진행 = > 하나라도 실패 할 경우 실패처리
		// result 를 애초에 1로 셋팅해두고 누적 곱을 구할 예정

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertItemImg");

		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, at.getItemImgLevel());
				pstmt.setString(2, at.getItemImgPath());

				result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	

	public int updateItem(Connection conn, int itemCode, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateItem");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, i.getItemCategory());
			pstmt.setString(2, i.getItemName());
			pstmt.setInt(3, i.getItemStock());
			pstmt.setInt(4, i.getItemPrice());
			pstmt.setString(5, i.getItemText());
			pstmt.setDouble(6, i.getItemDiscount());
			pstmt.setString(7, i.getItemStatus());
			
			pstmt.setString(8, i.getDescription());
			
			pstmt.setInt(9, itemCode);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}


		return result;
	}


	public ArrayList<ItemImg> selectImgList(Connection conn, int itemCode) {
		
		ArrayList<ItemImg> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectImgList");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemCode);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				ItemImg i = new ItemImg();
				
				i.setItemImgNo(rset.getInt("ITEM_IMG_NO"));
				i.setItemImgCode(rset.getInt("ITEM_IMG_CODE"));
				i.setItemImgLevel(rset.getInt("ITEM_IMG_LEVEL"));
				i.setItemImgPath(rset.getString("ITEM_IMG_PATH"));
				i.setItemImg(rset.getString("ITEM_IMG_PATH"));
				
				
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


	public int deleteItem(Connection conn, int code, String status) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteItem");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int checkFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				result = rset.getInt("COUNT");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int addFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("addFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteFavorite(Connection conn, int code, int mno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFavorite");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateItemImg(Connection conn, int itemCode, ItemImg at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateItemImg");
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getItemImgPath());
				pstmt.setInt(2, at.getItemImgLevel());
				pstmt.setInt(3, itemCode);
				
				result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//TOP 5 조회수 조회 2023-04-25 최명진
	public ArrayList<Item> selectTopItemList(Connection conn) {
		
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 2. 쿼리문 작성
		String sql = prop.getProperty("selectTopItemList");

		// 3. 쿼리문 실행
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				Item i = new Item();

				i.setItemCode(rset.getInt("ITEM_CODE"));
				i.setItemName(rset.getString("ITEM_NAME"));
				i.setItemStock(rset.getInt("ITEM_STOCK"));
				i.setItem_hits(rset.getInt("ITEM_HITS"));
				
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


	
	
 

}
