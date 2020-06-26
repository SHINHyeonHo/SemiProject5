package board.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.model.BoardDAO;
import board.qna.model.BoardVO;
import common.controller.AbstractController;

public class DeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		BoardVO bvo = new BoardVO();
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.deleteQNA(bvo, qnaNo);
		
		System.out.println("QNA 게시글 삭제 : " + result);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/delete.jsp");
   
	}

}

