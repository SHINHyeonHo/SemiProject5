package news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;

public class NewsDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String news_no=request.getParameter("news_no");
		InterNewsDAO ndao=new NewsDAO();
		int result=ndao.hitCount(news_no);
		//System.out.println("조회수증가:"+result);
		NewsVO nvo=ndao.newsDetail(news_no);
		request.setAttribute("nvo", nvo);
		
		
		super.setViewPage("/WEB-INF/habibi/news/detail.jsp");
	}

}
