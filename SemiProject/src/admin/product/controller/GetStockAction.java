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
		
		System.out.println(soldoutNum);
		
		InterAdminProductDAO pdao = new AdminProductDAO();
		
		JSONArray jsArr = new JSONArray();
		
		
		Map<String, Object> map = pdao.getSoldoutInfo(soldoutNum);
		List<ProductVO> prodList = (List<ProductVO>) map.get("prodList");
		int count = (int) map.get("count");
	
		if(prodList != null) {
			
			for(ProductVO pvo : prodList) {
				
				JSONObject jsObj = new JSONObject();
				jsObj.put("prod_code", pvo.getProd_code());
				jsObj.put("prod_category", pvo.getProd_category());
				jsObj.put("prod_stock", pvo.getProd_stock());
				jsArr.put(jsObj);
			}
			
			
			JSONObject jsObj = new JSONObject();
			jsObj.put("count",count);
			jsArr.put(jsObj);
		
		}
		
		String json = jsArr.toString();
		request.setAttribute("json", json);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
		
		
	}

}
