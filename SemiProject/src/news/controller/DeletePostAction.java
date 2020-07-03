package news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import news.model.InterNewsDAO;
import news.model.NewsDAO;
import news.model.NewsVO;

public class DeletePostAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		String news_no=request.getParameter("news_no");
		System.out.println(news_no);
		InterNewsDAO ndao=new NewsDAO();
		
		int result=ndao.deletePost(news_no);
		
		System.out.println(result);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/news/delete.jsp");

	}

}
