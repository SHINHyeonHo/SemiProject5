package board.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.model.BoardDAO;
import board.qna.model.BoardVO;
import common.controller.AbstractController;

public class ReplyWriteAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		BoardDAO bao = new BoardDAO();
		
		BoardVO viewQNA =  bao.viewQNA(prodCode, qnaNo);
				
		request.setAttribute("viewQNA", viewQNA);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/REwrite.jsp");
	}	

}
