package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.CartVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class OrderFormAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
	    MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		request.setAttribute("loginuser", loginuser);
	
		String cartnojoin = request.getParameter("cartnojoin");
		String totalPricejoin = request.getParameter("totalPricejoin");
		String sumtotalPrice = request.getParameter("sumtotalPrice");	
		String oqtyjoin = request.getParameter("oqtyjoin");
		String prodnamejoin = request.getParameter("prodnamejoin");
		String prodcodejoin = request.getParameter("prodcodejoin");
		String addPointjoin = request.getParameter("addPointjoin");
	
		
		String[] cartnoArr = cartnojoin.split(",");
		String[] totalPriceArr = totalPricejoin.split(",");				
		
		InterProductDAO pdao = new ProductDAO();
		
		List<CartVO> cartList = new ArrayList<CartVO>();
		for(int i=0; i<cartnoArr.length; i++) {
			CartVO cvo = pdao.selectProductForNo(cartnoArr[i]);
			
			cartList.add(cvo);
		}
		
		
		request.setAttribute("cartnoArr", cartnoArr);
		request.setAttribute("totalPricejoin", totalPricejoin);
		request.setAttribute("sumtotalPrice", sumtotalPrice);
		
		request.setAttribute("cartnojoin", cartnojoin);
		request.setAttribute("oqtyjoin", oqtyjoin);
		request.setAttribute("prodnamejoin", prodnamejoin);
		request.setAttribute("prodcodejoin", prodcodejoin);
		request.setAttribute("addPointjoin", addPointjoin);
		
		request.setAttribute("cartList", cartList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/product/orderForm.jsp");
		
	}

}
