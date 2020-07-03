package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.*;
import common.controller.AbstractController;

public class InsertCMTAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String cmt_content = request.getParameter("cmt_content");
		String fk_userid = request.getParameter("fk_userid");
		int fk_rev_no = Integer.parseInt(request.getParameter("fk_rev_no"));

		CommentVO cvo = new CommentVO();
		cvo.setFk_userid(fk_userid);
		cvo.setCmt_content(cmt_content.replaceAll("\r\n", "<br/>"));
		cvo.setFk_rev_no(fk_rev_no);

		InterBoardDAO bao = new BoardDAO();
		bao.insertCMT(cvo);
	}
}
