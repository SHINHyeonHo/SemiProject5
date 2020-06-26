package admin.member.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import member.model.MemberVO;
import product.model.ProductVO;

public interface InterAdminMemberDAO {
	
	//회원조회
	List<MemberVO> getMemberInfo(String searchType, String searchWord) throws SQLException;

	int DeleteUser(String useridString) throws SQLException;

	//회원조회
	//List<MemberVO> getMemberInfo(HashMap<String,String> paraMap) throws SQLException;
	
	//회원삭제(강제탈퇴)
	//int DeleteProduct(String deleteCheck) throws SQLException;

}