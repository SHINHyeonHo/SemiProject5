package admin.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;

public class AdminMemberDAO implements InterAdminMemberDAO {
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	// 생성자 
	public AdminMemberDAO() {
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

	
	//***회원조회,검색***
	
	
		@Override
		public List<MemberVO> getMemberInfo(String searchType, String searchWord) throws SQLException {
			
			List<MemberVO> memberList=new ArrayList<>(); //view 단으로 이동하게 될 변수 설정하기 
			
			try {
				 
				 conn = ds.getConnection(); // 커넥션 받기
				 //System.out.println(searchType);
				 //System.out.println(searchWord);
				 
				 String sql =" select userid, name, email, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email, point, is_member, to_char(join_date,'yyyy-MM-dd') as join_date, to_char(last_passwd_date, 'yyyy-MM-dd') as last_passwd_date, to_char(last_login_date, 'yyyy-MM-dd') as last_login_date "
						 		+ " from habibi_member " + " where "+searchType+" like '%"+searchWord+"%'";
		
				 
				 pstmt = conn.prepareStatement(sql);
				 
				 rs = pstmt.executeQuery();
			
				 while (rs.next()) {
				
				//if(!"admin".equals(rs.getString("userid"))) {
				 
				  //habibi_member 테이블의 각 컬럼에 해당하는 값을 변수에 담기 !! 
					
					String userid=rs.getString(1);
					String name=rs.getString(2);
					String email=rs.getString(3);
					String address1= rs.getString(4);
				    String address2=rs.getString(5);
					String mobile1=rs.getString(6);
				    String mobile2=rs.getString(7);
					String mobile3=rs.getString(8);
					String is_sms=rs.getString(9);
					String is_email=rs.getString(10);
					int point=rs.getInt(11);
					String is_member=rs.getString(12);
					String join_date=rs.getString(13);
					String last_passwd_date=rs.getString(14);
					String last_login_date=rs.getString(15);
					
					
					MemberVO mvo = new MemberVO(userid, name, email, address1, address2, mobile1, mobile2, mobile3, is_sms, is_email, point, is_member, join_date, last_passwd_date, last_login_date);
					
					memberList.add(mvo);
					
					//}//end of if-----
					
				 }//end of while---
				 
			}//end of try--

				
				 finally { 
					 
					 close(); 
				 }
				 
			     
				 return memberList;
			
			}//end of public List<MemberVO> getMemberInfo(String searchType, String searchWord)

		
		
		//***회원삭제***
		
		@Override
		public int DeleteUser(String useridString) throws SQLException {
			
			int result=0;
			try {
				
				conn=ds.getConnection();
				
				String sql= "update habibi_member set is_member = 0 where userid in ("+useridString+")";
				
				pstmt=conn.prepareStatement(sql);
				
				result=pstmt.executeUpdate();

			}
			finally{
				close();
			}
			return result;
			
		}
		

}//end of InterAdminMemberDAO----
			
		
			
			
