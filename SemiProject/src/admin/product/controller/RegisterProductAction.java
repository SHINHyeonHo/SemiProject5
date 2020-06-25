package admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;
import product.model.ProductVO;

public class RegisterProductAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String prodCode = request.getParameter("prodCode");
		String prodCategory = request.getParameter("prodCategory");
	    String prodName = request.getParameter("prodName");
	    int prodCost = Integer.parseInt(request.getParameter("prodCost"));
	    int prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
	    String prodColor = request.getParameter("prodColor");
		String prodMtl = request.getParameter("prodMtl");
		String prodSize1 = request.getParameter("prodSize1");
		String prodSize2 = request.getParameter("prodSize2");
		String prodSize3 = request.getParameter("prodSize3");
		int prodStatus = Integer.parseInt(request.getParameter("prodStatus"));
		int prodStock = Integer.parseInt(request.getParameter("prodStock"));
		
		String prodSize = "w"+prodSize1+" x d"+prodSize2+" x h"+prodSize3+" mm";
		
	    ProductVO pvo = new ProductVO();
	    pvo.setProd_code(prodCode);
	    pvo.setProd_category(prodCategory);
	    pvo.setProd_name(prodName);
	    pvo.setProd_cost(prodCost);
	    pvo.setProd_price(prodPrice);
	    pvo.setProd_color(prodColor);
	    pvo.setProd_mtl(prodMtl);
	    pvo.setProd_size(prodSize);
	    pvo.setProd_status(prodStatus);
	    pvo.setProd_stock(prodStock);

	    
		InterAdminProductDAO adao = new AdminProductDAO();
	    int result = adao.registerProduct(pvo);
	    System.out.println("상품등록 : "+result);	
	}

}
