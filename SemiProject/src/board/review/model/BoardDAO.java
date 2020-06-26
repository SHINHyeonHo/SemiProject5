package board.review.model;

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
	
	// rev 게시글 리스트, 검색
	@Override
	public List<BoardVO> getREVList(String prodCode, String search) throws SQLException {
		
		List<BoardVO> revList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = " select fk_userid, fk_prod_code, rev_category, rev_no, rev_title, rev_content, "
						+" rev_passwd, rev_write_date, rev_count, rev_status, rev_seq "
						+" from rev_rank_view "
						+" where fk_prod_code = ? and rev_title like '%"+search+"%' "
						+ "order by rev_seq desc ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	
	        	String fk_userid = rs.getString(1);
	        	String fk_prod_code = rs.getString(2);
	        	String rev_category = rs.getString(3);
	        	int rev_no = rs.getInt(4);
	        	String rev_title = rs.getString(5);
	        	String rev_content = rs.getString(6);
	        	String rev_passwd = rs.getString(7);
	        	String rev_write_date = rs.getString(8);
	        	int rev_count = rs.getInt(9);
	        	int rev_status = rs.getInt(10);
	        	int rev_seq = rs.getInt(11);
	        	
	        	BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, rev_category, rev_no, rev_title,
	        			rev_content, rev_passwd, rev_write_date, rev_count, rev_status, rev_seq);
		        
	        	revList.add(bvo);
	        
	        }        
	        
		} finally {
			close();
		}
		
		return revList;
	}
	
	// rev 게시글 작성
	@Override
	public int insertREV(BoardVO bvo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_review(rev_no, rev_category, rev_title, fk_userid, rev_content, rev_passwd, fk_prod_code)\n " + 
					" values (habibi_review_seq.nextval,?,?,?,?,?,?)";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getRev_category());
			pstmt.setString(2, bvo.getRev_title());
			pstmt.setString(3, bvo.getFk_userid());
			pstmt.setString(4, bvo.getRev_content());
			pstmt.setString(5, bvo.getRev_passwd());
			pstmt.setString(6, bvo.getFk_prod_code());

	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// rev 게시글 보기
	@Override
	public BoardVO viewREV(String prodCode, int revNo) throws SQLException {
		
		BoardVO viewREV = new BoardVO();
		
		try {
			conn = ds.getConnection();

			String sql = " select fk_userid, fk_prod_code, rev_category, rev_no, rev_title, rev_content, "
						+" rev_passwd, to_char(rev_write_date, 'YYYY-MM-DD hh24:mi'), rev_count, "
						+" rev_status, rank() over (partition by fk_prod_code order by rev_write_date) AS rev_seq "
						+" from habibi_review "
						+" where fk_prod_code = ? and rev_no = ? order by rev_no desc ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, revNo);
			rs = pstmt.executeQuery();
			
	        if(rs.next()) {
	        	
	        	String fk_userid = rs.getString(1);
	        	String fk_prod_code = rs.getString(2);
	        	String rev_category = rs.getString(3);
	        	int rev_no = rs.getInt(4);
	        	String rev_title = rs.getString(5);
	        	String rev_content = rs.getString(6);
	        	String rev_passwd = rs.getString(7);
	        	String rev_write_date = rs.getString(8);
	        	int rev_count = rs.getInt(9);
	        	int rev_status = rs.getInt(10);
	        	int rev_seq = rs.getInt(11);
	        	
	        	BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, rev_category, rev_no, rev_title,
	        			rev_content, rev_passwd, rev_write_date, rev_count, rev_status, rev_seq);
		        
	        	viewREV = bvo;
	        
	        }        
	        
		} finally {
			close();
		}
		
		return viewREV;
	}
	

	// rev 게시글 삭제
	@Override
	public int deleteREV(BoardVO bvo, int revNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_review"
					   + " set rev_status = 0 "
					   + " where rev_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	

	// 게시글 수정
	@Override
	public int updateREV(BoardVO bvo, int revNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_review"
					   + " set rev_title = ?, rev_category = ?, rev_content = ?, rev_passwd = ? "
					   + " where rev_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getRev_title());
			pstmt.setString(2, bvo.getRev_category());
			pstmt.setString(3, bvo.getRev_content());
			pstmt.setString(4, bvo.getRev_passwd());
			
			pstmt.setInt(5, revNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// 조회수 증가
	@Override
	public int increaseREVCnt(int revNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_review "
					   + " set rev_count = rev_count + 1 "
					   + " where rev_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, revNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}



}
