package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class ViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		
		BoardDAO bao = new BoardDAO();
		
		int result = bao.increaseREVCnt(revNo);
		System.out.println("REV 게시글 조회수 증가 : " + result);
		
		BoardVO viewREV =  bao.viewREV(prodCode, revNo);
					
		request.setAttribute("viewREV", viewREV);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/view.jsp");
   
	}

}

