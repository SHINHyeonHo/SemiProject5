package admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;

public class ChangeStockAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String data = request.getParameter("data");
		String[] stock = data.split(",");
		
		System.out.println(stock[0]);
		System.out.println(stock[1]);

		int prodStock = Integer.parseInt(stock[0]);
		String prodCode = stock[1];
		
		InterAdminProductDAO pdao = new AdminProductDAO();
		int result = pdao.changeProductStock(prodStock, prodCode);
		System.out.println("수량변경 성공  : "+result);
		
		
	}

	
	
	
}
