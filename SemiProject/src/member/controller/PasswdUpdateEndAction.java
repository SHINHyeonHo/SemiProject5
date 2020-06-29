package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.*;

public class PasswdUpdateEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String userid = request.getParameter("userid");
		
		if("POST".equalsIgnoreCase(method)) {
			String passwd = request.getParameter("passwd");
			
			InterMemberDAO memberdao = new MemberDAO();
			int n = memberdao.passwdUpdate(passwd, userid);
			
			request.setAttribute("n", n);
		}
		request.setAttribute("method", method);
		request.setAttribute("userid", userid);
		
		super.setViewPage("/WEB-INF/habibi/member/passwdUpdateEnd.jsp");
		
	}

}
