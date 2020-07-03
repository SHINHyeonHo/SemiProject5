package admin.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.review.model.*;
import common.controller.AbstractController;

public class ChangeStatusAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String data = request.getParameter("data");
		String[] status = data.split(",");
	
		int rev_status = -1;
		
		if("등록중".equalsIgnoreCase(status[0].trim())) {
			rev_status = 1;
		}
		else {
			rev_status = 0;
		}
		
		String no = status[1];
		int rev_no = Integer.parseInt(no);
				
		InterBoardDAO bdao = new BoardDAO();
		int result = bdao.changeStatus(rev_status, rev_no);
		System.out.println("상태변경 성공  : "+result);
		
	}
	
}
