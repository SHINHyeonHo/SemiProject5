package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class EmailCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String email = request.getParameter("email");
		
		InterMemberDAO memberdao = new MemberDAO();
		
		boolean isUse = memberdao.isEmailExist(email);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isUse", isUse);	
	
		String json = jsonObj.toString();
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/Main/jsonview.jsp");
		
	}

}
