package admin.profit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdminProfitDAO implements InterAdminProfitDAO{

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	   public AdminProfitDAO() {
	   
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
	
	
	@Override
	public List<ProfitVO> getProfitList() throws SQLException {
		
		List<ProfitVO> profitList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select fk_order_code, " + 
					"       fk_name, " + 
					"       fk_order_price, " + 
					"       fk_cost_sum, " + 
					"       to_char(fk_order_date,'yyyy-MM-dd'), " + 
					"       to_char(cal_date,'yyyy-MM-dd'), " + 
					"       commission, " + 
					"       cal_price, " + 
					"       is_complete, " + 
					"       profit " + 
					" from view_habibi_calculate" + 
					" order by cal_date desc";
			
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        		        	
	        	String fk_order_code = rs.getString(1);
	        	String fk_name = rs.getString(2);
	        	int fk_order_price = rs.getInt(3);
	        	int fk_cost_sum = rs.getInt(4);
	        	String fk_order_date = rs.getString(5);
	        	String cal_date = rs.getString(6);
	        	int commission = rs.getInt(7);
	        	int cal_price = rs.getInt(8);
	        	int is_complete = rs.getInt(9);
	        	int profit = rs.getInt(10);
	        	
	        	ProfitVO pvo = new ProfitVO(fk_order_code, fk_name, fk_order_price, fk_cost_sum, fk_order_date, cal_date, commission, cal_price, is_complete, profit);
		        
	        	profitList.add(pvo);

	        }
	        
	        
		} finally {
			close();
		}

		
		return profitList;
		
		
	}

	
	// 정산 날짜 오늘이랑 비교
	@Override
	public int ProfitDateCheck(String orderCodes) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update view_habibi_calculate set is_complete = 1"
					+ " where fk_order_code in ("+orderCodes+")";
					   
			pstmt = conn.prepareStatement(sql);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return n;
	}

	
	// 월별 매출,비용,수익 
	@Override
	public List<Map<String, Integer>> GetMonthProfit() throws SQLException {

		List<Map<String, Integer>> monthProfitList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select month, sum(revenue) as revenue, sum(expense) as expense, sum(profit) as profit\n" + 
					"\n" + 
					"   from\n" + 
					"        (select fk_order_price as revenue,\n" + 
					"               extract(month from cal_date) as month,\n" + 
					"               fk_order_price - profit as expense,\n" + 
					"               profit\n" + 
					"        from view_habibi_calculate\n" + 
					"        where is_complete = 1) V\n" + 
					"group by month\n" + 
					"order by month desc";
			
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	        		   
	        	Map<String, Integer> paraMap = new HashMap<>();
	        	
	        	int month = rs.getInt(1);
	        	int revenue = rs.getInt(2);
	        	int expense = rs.getInt(3);
	        	int profit = rs.getInt(4);
	        	
	        	paraMap.put("month", month);
	        	paraMap.put("revenue", revenue);
	        	paraMap.put("expense", expense);
	        	paraMap.put("profit", profit);

	        	monthProfitList.add(paraMap);
	        }
	        
	        
		} finally {
			close();
		}

		
		return monthProfitList;
		
	}

	@Override
	public Map<String, Integer> GetThisMonthProfit() throws SQLException {
		

		Map<String, Integer> paraMap = new HashMap<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select sum(revenue) as revenue, sum(expense) as expense" + 
					"\n" + 
					"   from\n" + 
					"        (select fk_order_price as revenue, " + 
					"               extract(month from cal_date) as month, " + 
					"               fk_order_price - profit as expense " + 
					"        from view_habibi_calculate " + 
					"        where is_complete = 0) V  " + 
					"group by month\n" + 
					"order by month desc";
			
			pstmt = conn.prepareStatement(sql);
	         
	        rs = pstmt.executeQuery();
	         
	        rs.next(); 
	        		   	        	
	        	int revenue = rs.getInt(1);
	        	int expense = rs.getInt(2);
	        	
	        	paraMap.put("revenue", revenue);
	        	paraMap.put("expense", expense);

	        
		} finally {
			close();
		}

		
		return paraMap;
	}

}
