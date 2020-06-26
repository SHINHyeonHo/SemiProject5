package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class MemberEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) {
			// 로그인을 한 경우
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			String idx = request.getParameter("idx");
		//	System.out.println(idx);
			if(String.valueOf(loginuser.getIdx()).equals(idx)) {
				//로그인한 idx값과 MemberVO(오라클)의 idx값이 일치한다면 회원정보 수정페이지로 이동한다.
				super.setViewPage("/WEB-INF/habibi/member/memberEdit.jsp");
			}
			else {
				//로그인한 idx값과 MemberVO(오라클)의 idx값이 불일치한다면 경고창 팝업
				String message = "다른 사용자의 정보 변경은 불가합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setViewPage("/WEB-INF/Main/msg.jsp");
				return;
			}
		}
		else {
			// 로그인을 안한 경우
			String message = "먼저 로그인을 하세요.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;
			
			
			
		}
		
		
	} // end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception

}