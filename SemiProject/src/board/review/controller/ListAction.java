package board.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.CommentVO;
import common.controller.AbstractController;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		String page_ = request.getParameter("p");		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
				
		String field = "rev_title";
		if(field_ != null && !field_.equals(""))
			field = field_;
		
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;	
		
		int page = 1;
		if(page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);
		
		BoardDAO bao = new BoardDAO();
		List<CommentVO> revList =  bao.getREVList(prodCode, field, query, page);
		int count = bao.getREVCount(prodCode, field, query);
		
		request.setAttribute("revList", revList);
		request.setAttribute("count", count);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/list.jsp");
   
	}

}

