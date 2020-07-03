package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;

public class OrderAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pnumjoin = request.getParameter("pnumjoin");
		String oqtyjoin = request.getParameter("oqtyjoin");
		String cartnojoin = request.getParameter("cartnojoin");
		String totalPricejoin = request.getParameter("totalPricejoin");
		String sumtotalPrice = request.getParameter("sumtotalPrice");
		
		String[] pnumArr = pnumjoin.split(",");
		String[] oqtyArr = oqtyjoin.split(",");
		String[] cartnoArr = cartnojoin.split(",");
		String[] totalPriceArr = totalPricejoin.split(",");
		String[] sumtotalPriceArr = sumtotalPrice.split(",");
		
		JSONObject jsobj = new JSONObject();
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/product/orderForm.jsp");
		
			
		
	}

}
