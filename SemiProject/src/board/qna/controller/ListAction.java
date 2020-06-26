package board.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.model.BoardDAO;
import board.qna.model.BoardVO;
import common.controller.AbstractController;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		
		BoardDAO bao = new BoardDAO();
		List<BoardVO> qnaList =  bao.getQNAList(prodCode, "");
					
		request.setAttribute("qnaList", qnaList);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/list.jsp");
   
	}

}

