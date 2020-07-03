package board.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.model.BoardDAO;
import board.qna.model.BoardVO;
import common.controller.AbstractController;

public class ReplyInsertAction extends AbstractController {

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

			String qna_title = request.getParameter("qna_title");
			String fk_userid = request.getParameter("fk_userid");
			String qna_content = request.getParameter("qna_content");
			String secret = request.getParameter("qna_secret");
			if(secret==null)
				secret="0";
			
			int qna_secret = Integer.parseInt(secret);
			String fk_prod_code = request.getParameter("fk_prod_code");
			int re_ref = Integer.parseInt(request.getParameter("re_ref"));
			int re_seq = Integer.parseInt(request.getParameter("re_seq"));
			int re_lev = Integer.parseInt(request.getParameter("re_lev"));
			
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
						
			BoardVO bvo = new BoardVO();
			BoardDAO bdao = new BoardDAO();			

			int update = bdao.updateDone(qnaNo);
			System.out.println("QNA 답변 완료 : " + update);
			
			bvo.setQna_title(qna_title);
			bvo.setFk_userid(fk_userid);
			bvo.setQna_content(qna_content);
			bvo.setQna_secret(qna_secret);
			bvo.setFk_prod_code(fk_prod_code);
			bvo.setRe_ref(re_ref);
			bvo.setRe_seq(re_seq);
			bvo.setRe_lev(re_lev);
			
			int result =  bdao.insertRE(bvo);
						
			System.out.println("QNA 답글 등록 : " + result);
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/REinsert.jsp");

	      
	}

}

