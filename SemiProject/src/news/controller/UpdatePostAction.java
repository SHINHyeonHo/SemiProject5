package news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;

public class UpdatePostAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String news_no=request.getParameter("news_no");
		request.setAttribute(news_no, news_no);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/news/updatepost.jsp");
		
		
		
		

	}

}
