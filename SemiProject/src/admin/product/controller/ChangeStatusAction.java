package admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;

public class ChangeStatusAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String data = request.getParameter("data");
		String[] status = data.split(",");
	
		int prodStatus = -1;
		if("판매중".equalsIgnoreCase(status[0].trim())) {
			prodStatus = 1;
		}
		else {
			prodStatus = 0;
		}
		
		String prodCode = status[1];
				
		InterAdminProductDAO pdao = new AdminProductDAO();
		int result = pdao.changeProductStatus(prodStatus, prodCode);
		System.out.println("상태변경 성공  : "+result);
		
		
	}
	
}
