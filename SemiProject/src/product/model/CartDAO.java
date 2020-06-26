package product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class CartDAO implements InterCartDAO{
	private DataSource ds; 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	public CartDAO() {
	
		try {
		    Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle5");
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


	// 장바구니 불러오기
	@Override
	public List<CartVO> selectCartList() throws SQLException {

		List<CartVO> cartlist = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select cart_num,fk_userid,fk_prod_code,fk_prod_name,cart_stock,cart_date,cart_price " + 
					" from habibi_cart " + 
					" where fk_userid = 'admin' ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int cart_num = rs.getInt("cart_num");
				String fk_userid = rs.getString("fk_userid");
				String fk_prod_code = rs.getString("fk_prod_code");
				String fk_prod_name = rs.getString("fk_prod_name");
				int cart_stock = rs.getInt("cart_stock");
				String cart_date = rs.getString("cart_date");
				int cart_price = rs.getInt("cart_price");
			
				CartVO cvo = new CartVO(cart_num,fk_userid,fk_prod_code,fk_prod_name,cart_stock,cart_date,cart_price);
				
				cartlist.add(cvo);
			}
			
		} finally {
			close();
		}
		
		return cartlist;
	}
	
	

}
