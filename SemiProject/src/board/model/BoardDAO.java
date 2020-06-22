package board.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class BoardDAO implements InterBoardDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자 
	   public BoardDAO() {
	   
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
	public List<BoardVO> getQNAList() throws SQLException {
		
		List<BoardVO> qnaList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = "select fk_userid, fk_prod_code, qna_category, qna_no, qna_title, qna_content, "
						+"qna_passwd, qna_write_date, qna_count, qna_answer, qna_is_done "
						+"from habibi_qna order by qna_no desc";
	         
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	
	        	String fk_userid = rs.getString(1);
	        	String fk_prod_code = rs.getString(2);
	        	String qna_category = rs.getString(3);
	        	int qna_no = rs.getInt(4);
	        	String qna_title = rs.getString(5);
	        	String qna_content = rs.getString(6);
	        	String qna_passwd = rs.getString(7);
	        	String qna_write_date = rs.getString(8);
	        	int qna_count = rs.getInt(9);
	        	String qna_answer = rs.getString(10);
	        	int qna_is_done = rs.getInt(11);
	        	
	        	BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, qna_category, qna_no, qna_title,
	        			qna_content, qna_passwd, qna_write_date, qna_count, qna_answer,
	        			qna_is_done);
		        
	        	qnaList.add(bvo);
	        
	        }        
	        
		} finally {
			close();
		}
		
		return qnaList;
	}

}
