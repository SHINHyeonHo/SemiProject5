package admin.order.model;

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

public class OrderDAO implements InterOrderDAO{

	private DataSource ds; 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	public OrderDAO() {
	
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

	// 주문정보가져오기
	@Override
	public List<OrderVO> selectOrderList() throws SQLException{
		
		List<OrderVO> orderlist = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select order_code, fk_userid, fk_prod_code, fk_prod_name, fk_name, order_num " + 
					"			,order_address, order_ship, order_memo, order_refund, order_date, order_mobile, order_price " + 
					" from habibi_order " + 
					" where fk_userid = 'admin' ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int order_code=rs.getInt("order_code");
				String fk_userid = rs.getString("fk_userid");
				String fk_prod_code = rs.getString("fk_prod_code");
				String fk_prod_name = rs.getString("fk_prod_name");
				String fk_name = rs.getString("fk_name");
				int order_num = rs.getInt("order_num");
				String order_address = rs.getString("order_address");
				int order_ship = rs.getInt("order_ship");
				String order_memo = rs.getString("order_memo");
				int order_refund = rs.getInt("order_refund");
				String order_date = rs.getString("order_date");
				String order_mobile = rs.getString("order_mobile");
				int order_price = rs.getInt("order_price");
			
				OrderVO ovo = new OrderVO(order_code, fk_userid, fk_prod_code, fk_prod_name, fk_name, order_num 
							,order_address, order_ship, order_memo, order_refund, order_date, order_mobile, order_price);
				
				orderlist.add(ovo);
			}
			
		} finally {
			close();
		}
		
		return orderlist;
		
	}

	// 주문상태 업데이트
	@Override
	public int updateShipment(String order_code) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();
			
			String sql = " update habibi_order set order_ship = 1 " + 
						 " where order_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_code);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}
}
