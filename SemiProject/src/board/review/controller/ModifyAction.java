package board.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.model.BoardDAO;
import board.review.model.BoardVO;
import common.controller.AbstractController;

public class ModifyAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String prodCode = request.getParameter("prodCode");
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		
		BoardDAO bao = new BoardDAO();
		BoardVO modifyREV =  bao.viewREV(prodCode, revNo);
					
		request.setAttribute("modifyREV", modifyREV);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/board/review/modify.jsp");
   
	}

}

