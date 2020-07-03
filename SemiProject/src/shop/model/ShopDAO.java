package shop.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class ShopDAO implements InterShopDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ShopDAO() {
		try {
		    Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	public void close() {
		try {
			if(rs != null) { rs.close(); rs=null; }
			if(pstmt != null) { pstmt.close(); pstmt=null; } 
			if(conn != null) { conn.close(); conn=null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<HashMap<String, String>> selectStoreMap() throws SQLException {
		List<HashMap<String, String>> storeList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select storeID, storeName, storeUrl, storeImg, storeAddress, lat, lng, zindex " + 
					     " from shopping_map " + 
					     " order by zindex asc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> map = new HashMap<>();
				map.put("STOREID", rs.getString("STOREID"));
				map.put("STORENAME", rs.getString("STORENAME"));
				map.put("STOREURL", rs.getString("STOREURL"));
				map.put("STOREIMG", rs.getString("STOREIMG"));
				map.put("STOREADDRESS", rs.getString("STOREADDRESS"));
				map.put("LAT", rs.getString("LAT"));
				map.put("LNG", rs.getString("LNG"));
				map.put("ZINDEX", rs.getString("ZINDEX"));
								
				storeList.add(map); 
			}
			
		} finally {
			close();
		}
		
		return storeList;
	}

}
