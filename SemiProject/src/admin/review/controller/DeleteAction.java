package admin.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.review.model.BoardDAO;
import common.controller.AbstractController;

public class DeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String revNoString = request.getParameter("revNoString");
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.deleteREV(revNoString);
		
		System.out.println("삭제된 REV 게시글: " + result);
   
	}

}

