package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;


public class MemberEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로를 통해 들어왔습니다.!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
			
		}
		else {
			String idx = request.getParameter("idx");
			String name = request.getParameter("name");
			String passwd = request.getParameter("passwd");
			String email = request.getParameter("email");
			String mobile1 = request.getParameter("mobile1");
			String mobile2 = request.getParameter("mobile2");
			String mobile3 = request.getParameter("mobile3");
			String postcode = request.getParameter("postcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			MemberVO membervo = new MemberVO();
			membervo.setIdx(Integer.parseInt(idx));
			membervo.setName(name);
			membervo.setPasswd(passwd);
			membervo.setEmail(email);
			membervo.setMobile1(mobile1);
			membervo.setMobile2(mobile2);
			membervo.setMobile3(mobile3);
			membervo.setPostcode(postcode);
			membervo.setAddress1(address1);
			membervo.setAddress2(address2);
			
			InterMemberDAO memberdao = new MemberDAO();
			
			int n = memberdao.updateMember(membervo);
			
			String message = "";
			if(n==1) {
				message = "회원정보 수정 성공";
				
				//session에 저장되어진 loginuser의 값을 변경해준다.
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
				
				loginuser.setName(name);
				loginuser.setEmail(email);
				loginuser.setMobile1(mobile1);
				loginuser.setMobile2(mobile2);
				loginuser.setMobile3(mobile3);
				loginuser.setPostcode(postcode);
				loginuser.setAddress1(address1);
				loginuser.setAddress2(address2);
				
				session.setAttribute("loginuser", loginuser);
			}
			else {
				message = "회원정보 수정 실패";
			}
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
		}
		
	}

}
