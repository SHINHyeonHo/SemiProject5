package board.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {

	// >> Q&A << // 
	
	// 리스트 보기
	List<BoardVO> getQNAList(String prod_code) throws SQLException;

	// 게시글 작성
	int insertQNA(BoardVO bvo) throws SQLException;

	// 게시글 보기
	List<BoardVO> viewQNAPost(String prodCode, int qnaNo) throws SQLException;
}
