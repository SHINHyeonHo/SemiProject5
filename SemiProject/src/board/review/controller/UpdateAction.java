package board.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class UpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;
		}
		
		else {
			request.setCharacterEncoding("UTF-8");
			
			int revNo = Integer.parseInt(request.getParameter("revNo"));
			String rev_title = request.getParameter("rev_title");
			String rev_content = request.getParameter("rev_content");
			
			BoardVO bvo = new BoardVO();
			bvo.setRev_title(rev_title);
			bvo.setRev_content(rev_content);
			
			BoardDAO bdao = new BoardDAO();
			int result =  bdao.updateREV(bvo, revNo);
			
			System.out.println("REV 게시글 수정 : " + result);
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/update.jsp");

	      
	}

}

