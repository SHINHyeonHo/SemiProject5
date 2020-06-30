package admin.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;
import product.model.ProductVO;

public class SearchProductAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String searchCategory = request.getParameter("searchCategory");
		String searchName = request.getParameter("searchName");
		
		InterAdminProductDAO pdao = new AdminProductDAO();
				
		List<ProductVO> prodList = pdao.getProductInfo(searchCategory, searchName);
		int count = pdao.getProdCount(searchCategory, searchName);
		
		JSONObject jsObj = new JSONObject();
		
		if(prodList != null) {
			
			jsObj.put("prodList", prodList);
			jsObj.put("count", count);
		}
		
		request.setAttribute("json", jsObj);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
		
	}
}
