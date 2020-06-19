package habibi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.sql.DataSource;

public class MemberDAO implements InterMemberDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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

	// 로그인한 회원 정보 가져오기
	@Override
	public MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException{
		
		MemberVO mvo = null;
        
		try {
			conn = ds.getConnection();

			String sql = " select userid, passwd, name, email, passwd_check_q, passwd_check_a, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email, point, is_member, join_date, last_passwd_date, last_login_date "
					   + " from habibi_member "
					   + " where is_member = 1 and userid = ? and passwd = ? ";
	         
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, paraMap.get("userid"));
	        pstmt.setString(2, paraMap.get("passwd"));
	         
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) {
	        	mvo = new MemberVO();
	        	mvo.setUserid(rs.getString("userid"));
	            mvo.setPasswd(rs.getString("passwd"));
	            mvo.setName(rs.getString("name"));
	            mvo.setEmail(rs.getString("email"));
	            mvo.setPasswd_check_q(rs.getString("passwd_check_q"));
	            mvo.setPasswd_check_q(rs.getString("passwd_check_a"));
	            mvo.setPostcode(rs.getString("postcode"));
	            mvo.setAddress1(rs.getString("address1"));
	            mvo.setAddress2(rs.getString("address2"));
	            mvo.setMoblie1(rs.getString("mobile1"));
	            mvo.setMoblie2(rs.getString("mobile2"));
	            mvo.setMoblie3(rs.getString("mobile3"));
	            mvo.setIs_sms(rs.getString("is_sms"));
	            mvo.setIs_email(rs.getString("is_email"));
	            mvo.setPoint(rs.getInt("point"));
	            mvo.setIs_member(rs.getString("is_member"));
	            mvo.setJoin_date(rs.getString("join_date"));
	            mvo.setLast_passwd_date(rs.getString("last_passwd_date"));
	            mvo.setLast_login_date(rs.getString("last_login_date"));
	        }
	        
		} finally {
			close();
		}

		return mvo;
		
	}
	
	
	
}