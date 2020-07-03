package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class MemberdelAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogin = super.checkLogin(request);
		
		String idx = request.getParameter("idx");
		
		HttpSession session = request.getSession();
		
		
		if(!isLogin) {
			String goBackURL = request.getParameter("goBackURL");
			
			session.setAttribute("goBackURL", goBackURL);
			
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			return;
		}
		else {
			
			InterMemberDAO memberdao = new MemberDAO();
			int n = memberdao.memberOneDelete(idx);
			
			request.setAttribute("n", n);
			
		}
		request.setAttribute("idx", idx);
		
		session.invalidate();
		super.setViewPage("/WEB-INF/habibi/main/main.jsp");
		
		
	}

}
