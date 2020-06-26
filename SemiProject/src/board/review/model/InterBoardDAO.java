package board.review.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {
	
	// 리스트 보기
	List<BoardVO> getREVList(String prodCode, String search) throws SQLException;

	// 게시글 작성
	int insertREV(BoardVO bvo) throws SQLException;

	// 게시글 보기
	BoardVO viewREV(String prodCode, int revNo) throws SQLException;

	// 게시글 삭제
	int deleteREV(BoardVO bvo, int revNo) throws SQLException;

	// 게시글 수정
	int updateREV(BoardVO bvo, int revNo) throws SQLException;

	// 조회수 증가
	int increaseREVCnt(int revNo) throws SQLException;
}
