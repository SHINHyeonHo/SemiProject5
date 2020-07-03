package news.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		
		InterNewsDAO ndao=new NewsDAO();
		/////////////////////////////////////////////////////////
		
		String currentPage=request.getParameter("currentPage");
		String sizePerPage=request.getParameter("sizePerPage");
		
		if(currentPage==null)
			currentPage="1";
		
		if(sizePerPage==null)
			sizePerPage="15";
		
		
		HashMap<String,String> paraMap=new HashMap<>();
		paraMap.put("currentPage",currentPage);
		paraMap.put("sizePerPage",sizePerPage);
		////////////////////////////////////////////////////////
		
		String searchWord=request.getParameter("searchWord");
		
		if(searchWord!=null&&!searchWord.trim().isEmpty()) {
			paraMap.put("searchWord",searchWord);
		}
		
		
		List<NewsVO> noticeList=ndao.getNewsList(paraMap);
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("sizePerPage", sizePerPage);
		
	/*	if(noticeList!=null) {//행이 있다면
			
			 * for(NewsVO nvo:noticeList) {
			 * 
			 * JSONObject jsObj = new JSONObject();//이 오브젝트에 넣어
			 * 
			 * jsObj.put("news_no", nvo.getNews_no()); jsObj.put("news_title",
			 * nvo.getNews_title()); jsObj.put("news_writer",nvo.getNews_writer());
			 * jsObj.put("regdate", nvo.getRegdate()); jsObj.put("hit", nvo.getHit());
			 * 
			 * 
			 * jsArr.put(jsObj);
			 * 
			 * 
			 * 
			 * }//end of for---
			 			 
		}//end of if----
*/		
		
		
		//회원전체에 대한 총 페이지 갯수 알아오기 
		
		
		
		
		
		int totalPage=ndao.getTotalPage(paraMap);
		
		
		int pageNo = 1; // 페이지바의 첫 번째           
        
        int loop = 1; // 페이지 순서 증가 1 2 3 ...
        
        int blockSize = 5; // 페이지바 크기
        
        //pageNo 구하기
        pageNo=((Integer.parseInt(currentPage)-1)/blockSize)*blockSize+1;
        
        String pageBar="";
        
        if(searchWord==null) {
        	searchWord="";
        }
        
        // [이전]
        if(pageNo!=1) {
           pageBar += " &nbsp; <a href='list.hb?currentPage="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>[이전]</a> &nbsp  ";
        }
       

                  
        // 페이지바
        while(!(loop > blockSize || pageNo > totalPage)) {
           
              if(pageNo == Integer.parseInt(currentPage)) {
                 pageBar += " &nbsp; <span style='color: red; padding: 2px 4px;'>" + pageNo + "</span> &nbsp; ";           
              } else {   
                 pageBar += " &nbsp; <a href='list.hb?currentPage="+pageNo+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>"+pageNo+"</a>&nbsp;";
              }

              pageNo++;   // 1 2 3 4 5... (pageNo이 1이라면).... 40 41 42
              loop++;   // 1 2 3 4 5 6 7 8 9 10
           
           }
        
        // [다음]
        if(!(pageNo > totalPage)) {
        	pageBar += " &nbsp; <a href='list.hb?currentPage="+pageNo+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>[다음]</a> &nbsp  ";
         
        }
        
        
        
        request.setAttribute("pageBar", pageBar);
        request.setAttribute("searchWord", searchWord);
        
        super.setRedirect(false); 
        super.setViewPage("/WEB-INF/habibi/news/list.jsp");
        
        
		/*
		 * 
		 * 
		 * JSONObject jsObj = new JSONObject();//이 오브젝트에 넣어
		 * 
		 * jsObj.put("noticeList",noticeList); jsObj.put("pageBar", pageBar);
		 * 
		 * String json=jsObj.toString(); request.setAttribute("json", json);
		 * 
		 * //super.setRedirect(false); super.setViewPage("/WEB-INF/jsonResult.jsp");
		 */
		
		
	}

}
