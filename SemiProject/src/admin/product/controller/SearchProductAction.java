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

		
		String searchName = request.getParameter("searchName");
		
		InterAdminProductDAO pdao = new AdminProductDAO();
		
		JSONArray jsArr = new JSONArray();
		
		List<ProductVO> prodList = pdao.getProductInfo(searchName);
		
		
		if(prodList != null) {
			
			for(ProductVO pvo : prodList) {
				
				JSONObject jsObj = new JSONObject();
				jsObj.put("prod_code", pvo.getProd_code());
				jsObj.put("prod_category", pvo.getProd_category());
				jsObj.put("prod_name", pvo.getProd_name());
				jsObj.put("prod_cost", pvo.getProd_cost());
				jsObj.put("prod_price", pvo.getProd_price());
				jsObj.put("prod_color", pvo.getProd_color());
				jsObj.put("prod_mtl", pvo.getProd_mtl());
				jsObj.put("prod_stock", pvo.getProd_stock());
				jsObj.put("prod_size", pvo.getProd_size());
				jsObj.put("prod_status", pvo.getProd_status());

				jsArr.put(jsObj);
			}
		
		}
		
		String json = jsArr.toString();
		request.setAttribute("json", json);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
		
	}
}
