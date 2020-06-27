package board.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		
		BoardDAO bao = new BoardDAO();
		List<BoardVO> revList =  bao.getREVList(prodCode, "");
					
		request.setAttribute("revList", revList);
			
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/list.jsp");
   
	}

}

