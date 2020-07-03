package news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;

public class ModifyPostAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
	    String content = request.getParameter("content");
		String news_no= request.getParameter("news_no");
		
		System.out.println(news_no);
		
		NewsVO nvo=new NewsVO();
		   
		   nvo.setNews_title(title);
		   nvo.setNews_writer(writer);
		   nvo.setNews_content(content);
		   nvo.setNews_no(news_no);
		   
		InterNewsDAO ndao=new NewsDAO();
		int result=ndao.modifyPost(nvo);
		System.out.println(result);
		
		
		
		request.setAttribute(news_no, news_no);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/news/modify.jsp");
	
	

	}

}
