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
	public List<BoardVO> getQNAList(String prodCode, String field, String query, int page) throws SQLException {
				
		List<BoardVO> qnaList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();

			String sql = " select * from ( " + 
						 "	select rownum num, N.* from ( " + 
					 	 "		select * from qna_rank_view " + 
					 	 "		where fk_prod_code = ? and qna_status = 1 and "+field+" like '%"+query+"%' order by re_ref desc, re_seq asc)N " + 
					 	 "	) " + 
					 	 " where num between ? and ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, 1+(page-1)*15);
			pstmt.setInt(3, page*15);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	String fk_userid = rs.getString("fk_userid");
	        	String fk_prod_code = rs.getString("fk_prod_code");
	        	int qna_no = rs.getInt("qna_no");
	        	String qna_category = rs.getString("qna_category");
	        	String qna_title = rs.getString("qna_title");
	        	String qna_content = rs.getString("qna_content");
	        	String qna_write_date = rs.getString("qna_write_date");
	        	int qna_count = rs.getInt("qna_count");
	        	int qna_seq = rs.getInt("qna_seq");
	        	int qna_secret = rs.getInt("qna_secret");
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
		        bvo.setQna_count(qna_count);
		        bvo.setQna_seq(qna_seq);
		        bvo.setQna_secret(qna_secret);
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

	// 글 목록 중 paging 되지 않은 글의 개수
	public int getQNACount(String prodCode, String field, String query){

        int count = 0;

        String sql = " select count(*) COUNT from habibi_qna " +
                " where fk_prod_code = ? and qna_status = 1 and "+field+" like '%"+query+"%' ";

        try {
        	conn = ds.getConnection();
        	
        	pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			rs = pstmt.executeQuery();

            if(rs.next())
                count = rs.getInt("count");

            rs.close();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
	
	// qna 게시글 작성
	@Override
	public int insertQNA(BoardVO bvo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_qna(qna_category, qna_title, fk_userid, qna_content, qna_secret, fk_prod_code, qna_no, re_ref) " + 
					" values (?,?,?,?,?,?, habibi_qna_seq.nextval, habibi_qna_seq.nextval) ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getQna_category());
			pstmt.setString(2, bvo.getQna_title());
			pstmt.setString(3, bvo.getFk_userid());
			pstmt.setString(4, bvo.getQna_content());
			pstmt.setInt(5, bvo.getQna_secret());
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

			String sql = " select fk_userid, fk_prod_code, qna_no, qna_title, qna_content, " + 
						 " to_char(qna_write_date, 'YYYY-MM-DD hh24:mi'), qna_count, re_ref, re_seq, re_lev " + 
						 " from habibi_qna " + 
						 " where fk_prod_code = ? and qna_no = ?";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, qnaNo);
			rs = pstmt.executeQuery();
			
	        if(rs.next()) {
	        	
	        	String fk_userid = rs.getString(1);
	        	String fk_prod_code = rs.getString(2);
	        	int qna_no = rs.getInt(3);
	        	String qna_title = rs.getString(4);
	        	String qna_content = rs.getString(5);
	        	String qna_write_date = rs.getString(6);
	        	int qna_count = rs.getInt(7);
	        	int re_ref = rs.getInt(8);
	        	int re_seq = rs.getInt(9);
	        	int re_lev = rs.getInt(10);
	        	
	        	BoardVO bvo = new BoardVO();
	        	bvo.setFk_userid(fk_userid);
	        	bvo.setFk_prod_code(fk_prod_code);
		        bvo.setQna_no(qna_no);
		        bvo.setQna_title(qna_title);
		        bvo.setQna_content(qna_content);
		        bvo.setQna_write_date(qna_write_date);
		        bvo.setQna_count(qna_count);
		        bvo.setRe_ref(re_ref);
		        bvo.setRe_seq(re_seq);
		        bvo.setRe_lev(re_lev);
	        	
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
					   + " set qna_title = ?, qna_category = ?, qna_content = ?, qna_secret = ? "
					   + " where qna_no = ? ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getQna_title());
			pstmt.setString(2, bvo.getQna_category());
			pstmt.setString(3, bvo.getQna_content());
			pstmt.setInt(4, bvo.getQna_secret());
			
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
	
	// qna 답글 작성
	@Override
	public int insertRE(BoardVO bvo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_qna(qna_title, fk_userid, qna_content, qna_secret, fk_prod_code, qna_no, re_ref, re_seq, re_lev, qna_is_done) " + 
					" values (?,?,?,?,?, habibi_qna_seq.nextval, ?, ?, ?, 1) ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getQna_title());
			pstmt.setString(2, bvo.getFk_userid());
			pstmt.setString(3, bvo.getQna_content());
			pstmt.setInt(4, bvo.getQna_secret());
			pstmt.setString(5, bvo.getFk_prod_code());
			pstmt.setInt(6, bvo.getRe_ref());
			pstmt.setInt(7, bvo.getRe_seq());
			pstmt.setInt(8, bvo.getRe_lev());

	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}		
		return result;
	}
	
	// 답변 여부
	@Override
	public int updateDone(int qnaNo) throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_qna "
					   + " set qna_is_done = 1 "
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

