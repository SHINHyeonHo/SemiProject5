package admin.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;
import product.model.ProductVO;

public class GetStockAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int soldoutNum = Integer.parseInt(request.getParameter("soldoutNum"));
				
		InterAdminProductDAO pdao = new AdminProductDAO();		
		
		List<ProductVO> prodList = pdao.getSoldoutInfo(soldoutNum);
		
		JSONObject jsObj = new JSONObject();

		if(prodList != null) 
				
			jsObj.put("prodList", prodList);
				
		
		
		request.setAttribute("json", jsObj);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
		
		
	}

}
