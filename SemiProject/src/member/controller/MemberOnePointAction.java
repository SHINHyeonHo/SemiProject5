package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberOnePointAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		
		String userid = loginuser.getUserid();
		
		InterMemberDAO mdao = new MemberDAO();
		List<PointVO> pointList = mdao.memberOnePoint(userid);
		
//		for(int i=0; i<pointList.size(); i++) {
//			System.out.println("MemberOnePoint : " + pointList.get(i).getPoint());
//		}
		
		request.setAttribute("pointList", pointList);
		
		int pointSum = 0;
		
		for(int i=0; i<pointList.size(); i++) {
			pointSum += pointList.get(i).getPoint();
		}
		
		request.setAttribute("pointSum", pointSum);
		
		super.setViewPage("/WEB-INF/habibi/member/memberOnePoint.jsp");
		
		
		
	}

}
