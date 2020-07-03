package admin.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.qna.model.*;
import common.controller.AbstractController;

public class ChangeStatusAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String data = request.getParameter("data");
		String[] status = data.split(",");
	
		int qna_status = -1;
		
		if("등록중".equalsIgnoreCase(status[0].trim())) {
			qna_status = 1;
		}
		else {
			qna_status = 0;
		}
		
		String no = status[1];
		int qna_no = Integer.parseInt(no);
				
		InterBoardDAO bdao = new BoardDAO();
		int result = bdao.changeStatus(qna_status, qna_no);
		System.out.println("상태변경 성공  : "+result);
		
	}
	
}
