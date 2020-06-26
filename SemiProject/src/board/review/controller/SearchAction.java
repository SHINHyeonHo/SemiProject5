package board.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class SearchAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		String search = request.getParameter("search");
		
		BoardDAO bao = new BoardDAO();
		List<BoardVO> searchREVPost =  bao.getREVList(prodCode, search);
					
		request.setAttribute("searchREVPost", searchREVPost);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/search.jsp");
   			
	}
}

