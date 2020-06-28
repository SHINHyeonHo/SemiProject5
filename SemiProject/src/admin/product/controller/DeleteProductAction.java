package admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;

public class DeleteProductAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String prodCodeString = request.getParameter("prodCodeString");
		
		InterAdminProductDAO adao = new AdminProductDAO();
		int result = adao.DeleteProduct(prodCodeString);
		System.out.println("상품삭제 개수 : "+result);
		
	}

}
