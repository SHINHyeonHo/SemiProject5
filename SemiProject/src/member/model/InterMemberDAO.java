package member.model;

import java.sql.SQLException;
import java.util.HashMap;

public interface InterMemberDAO {

	// 회원가입하기
	int registerMember(MemberVO mvo) throws SQLException;
	
	// 아이디 찾기
	String finduserid(HashMap<String, String> paraMap) throws SQLException;
	
}
