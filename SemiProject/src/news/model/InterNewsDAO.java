package news.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterNewsDAO {


	//게시물 검색,조회
	List<NewsVO> getNewsList(HashMap<String, String> paraMap) throws SQLException;

	//게시글 상세페이지
	NewsVO newsDetail(String news_no) throws SQLException ;
	
	//조회수 증가
	int hitCount(String news_no) throws SQLException;
	
	//전체회원에 대한 총페이지 갯수 가져오기 (select)
	int getTotalPage(HashMap<String, String> paraMap) throws SQLException;

	//게시글 작성하기 
	
	int registerPost(NewsVO nvo) throws SQLException;

	//글 삭제하기
	int deletePost(String news_no) throws SQLException;

	// 공지사항 수정 
	int modifyPost(NewsVO nvo) throws SQLException;
	
	
	
	

}
