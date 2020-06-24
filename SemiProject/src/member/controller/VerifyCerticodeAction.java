package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class VerifyCerticodeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userid = request.getParameter("userid");
		String userCertificationCode = request.getParameter("userCertificationCode");
		
		HttpSession session = request.getSession();
		String certificationCode = (String)session.getAttribute("certificationCode");
		
		String message = "";
	 	String loc = "";
	 	
	 	if( certificationCode.equals(userCertificationCode) ) {
	 		message = "인증이 성공되었습니다";
	 		loc = request.getContextPath()+"/member/passwdUpdateEnd.hb?userid="+userid;
	 	}
	 	else {
	 		message = "발급된 인증코드가 아닙니다. 인증코드를 다시 발급받으세요!!";
	 		loc = request.getContextPath()+"/member/passwdFind.hb";
	 	}
		
	 	request.setAttribute("message", message);
	 	request.setAttribute("loc", loc);
	 	
	 	super.setViewPage("/WEB-INF/Main/msg.jsp");
	 	
	 	session.removeAttribute("certificationCode"); // 저장된 인증코드 삭제	
	}

}
