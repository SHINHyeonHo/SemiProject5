package habibi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/*
		 * String method = request.getMethod();
		 * 
		 * if(!"POST".equalsIgnoreCase(method)) { String message = "비정상적인 경로로 들어왔습니다.";
		 * String loc = "javascript:history.back()";
		 * 
		 * request.setAttribute("message", message); request.setAttribute("loc", loc);
		 * 
		 * // super.setRedirect(false); super.setViewPage("/WEB-INF/msg.jsp");
		 * 
		 * return; // execute(HttpServletRequest request, HttpServletResponse response)
		 * 메소드 종료 }
		 * 
		 * String userid = request.getParameter("userid"); String passwd =
		 * request.getParameter("passwd");
		 * 
		 * System.out.println("~~확인용  userid : "+userid);
		 * System.out.println("~~확인용  passwd : "+passwd);
		 */
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/member/login.jsp");
	      
	}

}
