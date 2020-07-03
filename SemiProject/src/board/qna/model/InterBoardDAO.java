package board.qna.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {
	
	// 리스트 보기
	List<BoardVO> getQNAList(String prodCode, String field, String query, int page) throws SQLException;

	// 게시글 작성
	int insertQNA(BoardVO bvo) throws SQLException;

	// 게시글 보기
	BoardVO viewQNA(String prodCode, int qnaNo) throws SQLException;

	// 게시글 삭제
	int deleteQNA(BoardVO bvo, int qnaNo) throws SQLException;

	// 게시글 수정
	int updateQNA(BoardVO bvo, int qnaNo) throws SQLException;

	// 조회수 증가
	int increaseQNACnt(int qnaNo) throws SQLException;

	// 답글 작성
	int insertRE(BoardVO bvo) throws SQLException;

	// 답변 여부
	int updateDone(int qnaNo) throws SQLException;

}
