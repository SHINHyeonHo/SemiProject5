package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.*;
import common.controller.AbstractController;

public class DeleteCMTAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		int cmt_no = Integer.parseInt(request.getParameter("cmt_no"));
		
		BoardDAO bdao = new BoardDAO();
		int result =  bdao.deleteCMT(cmt_no);
		
		System.out.println("댓글 삭제 : " + result);	
   
	}

}

