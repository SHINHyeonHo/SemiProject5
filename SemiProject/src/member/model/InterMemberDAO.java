package member.model;

import java.sql.SQLException;
import java.util.HashMap;

public interface InterMemberDAO {

	// 로그인한 회원 정보 가져오기.
	MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException;
	
}
