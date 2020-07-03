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
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/habibi/member/login.jsp");
		}
		else if("POST".equalsIgnoreCase(method)) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			HashMap<String, String> paraMap = new HashMap<String, String>();
			
			paraMap.put("userid", userid);
			paraMap.put("passwd", passwd);
			
			InterMemberDAO memberdao = new MemberDAO();
			MemberVO loginuser = memberdao.selectOneMember(paraMap); // 로그인된 정보를 MemberVO에 저장시키기
			
			String goBackURL = request.getContextPath()+"/habibi.hb";
			
			
			if( loginuser != null && loginuser.getIs_member().equalsIgnoreCase("1")) {
				HttpSession session = request.getSession(); // session storage에  임시 저장
				session.setAttribute("loginuser", loginuser);
			//	String is_member = loginuser.getIs_member();
			//	System.out.println("LoginAction getIs_member : "+is_member);
				// 시작페이지로 이동
				super.setRedirect(true);
				super.setViewPage(goBackURL);
				
				session.setMaxInactiveInterval(60*60);
				return;
				
			} 
			else if(loginuser != null && loginuser.getIs_member().equalsIgnoreCase("0")) {
				String message = "탈퇴한 회원계정입니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/Main/msg.jsp");
			}
			else {
				// 로그인 실패시 
				String message = "로그인 실패";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/Main/msg.jsp");
			}
		}
		
	} // end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception

}
