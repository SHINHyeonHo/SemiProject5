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
				newProd = " and (sysdate - prod_insert_date) < 5 ";
			}
			
			List<ProductVO> prodList = new ArrayList<>();
			
			try {
				conn = ds.getConnection();

				String sql = "select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, prod_new_date, order_sum from ( " + 
						"                  select rownum NUM, P.* " + 
						"                  from ( " + 
						"                      select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, sysdate - prod_insert_date as prod_new_date, nvl(order_sum,0) as order_sum " + 
						"                      from (select * from view_habibi_product " + 
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
					"  from (select * from view_habibi_product\n" + 
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

			String sql = "select count(*) COUNT from view_habibi_product " + 
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
	
	
	// 배경화면에서 정보 가져오기 
	@Override
	public List<ProductVO> getProductList(String prodCode, int page) throws SQLException {
		
		List<ProductVO> prodList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = " select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size from ( " +
					"                  select rownum NUM, P.* " +
					"                  from ( "+
					"                      select * from view_habibi_product "+
					"                      where prod_status = 1 and prod_code like '" + prodCode + "%' "+
					"                      order by prod_insert_date desc "+
					"                      ) P "+
					"              )"+
					"where NUM between ? and ? ";
			
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
	        	
	        	ProductVO pvo = new ProductVO(prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, 1);
		        
	        	prodList.add(pvo);
	        }
	        
	        
		} finally {
			close();
		}
		return prodList;
	}

	
	// 사이드바 검색 결과
	@Override
	public List<ProductVO> getSearchProductList(String searchWord, int page, String select) throws SQLException {
		
		List<ProductVO> prodList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sqlSelect = "";
			
			if("ALL".equalsIgnoreCase(select)) {
				sqlSelect = " where prod_status = 1 and (prod_category like '%" + searchWord + "%' or prod_code like '%" + searchWord + "%' or prod_name like '%" + searchWord + "%' or prod_mtl like '%" + searchWord + "%' or prod_color like '%" + searchWord + "%' ) ";
			}
			else {
				sqlSelect = " where prod_status = 1 and " + select + " like '%" + searchWord + "%' ";
			}

			String sql = " select prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size from ( "
					   + " select rownum NUM, P.* " 
					   + " from ( "
					   + " select * from view_habibi_product "
					   + sqlSelect
					   + " order by prod_status desc, prod_insert_date desc "
					   + " ) P "
					   + " ) "
					   + " where NUM between ? and ? ";
			
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
	        	
	        	ProductVO pvo = new ProductVO(prod_code, prod_category, prod_name, prod_cost, prod_price, prod_stock, prod_color, prod_mtl, prod_size, 1);
		        
	        	prodList.add(pvo);
	        }
	        
		} finally {
			close();
		}
		
		return prodList;
	}

	
	// 사이드바 검색 결과 수
	@Override
	public int getSearchProductCount(String searchWord, String select) throws SQLException {
		int count = 0;
		
		try {
			conn = ds.getConnection();

			String sqlSelect = "";
			
			if("ALL".equalsIgnoreCase(select)) {
				sqlSelect = " where prod_status = 1 and (prod_category like '%" + searchWord + "%' or prod_code like '%" + searchWord + "%' or prod_name like '%" + searchWord + "%' or prod_mtl like '%" + searchWord + "%' or prod_color like '%" + searchWord + "%' ) ";
			}
			else {
				sqlSelect = " where prod_status = 1 and " + select + " like '%" + searchWord + "%' ";
			}
			
			String sql = " select count(*) COUNT from view_habibi_product "
					   + sqlSelect;
			
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
						 " from habibi_cart A join view_habibi_product B "+
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
	        		 " from habibi_cart A join view_habibi_product B "+
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


	// myInfo에서 주문내역 확인하기
	@Override
	public List<OrderVO> selectMemberOrder(String userid) throws SQLException {
		
		List<OrderVO> memberOrderList = null;
		try {
			conn = ds.getConnection();
			
			String sql = " select A.order_code, A.fk_userid, A.order_name, A.order_address, A.order_ship, A.order_memo, A.order_refund, to_char(A.order_date, 'yyyy-mm-dd') AS order_date, A.order_mobile, A.order_price, A.order_point, "+
						 " B.orderinfo_code, B.fk_order_code, B.fk_prod_code, B.fk_prod_name, B.order_oqty, B.order_price "+
						 " from habibi_order A join habibi_orderinfo B "+
						 " on A.order_code = B.fk_order_code "+
						 " where fk_userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			int cnt = 0;
			
			while(rs.next()) {
				cnt++;
				if(cnt==1) {
					memberOrderList = new ArrayList<>();
					
					int order_code = rs.getInt("order_code");
					String fk_userid =  rs.getString("fk_userid");
					String order_name = rs.getString("order_name");
					String order_address = rs.getString("order_address");
					int order_ship = rs.getInt("order_ship");
					String order_memo = rs.getString("order_memo");
					int order_refund = rs.getInt("order_refund");
					String order_date = rs.getString("order_date");
					String order_mobile = rs.getString("order_mobile");
					int order_price = rs.getInt("order_price");
					int order_point = rs.getInt("order_point");
//					int order_oqty = rs.getInt("order_oqty");
//					int orderinfo_code = rs.getInt("orderinfo_code");
//					String prod_code = rs.getString("fk_prod_code");
//					String prod_name = rs.getString("fk_prod_name");
					
					OrderVO ovo = new OrderVO();
					ovo.setOrder_code(order_code);
					ovo.setFk_userid(fk_userid);
					ovo.setOrder_name(order_name);
					ovo.setOrder_address(order_address);
					ovo.setOrder_ship(order_ship);
					ovo.setOrder_memo(order_memo);
					ovo.setOrder_refund(order_refund);
					ovo.setOrder_date(order_date);
					ovo.setOrder_mobile(order_mobile);
					ovo.setOrder_price(order_price);
					ovo.setOrder_point(order_point);
//					ovo.setOrder_oqty(order_oqty);
//					ovo.setOrderinfo_code(orderinfo_code);
//					ovo.setProd_name(prod_name);
//					ovo.setProd_code(prod_code);
					
					memberOrderList.add(ovo);
				}
			}
		} finally {
			close();
		}
		
		return memberOrderList;
	}
	
	// 장바구니 번호를 통해 상품정보 가져오기
		@Override
		public CartVO selectProductForNo(String cartno) throws SQLException {
			
			CartVO cartinfo = null;
			
			try {
				
				conn = ds.getConnection();
				
				String sql = " select cart_num,fk_userid,fk_prod_code,cart_stock,prod_name,prod_price,prod_category "+
							 " from habibi_cart A join view_habibi_product B "+
							 " on A.fk_prod_code = B.prod_code "+
							 " where cart_num = ? ";
				
				pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, cartno);
				
		        rs = pstmt.executeQuery();
		        
		         	        
		        if(rs.next()) {
		        		        		        	
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
		        	
		        	cartinfo = cvo;
		        }
		        
				
			} finally {
				close();
			}		
			
			return cartinfo;
		}

		// 전표를 알아오는 메소드
			@Override
			public int getJunpyo() throws SQLException {
				
				int junpyo = 0;
				
				try {
					
					conn = ds.getConnection();
					
					// 전표생성
					String sql = " select seq_habibi_order_code.nextval " + 
								 " from dual ";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					rs.next();
					
					junpyo = rs.getInt("nextval");				
					
				} finally {
					close();
				}
				
				
				return junpyo;
			}
		
		
		
		
		
		// 주문 테이블에 주문내역 insert
		@Override
		public int insertOrder(HashMap<String, String> map,int junpyo) throws SQLException {

			int result = 0;
			
			try {
				conn = ds.getConnection();
				
				// 주문테이블에 insert
				String sql = " insert into habibi_order (order_code,fk_userid,order_name,order_address,order_memo,order_mobile,order_price,order_date,order_ship,order_refund,order_point) "
					+ " values(?,?,?,?,?,?,?,default,default,default,?) ";	
					
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, junpyo);
				pstmt.setString(2, map.get("orderUserid"));
				pstmt.setString(3, map.get("orderName"));
				pstmt.setString(4, map.get("orderAddress"));
				pstmt.setString(5, map.get("orderMemo"));
				pstmt.setString(6, map.get("orderMobile"));
				pstmt.setString(7, map.get("ordersumtotalPrice"));
				pstmt.setString(8, map.get("orderUsePoint"));
				result = pstmt.executeUpdate();
				
			} finally {
				close();
			}
				
			return result;
		}

		// 주문 상세 테이블에 insert
		@Override
		public void insertOrderInfo(String orderProductsCodeArr, String orderOqty, int junpyo,String ordertotalPrice, String orderProducts) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				// 주문테이블에 insert
				String sql = " insert into habibi_orderinfo (orderinfo_code,fk_order_code,fk_prod_code,order_oqty,order_price,fk_prod_name) "
					+ " values(seq_habibi_orderinfo_code.nextval,?,?,?,?,?) ";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, junpyo);
				pstmt.setString(2, orderProductsCodeArr);
				pstmt.setString(3, orderOqty);	
				pstmt.setString(4, ordertotalPrice);
				pstmt.setString(5, orderProducts);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		// 주문이 완료되면 장바구니에서 비워주기
		@Override
		public void orderCartDel(String orderCartNoArr) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				String sql = " delete from habibi_cart "
						   + " where cart_num = ? ";
						   
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderCartNoArr);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		
		// 사용된 적립금 마이너스 해주기
		@Override
		public void minusPoint(String orderUserid, String orderUsePoint) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				String sql = " update habibi_member set point = point - ? "
						   + " where userid = ? ";
						   
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderUsePoint);
				pstmt.setString(2, orderUserid);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		// 구매한 상품에 대한 적립금 적립
		@Override
		public void plusPoint(String orderUserid, String orderAddPoint) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				String sql = " update habibi_member set point = point + ? "
						   + " where userid = ? ";
						   
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderAddPoint);
				pstmt.setString(2, orderUserid);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		// 적립금 테이블에 insert
		@Override
		public void insertPointTabel(int junpyo, String orderUserid, int point) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				// 주문테이블에 insert
				String sql = " insert into habibi_point (order_date, point ,fk_order_code,point_comment,fk_userid) "
					+ " values (default,?,?,?,?) ";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, point);
				pstmt.setInt(2, junpyo);
				pstmt.setString(3, "+"+point+" 원 적립");
				pstmt.setString(4, orderUserid);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
		}
		
		
		// 적립금 테이블에 insert(마이너스)
		@Override
		public void insertMinusPointTable(int junpyo, String orderUserid, String orderUsePoint) throws SQLException {

			try {
				conn = ds.getConnection();
				
				// 주문테이블에 insert
				String sql = " insert into habibi_point (order_date, point ,fk_order_code,point_comment,fk_userid) "
							+ " values (default,?,?,?,?) ";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderUsePoint);
				pstmt.setInt(2, junpyo);
				pstmt.setString(3, "-"+orderUsePoint+" 원 사용");
				pstmt.setString(4, orderUserid);
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		// 관리자 주문관리 페이지 불러오기
		@Override
		public List<OrderVO> selectOrderList(HashMap<String, String> paraMap) throws SQLException {

			List<OrderVO> orderlist = null;

			int cnt = 0;
			
			try {
				
				cnt++;
	        	
	        	if(cnt==1) {
	        		orderlist = new ArrayList<OrderVO>();
	        	}
	        	
				
				conn = ds.getConnection();
				
				String sql = "select RNO,order_code,fk_userid ,order_name ,order_address,order_ship "+
						" ,order_date,order_mobile,order_price,order_point "+
						" from "+
						"    ( "+
						"    select rownum AS RNO,order_code,fk_userid ,order_name ,order_address,order_ship,order_memo "+
						"    ,order_date ,order_mobile,order_price,order_point "+
						"    from "+
						"        ( "+
						"        select order_code,fk_userid ,order_name ,order_address,order_ship,order_memo "+
						"        ,to_char(order_date,'yyyy-mm-dd') as order_date "+
						"        ,order_mobile,order_price,order_point "+
						"        from habibi_order "+
						"        where order_ship = 0 "+
						"        order by order_code desc "+
						"        ) V "+
						"    )T "+
						" where T.RNO between ? and ?";
						
				pstmt = conn.prepareStatement(sql);
				
				int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
				int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
				
				pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1) ); // 공식
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) ); // 공식   
				
		        rs = pstmt.executeQuery();
		               	        
		        while(rs.next()) {
		        		        
		        	int order_code = rs.getInt("order_code");
		        	String fk_userid = rs.getString("fk_userid");
		        	int order_ship = rs.getInt("order_ship");
		        	String order_date = rs.getString("order_date");
		        	
		        	OrderVO ovo = new OrderVO();
		        	
		        	ovo.setOrder_code(order_code);
		        	ovo.setFk_userid(fk_userid);
		        	ovo.setOrder_ship(order_ship);
		        	ovo.setOrder_date(order_date);
		        	
		        	orderlist.add(ovo);
		        	
		        }        
		        
				
			} finally {
				close();
			}		
					
			return orderlist;
		}

		// 배송완료된 상품의 리스트 불러오기
			@Override
			public List<OrderVO> selectOrderCompleteList(HashMap<String, String> paraMap2) throws SQLException {
				
				List<OrderVO> orderCompletelist = null;

				int cnt = 0;
				
				try {
					
					cnt++;
		        	
		        	if(cnt==1) {
		        		orderCompletelist = new ArrayList<OrderVO>();
		        	}
		        	
					
					conn = ds.getConnection();
					
					String sql = "select RNO,order_code,fk_userid ,order_name ,order_address,order_ship "+
							" ,order_date,order_mobile,order_price,order_point "+
							" from "+
							"    ( "+
							"    select rownum AS RNO,order_code,fk_userid ,order_name ,order_address,order_ship,order_memo "+
							"    ,order_date ,order_mobile,order_price,order_point "+
							"    from "+
							"        ( "+
							"        select order_code,fk_userid ,order_name ,order_address,order_ship,order_memo "+
							"        ,to_char(order_date,'yyyy-mm-dd') as order_date "+
							"        ,order_mobile,order_price,order_point "+
							"        from habibi_order "+
							"        where order_ship = 1 "+
							"        order by order_code desc "+
							"        ) V "+
							"    )T "+
							" where T.RNO between ? and ?";
							
					pstmt = conn.prepareStatement(sql);
					
					int currentShowPageNo = Integer.parseInt(paraMap2.get("currentShowPageNo2"));
					int sizePerPage = Integer.parseInt(paraMap2.get("sizePerPage2"));
					
					pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1) ); // 공식
					pstmt.setInt(2, (currentShowPageNo * sizePerPage) ); // 공식   
					
			        rs = pstmt.executeQuery();
			               	        
			        while(rs.next()) {
			        		        
			        	int order_code = rs.getInt("order_code");
			        	String fk_userid = rs.getString("fk_userid");
			        	int order_ship = rs.getInt("order_ship");
			        	String order_date = rs.getString("order_date");
			        	
			        	
			        	OrderVO ovo = new OrderVO();
			        	
			        	ovo.setOrder_code(order_code);
			        	ovo.setFk_userid(fk_userid);
			        	ovo.setOrder_ship(order_ship);
			        	ovo.setOrder_date(order_date);
			        	
			        	orderCompletelist.add(ovo);
			        	
			        }
			        
			        
					
				} finally {
					close();
				}		
						
				return orderCompletelist;
			}
		
		
		// 배송준비중인 상품의 갯수 가져오기
		@Override
		public int countordership() throws SQLException {
			int result = 0;
			
			try {
				
				conn = ds.getConnection();
				
				String sql = " select count(*) as count "+
							 " from habibi_order "+
							 " where order_ship = 0";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				result = rs.getInt("count");
				
			} finally {
				close();
			}
			
			return result;
		}

		
		// 배송완료된 상품의 갯수 가져오기
			@Override
			public int countorderCompleteship() throws SQLException {
				
				int result = 0;
				
				try {
					
					conn = ds.getConnection();
					
					String sql = " select count(*) as count "+
								 " from habibi_order "+
								 " where order_ship = 1";
					
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					rs.next();
					
					result = rs.getInt("count");
					
				} finally {
					close();
				}
				
				return result;
			}
		
		// 받아온 주문번호를 통해 배송처리하기
		@Override
		public void goShipment(String ordercode) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				String sql = " update habibi_order set order_ship = 1 "+
							 " where order_code = ? ";
						   
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ordercode);
							
				pstmt.executeUpdate();
				
				
				sql = " update habibi_order set order_date = sysdate "+
					  " where order_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ordercode);
							
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}

		// 주문번호를 통해 주문의 상세 정보 알아오기
		@Override
		public OrderVO viewOrderList(String orderCode) throws SQLException {
			
			OrderVO ovo = new OrderVO();
			
			try {			
				
				conn = ds.getConnection();
				
				String sql = " select order_code,fk_userid ,order_name ,order_address,order_ship,order_memo,order_date "
						  + " ,order_mobile,order_price,order_point "
						  + " from habibi_order "
						  + " where order_code = ? "
						  + " order by order_code desc ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderCode);
				
		        rs = pstmt.executeQuery();
		              
		        
		        if(rs.next()) {
		        		   	        	
		        	int order_code = rs.getInt("order_code");
		        	String fk_userid = rs.getString("fk_userid");
		        	String order_name = rs.getString("order_name");
		        	String order_address = rs.getString("order_address");	       
		        	int order_ship = rs.getInt("order_ship");
		        	String order_memo = rs.getString("order_memo");
		        	String order_date = rs.getString("order_date");
		        	String order_mobile = rs.getString("order_mobile");
		        	int order_price = rs.getInt("order_price");
		        	int order_point = rs.getInt("order_point");
		        	        
		        	
		        	ovo.setOrder_code(order_code);
		        	ovo.setFk_userid(fk_userid);
		        	ovo.setOrder_name(order_name);
		        	ovo.setOrder_address(order_address);
		        	ovo.setOrder_ship(order_ship);
		        	ovo.setOrder_memo(order_memo);
		        	ovo.setOrder_date(order_date);
		        	ovo.setOrder_mobile(order_mobile);
		        	ovo.setOrder_price(order_price);
		        	ovo.setOrder_point(order_point);
		        	
		        }
		        	        
				
			} finally {
				close();
			}		
					
			return ovo;
			
			
		}

		// 주문번호를 통해 주문의 상세정보 알아오기
		@Override
		public List<OrderInfoVO> viewOrderDetailList(String orderCode) throws SQLException {
			
			List<OrderInfoVO> orderDetailList = null;

			int cnt = 0;
			
			try {
				
				cnt++;
	        	
	        	if(cnt==1) {
	        		orderDetailList = new ArrayList<OrderInfoVO>();
	        	}
	        				
				conn = ds.getConnection();
				
				String sql = " select fk_order_code,fk_prod_code,fk_prod_name,order_oqty,order_price "
						  + " from habibi_orderinfo "
						  + " where fk_order_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, orderCode);		
				
		        rs = pstmt.executeQuery();
		               	        
		        while(rs.next()) {
		        		        
		        	int fk_order_code = rs.getInt("fk_order_code");
		        	String fk_prod_code = rs.getString("fk_prod_code");
		        	String fk_prod_name = rs.getString("fk_prod_name");
		        	int order_oqty = rs.getInt("order_oqty");
		        	int order_price = rs.getInt("order_price");
		        	
		        	OrderInfoVO oivo = new OrderInfoVO();
		        	
		        	oivo.setFk_order_code(fk_order_code);
		        	oivo.setFk_prod_code(fk_prod_code);
		        	oivo.setFk_prod_name(fk_prod_name);
		        	oivo.setOrder_oqty(order_oqty);
		        	oivo.setOrder_price(order_price);
		        		        	
		        	orderDetailList.add(oivo);
		        	
		        }	        	        
				
			} finally {
				close();
			}		
					
			return orderDetailList;
		}

		
		// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
		@Override
		public int getTotalPage(HashMap<String, String> paraMap) throws SQLException{

			int totalPage = 0;
			
			try {
				 conn = ds.getConnection();
				 
				 String sql = " select ceil(count(*)/?) as totalPage "+
						 	  " from habibi_order "
						 	  + "where order_ship = 0";			 		
				 
				 pstmt = conn.prepareStatement(sql);
				 			 			
				 pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) );
				 			 
				 rs = pstmt.executeQuery();
				 
				 rs.next();
				 
				 totalPage = rs.getInt("totalPage");
				 
			} finally {
				close();
			}
			
			return totalPage;
			
		}

		// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기2(select)
		@Override
		public int getTotalPage2(HashMap<String, String> paraMap) throws SQLException {
			int totalPage = 0;
			
			try {
				 conn = ds.getConnection();
				 
				 String sql = " select ceil(count(*)/?) as totalPage "+
						 	  " from habibi_order "
						 	  + "where order_ship = 1 ";			 		
				 
				 pstmt = conn.prepareStatement(sql);
				 			 			
				 pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) );
				 			 
				 rs = pstmt.executeQuery();
				 
				 rs.next();
				 
				 totalPage = rs.getInt("totalPage");
				 
			} finally {
				close();
			}
			
			return totalPage;
		}
		
		


		// 주문번호를 통해 정산테이블에 insert할 주문의 상품정보 가져오기
		@Override
		public OrderVO getOrderInfo(String ordercode) throws SQLException {
			
			OrderVO ovo = new OrderVO();
			
			try {			
				
				conn = ds.getConnection();
				
				String sql = " select order_code, fk_userid, order_price "
						  + " from habibi_order "
						  + " where order_code = ? "
						  + " order by order_code desc ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ordercode);
				
		        rs = pstmt.executeQuery();
		              
		        
		        if(rs.next()) {
		        		   	        	
		        	int order_code = rs.getInt("order_code");
		        	String fk_userid = rs.getString("fk_userid");	        
		        	int order_price = rs.getInt("order_price");
		        	                	
		        	ovo.setOrder_code(order_code);
		        	ovo.setFk_userid(fk_userid);
		        	ovo.setOrder_price(order_price);
	      	
		        }       	        
				
			} finally {
				close();
			}		
					
			return ovo;	
			
		}
			

		// 알아온 상품정보를 통해 정산테이블에 insert해주기
		@Override
		public void insertCaculate(int order_code, String fk_userid, int order_price) throws SQLException {
			
			try {
				conn = ds.getConnection();
				
				// 주문테이블에 insert
				String sql = " insert into habibi_calculate(fk_order_code, fk_name, fk_order_price, fk_cost_sum, fk_order_date, is_complete) "
							+ " values (?,?,?,?,default,default) ";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, order_code);
				pstmt.setString(2, fk_userid);
				pstmt.setInt(3, order_price);
				pstmt.setInt(4, (int)(order_price*0.7));
				
				pstmt.executeUpdate();
				
			} finally {
				close();
			}
		}
		
		// 주문한 수량 만큼 감소시키기
	   @Override
	   public void minusProductStock(String orderoqty, String orderProductsCode) throws SQLException {
	      
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update habibi_product set prod_stock = prod_stock - ?"+
	                   " where prod_code = ? ";
	                  
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, orderoqty);
	         pstmt.setString(2, orderProductsCode);
	         
	         pstmt.executeUpdate();
	         
	         
	      } finally {
	         close();
	      }
	      
	      
	   }


	
}