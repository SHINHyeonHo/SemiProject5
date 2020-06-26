package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.*;
import javax.sql.DataSource;

public class MemberDAO implements InterMemberDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 생성자 
	public MemberDAO() {
		// 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화
		
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


	// 회원가입하기
	@Override
	public int registerMember(MemberVO mvo) throws SQLException {
        int result = 0;
        
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_member(idx, userid, passwd, name, email, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email) " 
					   + " values(seq_habibi_memno.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
	        
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getUserid());
			pstmt.setString(2, mvo.getPasswd());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getEmail());
			pstmt.setString(5, mvo.getPostcode());
			pstmt.setString(6, mvo.getAddress1());
			pstmt.setString(7, mvo.getAddress2());
			pstmt.setString(8, mvo.getMobile1());
			pstmt.setString(9, mvo.getMobile2());
			pstmt.setString(10, mvo.getMobile3());
			String sms = "";
			if("ON".equalsIgnoreCase(mvo.getIs_sms())) {
				sms = "1";
			}
			else if(mvo.getIs_email() == null) {
				sms = "0";
			}
			else {
				sms = "0";
			}
			pstmt.setString(11, sms);
			String email = "";
			if("ON".equalsIgnoreCase(mvo.getIs_sms())) {
				email = "1";
			}
			else if(mvo.getIs_email() == null){
				email = "0";
			}
			else {
				email = "0";
			}
			pstmt.setString(12, email);
			
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	} // end of public int registerMember(MemberVO mvo)
	
	
	// 아이디 중복검사( userid 가 있으면 true, 없으면 false 리턴 )
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
		boolean isUse = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid "
					   + " from habibi_member "
					   + " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			isUse = !rs.next();
		} finally {
			close();
		}
		return isUse;
	} // end of public boolean idDuplicateCheck(String userid)
	
	
	// 로그인 처리 
	@Override
	public MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException {
			
		MemberVO mvo = null;
		
		try {
			conn = ds.getConnection();
			String sql = " select idx, userid, name, email, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email, point, is_member, join_date "
					   + " from habibi_member "
					   + " where is_member = 1 and userid = ? and passwd = ? "; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("passwd"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mvo = new MemberVO();
				mvo.setIdx(rs.getInt("idx"));
				mvo.setUserid(rs.getString("userid"));
				mvo.setName(rs.getString("name"));
				mvo.setEmail(rs.getString("email"));
				mvo.setMobile1(rs.getString("mobile1"));
				mvo.setMobile2(rs.getString("mobile2"));
				mvo.setMobile3(rs.getString("mobile3"));
				mvo.setPostcode(rs.getString("postcode"));
				mvo.setAddress1(rs.getString("address1"));
				mvo.setAddress2(rs.getString("address2"));
				mvo.setIs_sms(rs.getString("is_sms"));
				mvo.setIs_email(rs.getString("is_email"));
				mvo.setPoint(rs.getInt("point"));
				mvo.setIs_member(rs.getString("is_member"));
				mvo.setJoin_date(rs.getString("join_date"));
			}
			
		} finally {
			close();
		}
		
		return mvo;
	} // end of public MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException
	
	
	 // 아이디 찾기(성명 휴대폰 번호로 찾기)
	@Override
	public String finduserid(HashMap<String, String> paraMap) throws SQLException {
	      
		String userid = null;
	      
		try {
			conn = ds.getConnection();
	         
			String sql = " select userid " 
					   + " from habibi_member " 
					   + " where is_member = 1 and " 
					   + " name = ? and " 
					   + " trim(mobile1) || trim(mobile2) || trim(mobile3) = ? ";
	         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("name"));
	         
			String mobile = paraMap.get("mobile");  // 01023456789
			mobile = mobile.substring(0, 3) + mobile.substring(3, 7) + mobile.substring(7);
			pstmt.setString(2, mobile);
	         
			rs = pstmt.executeQuery();
	         
			if(rs.next()) {
				userid = rs.getString("userid");
			}
	         
		} finally {
			close();
		}
		return userid;
	}

	
	// 비밀번호 찾기(아이디 이메일주소로 찾기)
	@Override
	public boolean isUserExist(HashMap<String, String> paraMap) throws SQLException {
		boolean isUserExist = false;
		try {
			conn = ds.getConnection();
			
			String sql = " select userid "+
						 " from habibi_member "+
						 " where is_member = 1 and userid = ? and email = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("email"));
			
			rs = pstmt.executeQuery();
			
			isUserExist = rs.next();
			
		} finally {
			close();
		}
		return isUserExist;
	} // end of public boolean isUserExist(HashMap<String, String> paraMap) throws SQLException

	
	// 비밀번호 업데이트 하기
	@Override
	public int passwdUpdate(String passwd, String userid) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update habibi_member set passwd = ? "+
					     " where userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, passwd);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			close();
		}
		
		
		return result;
	}

	
	// MyInfo 페이지 생성
	   @Override
	   public MemberVO myInfo(String idx) throws SQLException {
	      
	      MemberVO mvo = null;
	      
	      try {
	         conn = ds.getConnection();

	         String sql = " select idx, userid, name, email, postcode, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email "+
	                   " from habibi_member  "+
	                   " where idx = ? ";
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, idx);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            mvo = new MemberVO();
	            mvo.setIdx(rs.getInt("idx"));
	            mvo.setUserid(rs.getString("userid"));
	            mvo.setName(rs.getString("name"));
	            mvo.setEmail(rs.getString("email"));
	            mvo.setMobile1(rs.getString("mobile1"));
	            mvo.setMobile2(rs.getString("mobile2"));
	            mvo.setMobile3(rs.getString("mobile3"));
	            mvo.setPostcode(rs.getString("postcode"));
	            mvo.setAddress1(rs.getString("address1"));
	            mvo.setAddress2(rs.getString("address2"));
	            mvo.setIs_sms(rs.getString("is_sms"));
	            mvo.setIs_email(rs.getString("is_email"));
	         }
	      } finally {
	         close();
	      }
	      return mvo;
	   }

	
}
