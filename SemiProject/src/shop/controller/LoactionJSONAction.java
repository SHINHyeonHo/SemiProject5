package shop.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import shop.model.*;

public class LoactionJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterShopDAO pdao = new ShopDAO();
		
		List<HashMap<String,String>> storeMapList = pdao.selectStoreMap();
		
		JSONArray jsonArr = new JSONArray();
		
		if(storeMapList.size() > 0) {
			for( HashMap<String,String> storeMap : storeMapList ) {
				JSONObject jsonObj = new JSONObject();
				
				String storename = storeMap.get("STORENAME");
				String storeimg = storeMap.get("STOREIMG");
				String storeaddress = storeMap.get("STOREADDRESS");
				double lat = Double.parseDouble(storeMap.get("LAT"));
				double lng = Double.parseDouble(storeMap.get("LNG"));
				int zIndex = Integer.parseInt(storeMap.get("ZINDEX"));

				jsonObj.put("storename", storename);
				jsonObj.put("storeimg", storeimg);
				jsonObj.put("storeaddress", storeaddress);
				jsonObj.put("lat", lat);
				jsonObj.put("lng", lng);
				jsonObj.put("zIndex", zIndex);

				jsonArr.put(jsonObj);
			}
		}
		
		String json = jsonArr.toString();
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonResult.jsp");
		
	}

}
