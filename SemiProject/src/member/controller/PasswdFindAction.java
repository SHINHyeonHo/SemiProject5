package member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;


public class PasswdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
	//	System.out.println("확인용 method : "+method);
		
		if("POST".equalsIgnoreCase(method)) {
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			
			InterMemberDAO memberdao = new MemberDAO();
			
			HashMap<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("email", email);
			boolean isUserExist = memberdao.isUserExist(paraMap);
			
			int n = 0; // 회원 구분 여부
			
			if(isUserExist) {
				n = 1;
				Random rnd = new Random();
				String certificationCode = "";
				
				int randnum = 0;
				char randchar = ' ';
				
					for(int i=0; i<5; i++) {
						randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
						certificationCode += randchar;
					}
				
					for(int i=0; i<7; i++) {
						randnum = rnd.nextInt(9 - 0 + 1) + 0;
						certificationCode += randnum;
					}
					
				GoogleMail mail = new GoogleMail();
				
				HttpSession session = request.getSession();
				
				try {
					mail.sendmail(email, certificationCode);
					session.setAttribute("certiCode", certificationCode);
				} catch (Exception e) {
					e.printStackTrace();
					n = -1;
				}
				
			} // end of if(isUserExist)
			
			else {
				n = 0;
			}
			request.setAttribute("n", n);
			request.setAttribute("userid", userid);
			request.setAttribute("email", email);
		} // end of if("POST".equalsIgnoreCase(method))
		
		request.setAttribute("method", method);
		
		super.setViewPage("/WEB-INF/habibi/member/passwdFind.jsp");
		
	} // end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception

}
