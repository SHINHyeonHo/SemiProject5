package news.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NewsDAO implements InterNewsDAO {
	

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	// 생성자 
	public NewsDAO() {
		// 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화
		
		try {
		    Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle5");
		} catch (NamingException e) {
			e.printStackTrace();
		}	
	}
	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if(rs != null) { rs.close(); rs=null; }
			if(pstmt != null) { pstmt.close(); pstmt=null; } 
			if(conn != null) { conn.close(); conn=null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end of public void close() ---------------------------

	
	//페이징 처리를 한 news List(게시글 리스트) 

	
	
	
	  @Override public List<NewsVO> getNewsList(HashMap<String, String> paraMap) throws
	  SQLException {
	 
	  List<NewsVO> noticeList=new ArrayList<>(); //view 단으로 이동하게 될 변수 설정하기
	  
	  try {
	  
		  conn=ds.getConnection();
		  
		  String searchWord=paraMap.get("searchWord");
		  
		  String sql = " select news_no, news_title, news_writer, regdate, hit, is_post " + 
				  	   " from 	" + 
				  	   "(  " + 
				  		"  select rownum AS RNO, news_no, news_title, news_writer, regdate, hit, is_post " + 
				  		"  from " + 
				  		"  ( " + 
				  		"    select to_number(news_no) AS news_no, news_title, news_writer, to_char(regdate,'yyyy-MM-dd') as regdate, hit, is_post " + 
				  		"    from habibi_news ";
		  
		  if(searchWord != null && !searchWord.trim().isEmpty()) {
			  	 sql += " where news_title like '%'||?||'%' ";
		  }//end of if------------------
		  
				 sql += "order by news_no desc"+
				  		"  ) V " + 
				  		") T " + 
				  		"where RNO between ? and ? ";
		  
		  if(searchWord != null && !searchWord.trim().isEmpty()) {
			  pstmt=conn.prepareStatement(sql);
			  
			  int currentPage=Integer.parseInt(paraMap.get("currentPage"));
			  int sizePerPage=Integer.parseInt(paraMap.get("sizePerPage"));
			  
			  pstmt.setString(1, searchWord);
			  pstmt.setInt(2,(currentPage * sizePerPage) - (sizePerPage - 1) );
			  pstmt.setInt(3, (currentPage * sizePerPage)); // 공식
			 //테이블의 행들 resultset에 담기.
		   }//end of if------------------		 
		  
		  else {
			  pstmt=conn.prepareStatement(sql);
			  
			  int currentPage=Integer.parseInt(paraMap.get("currentPage"));
			  int sizePerPage=Integer.parseInt(paraMap.get("sizePerPage"));
			  
			  pstmt.setInt(1,(currentPage * sizePerPage) - (sizePerPage - 1) );
			  pstmt.setInt(2, (currentPage * sizePerPage)); // 공식
			 //테이블의 행들 resultset에 담기.
		  }
		  	
		  rs=pstmt.executeQuery(); 
		 
		  while(rs.next()) {//select된 행이 있을 경우
			  String news_no=rs.getString(1); 
			  String news_title=rs.getString(2); 
			  String news_writer=rs.getString(3); 
			  String regdate=rs.getString(4); 
			  int hit=rs.getInt(5);
			  String is_post=rs.getString(6);
			  	 
			  NewsVO lvo= new NewsVO(news_no, news_title, news_writer, regdate, hit, is_post);
			  
			  noticeList.add(lvo); 
		  }// end of while---------------------------
	 
	  } finally {
	  
		  close();
	  
	  }//end of finally----
	  
	  return noticeList;
	  
 }//end of getListInfo()-------

	  
	  
	 //페이징 처리를 위한 전체회원에 대한 총 페이지 개수 가져오기 

		@Override
		public int getTotalPage(HashMap<String, String> paraMap) throws SQLException {
			
			int totalPage=0;
			
			try {
				conn=ds.getConnection();
				
				String searchWord=paraMap.get("searchWord");
				
				String sql = " select ceil(count(*)/?) AS totalPage "
						+" from habibi_news ";
				
				if(searchWord != null && !searchWord.trim().isEmpty()) {
					sql+=" where news_title like '%'||?||'%' ";   
				}
				
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1,Integer.parseInt(paraMap.get("sizePerPage")));
	
				if(searchWord != null && !searchWord.trim().isEmpty()) {
					pstmt.setString(2, searchWord);   
				}
				
				rs=pstmt.executeQuery();
				rs.next();
				totalPage=rs.getInt("totalPage");
				
			}
			finally {
				
				close();
			}
			
			
			return totalPage;
			
		}

	 
	
	//게시글 상세 페이지 
	  
	  
	  @Override
		public NewsVO newsDetail(String newsno) throws SQLException {
			
			NewsVO newsDetail=new NewsVO();
			
			try {
				conn=ds.getConnection();
				
				String sql = " select news_no, news_title, news_writer, news_content, to_char(regdate,'yyyy-MM-dd') as regdate, hit, files "
					+" from habibi_news "
					+" where news_no= ? ";
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,newsno);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					
					 String news_no=rs.getString(1);
					 String news_title=rs.getString(2);
					 String news_writer=rs.getString(3);
					 String news_content=rs.getString(4);
					 String regdate=rs.getString(5);
					 int hit=rs.getInt(6);
					 String files=rs.getString(7);
					 
					 
					 NewsVO nvo=new NewsVO(news_no, news_title, news_writer, news_content, regdate,hit, files);
					 
					 newsDetail=nvo;
					
				}
			}	
			finally {
				
				close();
				
			}
				
			
			return newsDetail;
			
			
			
		}
	  
	  

	  
	  
	//조회수 증가   
	  
	@Override
	public int hitCount(String news_no) throws SQLException {
		
		
		int result=0;
		
		
		try {
			conn=ds.getConnection();
			
			String sql = " update habibi_news "
					     + " set hit=hit+1 "
					     + " where news_no=? ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,news_no);
			
			result=pstmt.executeUpdate();
		
		}	
		finally {
			
			close();
			
		}
			
		
		return result;
	
	}

	//게시글 작성하기 
	
	@Override
	public int registerPost(NewsVO nvo) throws SQLException{
		
		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " insert into habibi_news (news_no, news_title, news_writer, news_content, regdate, hit, files) " + 
					" values (seq_news_no.nextval, ?, ?, ?, default,default, ?) ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nvo.getNews_title());
			pstmt.setString(2, nvo.getNews_writer());
			pstmt.setString(3, nvo.getNews_content());
			pstmt.setString(4, nvo.getFiles());

	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}

	//게시글 삭제하기 
	@Override
	public int deletePost(String news_no) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_news "  + 
						" set is_post = 0 "+
						" where news_no = ? ";
			

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, news_no);
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}

//게시글 수정하기 
	@Override
	public int modifyPost(NewsVO nvo) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " update habibi_news "+
					" set news_title= ? "+
					" , news_writer= ? "+
					" , news_content= ? "+
					" where news_no=? ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nvo.getNews_title());
			pstmt.setString(2, nvo.getNews_writer());
			pstmt.setString(3, nvo.getNews_content());
			pstmt.setString(4, nvo.getNews_no());
			
	        result = pstmt.executeUpdate();
	        
		} finally {
			close();
		}
		
		return result;
	}
		
		
		
		
	}




	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	

	
	
	
	
	
	
	
	
	
	
	
	
	

