package admin.qna.model;

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
	
	
	// qna 게시글 리스트, 검색
	@Override
	public List<BoardVO> getQNAList(String searchCategory, String searchName, int start, int end) throws SQLException {
				
		List<BoardVO> qnaList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = " select * from ( " + 
						 "	select rownum num, N.* from ( " + 
					 	 "		select * from qna_rank_view " + 
					 	 "		where "+searchCategory+" like '%"+searchName+"%' and fk_userid != 'admin' " + 
					 	 "		order by qna_no desc, re_ref desc, re_seq asc)N " + 
					 	 "	) " + 
					 	 " where num between ? and ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	String fk_userid = rs.getString("fk_userid");
	        	String fk_prod_code = rs.getString("fk_prod_code");
	        	int qna_no = rs.getInt("qna_no");
	        	String qna_category = rs.getString("qna_category");
	        	String qna_title = rs.getString("qna_title");
	        	String qna_content = rs.getString("qna_content");
	        	String qna_write_date = rs.getString("qna_write_date");
	        	int qna_status = rs.getInt("qna_status");
	        	int qna_secret = rs.getInt("qna_secret");
	        	int qna_is_done = rs.getInt("qna_is_done");
	        	int re_ref = rs.getInt("re_ref");
	        	int re_seq = rs.getInt("re_seq");
	        	int re_lev = rs.getInt("re_lev");
	        	
	        	BoardVO bvo = new BoardVO();
	        	bvo.setFk_userid(fk_userid);
	        	bvo.setFk_prod_code(fk_prod_code);
		        bvo.setQna_no(qna_no);
		        bvo.setQna_category(qna_category);
		        bvo.setQna_title(qna_title);
		        bvo.setQna_content(qna_content);
		        bvo.setQna_write_date(qna_write_date);
		        bvo.setQna_status(qna_status);
		        bvo.setQna_secret(qna_secret);
		        bvo.setQna_is_done(qna_is_done);
		        bvo.setRe_ref(re_ref);
		        bvo.setRe_seq(re_seq);
		        bvo.setRe_lev(re_lev);
		        	        	
	        	qnaList.add(bvo);
	        
	        }        
	        
		} finally {
			close();
		}
		
		return qnaList;
	}	
	
	// 문의 개수 
	@Override
	public int getQNACount(String searchCategory, String searchName) throws SQLException {

		int count = 0;

		try {
			conn = ds.getConnection();

			String sql = " select count(*) COUNT from habibi_qna " 
						+ " where " + searchCategory + " like '%"+ searchName + "%' and fk_userid != 'admin' ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} finally {
			close();
		}

		return count;
	}
	
	// 문의 삭제
	@Override
	public int deleteQNA(String qnaNoString) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = "delete habibi_qna where qna_no in ("+qnaNoString+")";
	         
			pstmt = conn.prepareStatement(sql);
	
	        result = pstmt.executeUpdate();
	        
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// 판매 상태 변경
	@Override
	public int changeStatus(int qna_status, int qna_no) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = "update habibi_qna set qna_status = "+qna_status+" \n" + 
					"where qna_no = ?";
	         
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
	
	        result = pstmt.executeUpdate();		        
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// 답변 여부 문의 개수 
	@Override
	public int getANSCount(int n) throws SQLException {

		int count = 0;

		try {
			conn = ds.getConnection();

			String sql = " select count(*) COUNT from habibi_qna " 
					   + " where qna_is_done = "+n+" and fk_userid != 'admin' ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} finally {
			close();
		}

		return count;
	}
}