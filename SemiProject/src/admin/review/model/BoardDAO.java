package admin.review.model;

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
	public List<BoardVO> getREVList(String searchCategory, String searchName, int start, int end)
			throws SQLException {

		List<BoardVO> revList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = " select * from ( " + "	select rownum num, N.* from ( "
					+ "		select * from rev_cmt_view "
					+ "		where " + searchCategory + " like '%" + searchName + "%' and fk_userid != 'admin' "
					+ "		order by rev_no desc)N " 
					+ "	) " + " where num between ? and ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
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

				BoardVO bvo = new BoardVO(fk_userid, fk_prod_code, rev_no, rev_title, rev_content, rev_write_date,
						rev_count, rev_status, rev_seq);

				revList.add(bvo);
			}

		} finally {
			close();
		}

		return revList;
	}

	// 리뷰 개수
	@Override
	public int getREVCount(String searchCategory, String searchName) throws SQLException {

		int count = 0;

		try {
			conn = ds.getConnection();

			String sql = " select count(*) COUNT from habibi_review " + " where " + searchCategory + " like '%"
					+ searchName + "%' and fk_userid != 'admin' ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} finally {
			close();
		}

		return count;
	}

	// 리뷰 삭제
	@Override
	public int deleteREV(String revNoString) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = "delete habibi_review where rev_no in (" + revNoString + ")";

			pstmt = conn.prepareStatement(sql);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}

	// 판매 상태 변경
	@Override
	public int changeStatus(int rev_status, int rev_no) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = "update habibi_review set rev_status = " + rev_status + " \n" + "where rev_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rev_no);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}

	// 최근리뷰
	@Override
	public int getNewREVCount() throws SQLException {

		int count = 0;

		try {
			conn = ds.getConnection();

			String sql = " select count(*) COUNT from habibi_review "
					+ " where rev_write_date >= sysdate - 1 and fk_userid != 'admin' ";

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
