package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class DeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		
		BoardVO bvo = new BoardVO();
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.deleteREV(bvo, revNo);
		
		System.out.println("REV 게시글 삭제 : " + result);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/delete.jsp");
   
	}

}

