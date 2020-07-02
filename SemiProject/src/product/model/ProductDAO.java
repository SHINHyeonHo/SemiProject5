package product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO implements InterProductDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	   public ProductDAO() {
	   
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
	
	
	
	// 제품 정보
	@Override
	public List<ProductVO> getProductList(String category, String prodCode, int page) throws SQLException {
		
		String newProd = "";
		if("new".equalsIgnoreCase(category)) {
			
			category = "";
			newProd = " and (sysdate - prod_insert_date) < 10 ";
		}
		
		List<ProductVO> prodList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_new_date, order_sum from ( " + 
					"                  select rownum NUM, P.* " + 
					"                  from ( " + 
					"                      select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, sysdate - prod_insert_date as prod_new_date, nvl(order_sum,0) as order_sum " + 
					"                      from (select * from habibi_product " + 
					"                      where prod_status = 1 and prod_code like '%"+prodCode+"%' and prod_category like '%"+category+"%' "+newProd+"" + 
					"                      )" + 
					"                        left outer join view_order_sum " + 
					"                            on fk_prod_code = prod_code " + 
					"                      order by prod_stock desc, prod_insert_date desc " +
					"                      ) P " + 
					"              ) " + 
					"where NUM between ? and ?";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, 1+(page-1)*16);
	        pstmt.setInt(2, page*16);
	         
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
	        	int prod_new_date = rs.getInt(10);
	        	int order_sum = rs.getInt(11);
	        	
	        	ProductVO pvo = new ProductVO(prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, 1, prod_new_date, order_sum);
		        
	        	prodList.add(pvo);

	        }
	        
	        
		} finally {
			close();
		}

		
		return prodList;
	}
	
	
	// best 제품 정보
	@Override
	public List<ProductVO> prodBestList(String category) throws SQLException {
		
		List<ProductVO> prodBestList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select prod_code, prod_category, prod_name, prod_price, prod_color, order_sum\n" + 
					"from (\n" + 
					"  select prod_code, prod_category, prod_name, prod_price, prod_color, nvl(order_sum,0) as order_sum\n" + 
					"  from (select * from habibi_product\n" + 
					"  where prod_status = 1 and prod_category like '%"+category+"%' and prod_stock != 0\n" + 
					"  )\n" + 
					"    left outer join view_order_sum\n" + 
					"        on fk_prod_code = prod_code\n" + 
					"  order by order_sum desc\n" + 
					"  )";
			
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        	
	        	String prod_code = rs.getString(1);
	        	String prod_category = rs.getString(2);
	        	String prod_name = rs.getString(3);
	        	int prod_price = rs.getInt(4);
	        	String prod_color = rs.getString(5);
	        	int order_sum = rs.getInt(6);
	        	
	        	ProductVO pvo = new ProductVO();
	        	pvo.setProd_code(prod_code);
	        	pvo.setProd_category(prod_category);
	        	pvo.setProd_name(prod_name);
	        	pvo.setProd_price(prod_price);
	        	pvo.setProd_color(prod_color);
	        	pvo.setOrder_sum(order_sum);
	        	
	        	prodBestList.add(pvo);

	        }
	        
	        
		} finally {
			close();
		}

		
		return prodBestList;
	}
	
	
	
	
	
	
	// 제품 개수 
	@Override
	public int getProductCount(String category) throws SQLException {

		int count = 0;
		
		String newProd = "";
		if("new".equalsIgnoreCase(category)) {
			
			category = "";
			newProd = " and (sysdate - prod_insert_date) < 10 ";
		}
		
		try {
			conn = ds.getConnection();

			String sql = "select count(*) COUNT from habibi_product " + 
						 " where prod_status = 1 and prod_category like '%"+category+"%' "+newProd+"";
			
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) 
	        	count = rs.getInt(1);
	        
		} finally {
			close();
		}

		return count;
	}

	
	// 로그인 되어진 회원의 장바구니 정보가져오기
	@Override
	public List<CartVO> selectCartList(String userid) throws SQLException {
		
		List<CartVO> cartList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select cart_num,fk_userid,fk_prod_code,cart_stock,prod_name,prod_price,prod_category "+
						 " from habibi_cart A join habibi_product B "+
						 " on A.fk_prod_code = B.prod_code "+
						 " where fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, userid);
			
	        rs = pstmt.executeQuery();
	         
	        int cnt = 0;
	        
	        while(rs.next()) {
	        	cnt++;
	        	
	        	if(cnt==1) {
	        		cartList = new ArrayList<CartVO>();
	        	}
	        	
	        	int cart_num = rs.getInt("cart_num");
	        	String fk_userid = rs.getString("fk_userid");
	        	String fk_prod_code = rs.getString("fk_prod_code");
	        	int cart_stock = rs.getInt("cart_stock");
	        	String prod_name = rs.getString("prod_name");
	        	int prod_price = rs.getInt("prod_price");
	        	String prod_category = rs.getString("prod_category");
	        	
	        	ProductVO prod = new ProductVO();
	        	prod.setProd_name(prod_name);
	        	prod.setProd_price(prod_price);
	        	prod.setProd_category(prod_category);
	        	  	
	        	prod.setTotalPriceTotalPoint(cart_stock);
	        	
	        	CartVO cvo = new CartVO();
	        	
	        	cvo.setCart_num(cart_num);
	        	cvo.setFk_userid(fk_userid);
	        	cvo.setFk_prod_code(fk_prod_code);
	        	cvo.setCart_stock(cart_stock);
	        	cvo.setProd(prod);
	        	
	        	cartList.add(cvo);
	        }
	        
			
		} finally {
			close();
		}
		
		
		return cartList;
	}

	
	// 로그인한 사용자의 장바구니에 담긴 주문총액 합계 조회하기
	@Override
	public HashMap<String, String> selectCartSumPricePoint(String userid) throws SQLException {
		
		HashMap<String, String> sumMap = new HashMap<String, String>();
	      
	      try {
	         
	         conn = ds.getConnection();
	         
	         String sql = "select nvl(sum(cart_stock * prod_price), 0) AS SUMTOTALPRICE "+
	        		 " from habibi_cart A join habibi_product B "+
	        		 " on A.fk_prod_code = B.prod_code "+
	        		 " where fk_userid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         
	         rs = pstmt.executeQuery();
	         rs.next();
	         
	         sumMap.put("SUMTOTALPRICE", rs.getString("SUMTOTALPRICE"));
	         
	                  
	      } finally {
	         close();
	      }
	      
	      return sumMap;
		
		
	}

	// === 장바구니 담기 === 
	// 장바구니 테이블에 해당 제품이 존재하지 않는 경우는 shoppin_cart 테이블에 insert 를 해야하고,
	// 장바구니 테이블에 해당 제품이 존재하는 경우에 또 그 제품을 추가해서 장바구니 담기를 한다라면  shoppin_cart 테이블에 update 를 해야 한다.
	@Override
	public int addCart(String userid, String prod_code, String cart_stock) throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 /*
			     먼저 장바구니 테이블(shopping_cart)에 어떤 회원이 새로운 제품을 넣는 것인지,
			     아니면 또 다시 제품을 추가로 더 구매하는 것인지를 알아야 한다.
			     이것을 알기위해서 어떤 회원이 어떤 제품을  장바구니 테이블(shopping_cart) 넣을때
			     그 제품이 이미 존재하는지 select 를 통해서 알아와야 한다.
			     
			   ----------------------------------------------------
			    cartno   fk_userid     fk_pnum   oqty  status
			   -----------------------------------------------------
			      1      leess          7         2     1
			      2      leess          6         3     1
			      3      hongkd         7         5     1
			  */
			 
			 String sql = " select cart_num "
			 		    + " from habibi_cart "
			 		    + " where fk_userid = ? and"
			 		    + " fk_prod_code = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, userid);
			 pstmt.setString(2, prod_code);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 // 어떤 제품을 추가로 장바구니에 넣고자 하는 경우
				 
				 int cart_num = rs.getInt("cart_num");
				 
				 sql = " update habibi_cart set cart_stock = cart_stock + ? "
				 	 + " where cart_num = ? ";
				 
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setInt(1, Integer.parseInt(cart_stock));
				 pstmt.setInt(2, cart_num);
				 
				 result = pstmt.executeUpdate();
			 }
			 else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				 
				 sql = "insert into habibi_cart (cart_num,fk_userid,fk_prod_code,cart_stock)\n"+
						"values (seq_habibi_cart_cartnum.nextval, ?, ?, ?)";
				 
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, userid);
				 pstmt.setString(2, prod_code);
				 pstmt.setString(3, cart_stock);
				 
				 result = pstmt.executeUpdate();
			 }
			 
		} finally {
			close();
		}
		
		return result;
	}

	
	// 장바구니 테이블에서 특정제품을 장바구니에서 비우기 
	@Override
	public int delCart(String cart_num) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " delete from habibi_cart "
					   + " where cart_num = ? ";
					   
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart_num);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
		
		
	}

		
	// 장바구니 테이블에서 특정제품의 수량을 변경시키기
	@Override
	public int updateCart(String cart_num, String cart_stock) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update habibi_cart set cart_stock = ? "
					   + " where cart_num = ? ";
					   
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart_stock);
			pstmt.setString(2, cart_num);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return n;
	}



	
}