package admin.model;

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

import product.model.ProductVO;

public class AdminDAO implements InterAdminDAO{
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	   public AdminDAO() {
	   
	      try {
	          Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/myoracle5");
	      } catch (NamingException e) {
	         e.printStackTrace();
	      }   
	   }
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if(rs != null) { rs.close(); rs=null; }
			if(pstmt != null) { pstmt.close(); pstmt=null; } 
			if(conn != null) { conn.close(); conn=null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end of public void close() ---------------------------
	
	
	// 상품 검색, 조회
	@Override
	public List<ProductVO> getProductInfo(String prodName) throws SQLException {

		List<ProductVO> prodList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_status\n " + 
					"from habibi_product\n" + 
					"where prod_name like '%"+prodName+"%'";
	         
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        	
	        	String prod_code = rs.getString(1);
	        	String prod_category = rs.getString(2);
	        	String prod_name = rs.getString(3);
	        	int prod_cost = rs.getInt(4);
	        	int prod_price = rs.getInt(5);
	        	int prod_stock = rs.getInt(6);
	        	String prod_color = rs.getString(7);
	        	String prod_mtl = rs.getString(8);
	        	String prod_size = rs.getString(9);
	        	int prod_status = rs.getInt(10);
	        	
	        	ProductVO pvo = new ProductVO(prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_status);
		        
	        	prodList.add(pvo);

	        }
	        
	        
		} finally {
			close();
		}
		
		return prodList;
	}
	
	
	// 상품 등록
	@Override
	public int registerProduct(ProductVO pvo) throws SQLException {

		int result = 0;
		
		return result;
	}




	
	
}
