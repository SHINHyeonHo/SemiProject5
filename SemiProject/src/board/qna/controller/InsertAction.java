package board.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.model.BoardDAO;
import board.qna.model.BoardVO;
import common.controller.AbstractController;

public class InsertAction extends AbstractController {

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
			
			String qna_category = request.getParameter("qna_category");
			String qna_title = request.getParameter("qna_title");
			String fk_userid = request.getParameter("fk_userid");
			String qna_content = request.getParameter("qna_content");
			String qna_passwd = request.getParameter("qna_passwd");
			String fk_prod_code = request.getParameter("fk_prod_code");
			
			BoardVO bvo = new BoardVO();
			bvo.setQna_category(qna_category);
			bvo.setQna_title(qna_title);
			bvo.setFk_userid(fk_userid);
			bvo.setQna_content(qna_content);
			bvo.setQna_passwd(qna_passwd);
			bvo.setFk_prod_code(fk_prod_code);
			
			BoardDAO bdao = new BoardDAO();
			int result =  bdao.insertQNA(bvo);
			
			System.out.println("QNA 게시글 등록 : " + result);
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/insert.jsp");

	      
	}

}
