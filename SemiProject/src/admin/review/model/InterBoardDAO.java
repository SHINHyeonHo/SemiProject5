package admin.review.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {
	
	// 리스트 보기
	List<BoardVO> getREVList(String searchCategory, String searchName, int start, int end) throws SQLException;
	
	// 최근 리뷰
	int getNewREVCount() throws SQLException;

	// 상태 변경
	int changeStatus(int rev_status, int rev_no) throws SQLException;

	// 리뷰 삭제
	int deleteREV(String revNoString) throws SQLException;

	// 리뷰 개수
	int getREVCount(String searchCategory, String searchName) throws SQLException;
}
