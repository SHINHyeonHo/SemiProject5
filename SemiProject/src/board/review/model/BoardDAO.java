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
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/myoracle5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end of public void close() ---------------------------

	// rev 게시글 리스트, 검색
	@Override
	public List<CommentVO> getREVList(String prodCode, String field, String query, int page) throws SQLException {

		List<CommentVO> revList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			
			String sql = " select * from ( " + 
						 "	select rownum num, N.* from ( " + 
					 	 "		select * from rev_cmt_view " + 
					 	 "		where fk_prod_code = ? and rev_status = 1 and "+field+" like '%"+query+"%' order by rev_seq desc)N " + 
					 	 "	) " + 
					 	 " where num between ? and ? ";
       
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, 1+(page-1)*15);
			pstmt.setInt(3, page*15);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				String fk_userid = rs.getString("fk_userid");
	        	String fk_prod_code = rs.getString("fk_prod_code");
	        	int rev_no = rs.getInt("rev_no");
	        	String rev_title = rs.getString("rev_title");
	        	String rev_content = rs.getString("rev_content");
	        	String rev_write_date = rs.getString("rev_write_date");
	        	int rev_count = rs.getInt("rev_count");
	        	int rev_status = rs.getInt("rev_status");
	        	int rev_seq = rs.getInt("rev_seq");
	        	int cmt_count = rs.getInt("cmt_count");

	        	CommentVO cvo = new CommentVO(
	        			fk_userid, 
	        			fk_prod_code, 
	        			rev_no, 
	        			rev_title, 
	        			rev_content, 
	        			rev_write_date, 
	        			rev_count, 
	        			rev_status,
	        			rev_seq, 
	        			cmt_count);	        	

				revList.add(cvo);
			}

		} finally {
			close();
		}

		return revList;
	}
	
	// 글 목록 중 paging 되지 않은 글의 개수
	public int getREVCount(String prodCode, String field, String query){

        int count = 0;

        String sql = " select count(*) COUNT from habibi_review " +
        			 " where fk_prod_code = ? and rev_status = 1 and "+field+" like '%"+query+"%' ";

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

	// rev 게시글 작성
	@Override
	public int insertREV(BoardVO bvo) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_review(rev_no, rev_title, fk_userid, rev_content, fk_prod_code)\n "
					+ " values (habibi_review_seq.nextval,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getRev_title());
			pstmt.setString(2, bvo.getFk_userid());
			pstmt.setString(3, bvo.getRev_content());
			pstmt.setString(4, bvo.getFk_prod_code());

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

			String sql = " select fk_userid, fk_prod_code, rev_no, rev_title, rev_content, "
					+ " to_char(rev_write_date, 'YYYY-MM-DD hh24:mi'), rev_count, "
					+ " rev_status, rank() over (partition by fk_prod_code order by rev_write_date) AS rev_seq "
					+ " from habibi_review " + " where fk_prod_code = ? and rev_no = ? order by rev_no desc ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodCode);
			pstmt.setInt(2, revNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				String fk_userid = rs.getString(1);
				String fk_prod_code = rs.getString(2);
				int rev_no = rs.getInt(3);
				String rev_title = rs.getString(4);
				String rev_content = rs.getString(5);
				String rev_write_date = rs.getString(6);
				int rev_count = rs.getInt(7);
				int rev_status = rs.getInt(8);
				int rev_seq = rs.getInt(9);

				BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, rev_no, rev_title, rev_content,
						rev_write_date, rev_count, rev_status, rev_seq);

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

			String sql = " update habibi_review " + " set rev_status = 0 " + " where rev_no = ? ";

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

			String sql = " update habibi_review "
						+ " set rev_title = ?, rev_content = ?"
						+ " where rev_no = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getRev_title());
			pstmt.setString(2, bvo.getRev_content());

			pstmt.setInt(3, revNo);

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

			String sql = " update habibi_review " + " set rev_count = rev_count + 1 " + " where rev_no = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}

	// 댓글 리스트(ajax)
	@Override
	public List<CommentVO> getCMTList(int fk_rev_no) throws SQLException {

		List<CommentVO> cmtList = new ArrayList<CommentVO>();

		try {
			conn = ds.getConnection();

			String sql = " select fk_cmt_userid, cmt_content, cmt_no, to_char(cmt_write_date, 'YYYY-MM-DD hh24:mi') AS cmt_write_date " 
					+ " from habibi_comment "
					+ " where fk_rev_no = ? order by cmt_no ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fk_rev_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String fk_cmt_userid = rs.getString("fk_cmt_userid");
				String cmt_content = rs.getString("cmt_content");
				String cmt_write_date = rs.getString("cmt_write_date");
				int cmt_no = rs.getInt("cmt_no");

				CommentVO cvo = new CommentVO();
				cvo.setFk_cmt_userid(fk_cmt_userid);
				cvo.setCmt_content(cmt_content);
				cvo.setCmt_write_date(cmt_write_date);
				cvo.setCmt_no(cmt_no);

				cmtList.add(cvo);
			}

		} finally {
			close();
		}
		return cmtList;
	}

	// 댓글 입력 (Ajax)
	@Override
	public int insertCMT(CommentVO cvo) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_comment(fk_cmt_userid, cmt_content, fk_rev_no, cmt_no) "
					+ " values (?, ?, ?, habibi_comment_seq.nextval) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getFk_cmt_userid());
			pstmt.setString(2, cvo.getCmt_content());
			pstmt.setInt(3, cvo.getFk_rev_no());

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}
	
	// 댓글 수 
	@Override
	public int countCMT(int fk_rev_no) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " select count(*) COUNT from habibi_comment " +
       			 		 " where fk_rev_no = ? ";

			CommentVO cvo = new CommentVO();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cvo.getFk_rev_no());

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}
	
	// 댓글 삭제
	@Override
	public int deleteCMT(int cmt_no) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " delete from habibi_comment " +
       			 		 " where cmt_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cmt_no);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}
	
	// 댓글 수정
	@Override
	public int modifyCMT(String cmt_content, int cmt_no) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " update habibi_comment "
						+ " set cmt_content = ? "
						+ " where cmt_no = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmt_content);
			pstmt.setInt(2, cmt_no);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}
	
}
