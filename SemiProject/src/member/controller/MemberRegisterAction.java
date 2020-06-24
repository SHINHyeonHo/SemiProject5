package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.*;

public class MemberRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("/WEB-INF/habibi/member/memberRegister.jsp");
		}
		else {
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String smsad = request.getParameter("smsad");
			String emailad = request.getParameter("emailad");
			
			MemberVO mvo = new MemberVO();
			mvo.setName(name);
			mvo.setUserid(userid);
			mvo.setPasswd(pwd);
			mvo.setEmail(email);
			mvo.setMobile1(hp1);
			mvo.setMobile2(hp2);
			mvo.setMobile3(hp3);
			mvo.setPostcode(postcode);
			mvo.setAddress1(address);
			mvo.setAddress2(detailAddress);
			mvo.setIs_sms(smsad);
			mvo.setIs_email(emailad);
			
			InterMemberDAO mdao = new MemberDAO();
			
			int n = mdao.registerMember(mvo);
			
			String message = "";
			String loc = "";
			
			if(n==1) {
				message = "회원가입 성공";
				loc = request.getContextPath()+"/habibi.hb";
			}
			else {
				message = "회원가입 실패";
				loc = "javascript: history.back()";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
		}
		

	}

}
