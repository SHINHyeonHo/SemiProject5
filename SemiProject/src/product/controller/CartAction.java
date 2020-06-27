package product.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.CartVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import util.habibi.HabibiUtil;

public class CartAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogin = super.checkLogin(request);
		
		HttpSession session = request.getSession();
		
		if(!isLogin) { // 로그인을 하지 않은 상태이라면
		/*
		   사용자가 로그인을 하지 않은 상태에서 특정제품을 장바구니에 담고자 하는 경우 
		   사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
		 */
			String goBackURL = request.getParameter("goBackURL");
			
			session.setAttribute("goBackURL", goBackURL);
			
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			return;
		}
		
		else {
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		InterProductDAO cdao = new ProductDAO();
		
		// 장바구니 목록을 가져오는 메소드
		List<CartVO> cartList = cdao.selectCartList(loginuser.getUserid());
		
		//
		HashMap<String,String> sumMap = cdao.selectCartSumPricePoint(loginuser.getUserid());
		
		request.setAttribute("cartList", cartList);
		
		request.setAttribute("sumMap", sumMap);
		
		request.setAttribute("goBackURL", HabibiUtil.getCurrentURL(request));
		System.out.println(HabibiUtil.getCurrentURL(request));
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/product/cart.jsp");
		
		}
	}

}
