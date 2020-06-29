package member.model;

import java.sql.SQLException;
import java.util.HashMap;

public interface InterMemberDAO {

	// 회원가입하기( insert )
	int registerMember(MemberVO mvo) throws SQLException;
	
	// ID중복 검사 (userid가 중복이 없어서 사용가능하다라면 true, userid가 이미 존재하여 사용 불가능하면 false 를 리턴) 
	boolean idDuplicateCheck(String userid) throws SQLException;
	
	// 로그인 메소드
	MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException ;
	
	// 아이디 찾기(성명 휴대폰 번호로 찾기)
	String finduserid(HashMap<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기(아이디 이메일주소로 찾기)
	boolean isUserExist(HashMap<String, String> paraMap) throws SQLException;

	// 비밀번호 업데이트 하기
	int passwdUpdate(String passwd, String userid) throws SQLException;

	// MyInfo 페이지 생성
	MemberVO myInfo(String idx) throws SQLException;
	
}
