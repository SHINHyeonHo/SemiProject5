package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.*;
import common.controller.AbstractController;

public class ModifyCMTAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String cmt_content = request.getParameter("cmt_content");
		int cmt_no = Integer.parseInt(request.getParameter("cmt_no"));
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.modifyCMT(cmt_content, cmt_no);
		
		System.out.println("댓글 수정 : " + result);
   
	}

}

