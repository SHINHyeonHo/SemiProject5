package admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.member.model.AdminMemberDAO;
import admin.member.model.InterAdminMemberDAO;
import common.controller.AbstractController;

public class DeleteMemberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String useridString=request.getParameter("useridString");
		
		InterAdminMemberDAO mdao= new AdminMemberDAO();
		int result=mdao.DeleteUser(useridString);
		

	}

}
