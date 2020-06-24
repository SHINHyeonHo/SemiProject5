package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MyInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한 회원에 대한 모든 정보 불러오기
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
			// 비정상적인 접근 막기
			String message = "먼저 로그인 해야 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;
		}
		
		String idx = request.getParameter("idx");
		
		System.out.println(idx);
		/*
		InterMemberDAO mdao = new MemberDAO();
		MemberVO mvo = mdao.myInfo(idx);
		request.setAttribute("mvo", mvo);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/member/myInfo.jsp");
		*/
	}

}
