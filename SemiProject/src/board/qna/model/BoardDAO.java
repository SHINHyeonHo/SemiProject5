package board.qna.model;

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
	public List<BoardVO> getQNAList(String prodCode, String search) throws SQLException {
		
		List<BoardVO> qnaList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = " select fk_userid, fk_prod_code, qna_category, qna_no, qna_title, qna_content, "
						+" qna_passwd, qna_write_date, qna_count, qna_answer, qna_is_done, qna_status, qna_seq "
						+" from qna_rank_view "
						+" where fk_prod_code = ? and qna_title like '%"+search+"%' "
						+ "order by qna_seq desc ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
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
	        	int qna_status = rs.getInt(12);
	        	int qna_seq = rs.getInt(13);
	        	
	        	BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, qna_category, qna_no, qna_title,
	        			qna_content, qna_passwd, qna_write_date, qna_count, qna_answer,
	        			qna_is_done, qna_status, qna_seq);
		        
	        	qnaList.add(bvo);
	        
	        }        
	        
		} finally {
			close();
		}
		
		return qnaList;
	}
	
	// qna 게시글 작성
	@Override
	public int insertQNA(BoardVO bvo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_qna(qna_category, qna_title, fk_userid, qna_content, qna_passwd, fk_prod_code, qna_no)\n " + 
					" values (?,?,?,?,?,?, habibi_qna_seq.nextval) ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getQna_category());
			pstmt.setString(2, bvo.getQna_title());
			pstmt.setString(3, bvo.getFk_userid());
			pstmt.setString(4, bvo.getQna_content());
			pstmt.setString(5, bvo.getQna_passwd());
			pstmt.setString(6, bvo.getFk_prod_code());

	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// qna 게시글 보기
	@Override
	public BoardVO viewQNA(String prodCode, int qnaNo) throws SQLException {
		
		BoardVO viewQNA = new BoardVO();
		
		try {
			conn = ds.getConnection();

			String sql = " select fk_userid, fk_prod_code, qna_category, qna_no, qna_title, qna_content, "
						+" qna_passwd, to_char(qna_write_date, 'YYYY-MM-DD hh24:mi'), qna_count, qna_answer, qna_is_done, "
						+" qna_status, rank() over (partition by fk_prod_code order by qna_write_date) AS qna_seq "
						+" from habibi_qna "
						+" where fk_prod_code = ? and qna_no = ? order by qna_no desc ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, qnaNo);
			rs = pstmt.executeQuery();
			
	        if(rs.next()) {
	        	
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
	        	int qna_status = rs.getInt(12);
	        	int qna_seq = rs.getInt(13);
	        	
	        	BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, qna_category, qna_no, qna_title,
	        			qna_content, qna_passwd, qna_write_date, qna_count, qna_answer,
	        			qna_is_done, qna_status, qna_seq);
	        	
	        	viewQNA = bvo;
	        
	        }        
	        
		} finally {
			close();
		}
		
		return viewQNA;
	}
	
	// qna 게시글 삭제
	@Override
	public int deleteQNA(BoardVO bvo, int qnaNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_qna"
					   + " set qna_status = 0 "
					   + " where qna_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// 게시글 수정
	@Override
	public int updateQNA(BoardVO bvo, int qnaNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_qna"
					   + " set qna_title = ?, qna_category = ?, qna_content = ?, qna_passwd = ? "
					   + " where qna_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getQna_title());
			pstmt.setString(2, bvo.getQna_category());
			pstmt.setString(3, bvo.getQna_content());
			pstmt.setString(4, bvo.getQna_passwd());
			
			pstmt.setInt(5, qnaNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
	
	// 조회수 증가
	@Override
	public int increaseQNACnt(int qnaNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_qna "
					   + " set qna_count = qna_count + 1 "
					   + " where qna_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, qnaNo);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}

}

