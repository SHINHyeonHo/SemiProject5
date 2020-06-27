package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class CartAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {
			// GET 방식이라면
			
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			return;
		}
		
		else {
			// POST 방식이라면
			
			// ===== 로그인 유무 검사하기 ===== //
			
			boolean isLogin = super.checkLogin(request);
			
			HttpSession session = request.getSession();
			
			if(!isLogin) { // 로그인을 하지 않은 상태이라면
			/*
			   사용자가 로그인을 하지 않은 상태에서 특정제품을 장바구니에 담고자 하는 경우 
			   사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
			 */
				String goBackURL = request.getParameter("goBackURL");
				
				session.setAttribute("goBackURL", goBackURL);
				
				request.setAttribute("message", "장바구니에 담으려면 로그인이 필요합니다.");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/Main/msg.jsp");
				return;
			}
			
			else { // 로그인을 한 상태라면
				
				// 장바구니 테이블(shopping_cart)에 해당 제품을 담아야 한다.
				// 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 shopping_cart 테이블에 insert 를 해야하고, 
				// 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 shopping_cart 테이블에 update 를 해야한다. 

				String prod_code = request.getParameter("prod_code"); // 제품번호
				String cart_stock = request.getParameter("cart_stock"); // 주문량
				
				InterProductDAO pdao = new ProductDAO();
				
				System.out.println(prod_code);
				System.out.println(cart_stock);
				System.out.println(((MemberVO)session.getAttribute("loginuser")).getUserid());
				
				int n = pdao.addCart( ((MemberVO)session.getAttribute("loginuser")).getUserid() ,prod_code ,cart_stock);
				
				if(n==1) {
					request.setAttribute("message", "상품이 장바구니에 담겼습니다.");
					request.setAttribute("loc", "/SemiProject/prod/cartmain.hb");
					// 장바구니 목록보여주기 페이지 이동
				}
				else {
					request.setAttribute("message", "장바구니담기에 실패하였습니다.");
					request.setAttribute("loc", "javascript:history.back()");
				}
				
				super.setViewPage("/WEB-INF/Main/msg.jsp");
			}
			
		}
		
		
	}

}
