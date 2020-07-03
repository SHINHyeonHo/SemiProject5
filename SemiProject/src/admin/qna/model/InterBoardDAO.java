package admin.qna.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {

	// 리스트보기
	List<BoardVO> getQNAList(String searchCategory, String searchName, int start, int end) throws SQLException;

	// 총 문의 개수
	int getQNACount(String searchCategory, String searchName) throws SQLException;

	// 문의 삭제
	int deleteQNA(String qnaNoString) throws SQLException;

	// 상태 변경
	int changeStatus(int qna_status, int qna_no) throws SQLException;

	// 문의 개수
	int getANSCount(int n) throws SQLException;	 

}
