package admin.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.qna.model.BoardDAO;
import common.controller.AbstractController;

public class DeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String qnaNoString = request.getParameter("qnaNoString");
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.deleteQNA(qnaNoString);
		
		System.out.println("삭제된 QNA 게시글: " + result);
   
	}

}

