package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;
import common.controller.AbstractController;

public class ListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if(!"GET".equalsIgnoreCase(method)) {
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
			
			String prodCode = request.getParameter("prodCode");
			
			BoardDAO bao = new BoardDAO();
			List<BoardVO> qnaList =  bao.getQNAList(prodCode);
						
			request.setAttribute("qnaList", qnaList);
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/qna/list.jsp");
   
	}

}

