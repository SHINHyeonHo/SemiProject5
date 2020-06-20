package member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class LoginAction extends AbstractController {

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
		
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("userid", userid);
		paraMap.put("passwd", passwd);
		
		InterMemberDAO memberdao = new MemberDAO();
		
		/*
		 * MemberVO loginuser = memberdao.selectOneMember(paraMap);
		 * 
		 * if(loginuser != null) { HttpSession session = request.getSession();
		 * session.setAttribute("loginuser", loginuser); }
		 * 
		 * super.setViewPage("/WEB-INF/habibi/main/main.jsp");
		 */
	      
	}

}
