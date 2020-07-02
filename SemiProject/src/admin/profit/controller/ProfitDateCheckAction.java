package admin.profit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.profit.model.AdminProfitDAO;
import admin.profit.model.InterAdminProfitDAO;
import common.controller.AbstractController;

public class ProfitDateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String orderCodes = request.getParameter("orderCodes");
		
		InterAdminProfitDAO pao = new AdminProfitDAO();
		int result = pao.ProfitDateCheck(orderCodes);
		
	}

}
