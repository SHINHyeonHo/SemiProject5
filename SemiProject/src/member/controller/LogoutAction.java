package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 세션을 삭제 
		HttpSession session = request.getSession();
		session.invalidate();
		
		super.setRedirect(true);
		super.setViewPage(request.getContextPath()+"/habibi.hb");

	}

}
