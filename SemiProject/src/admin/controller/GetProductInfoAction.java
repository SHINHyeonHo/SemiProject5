package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.AdminDAO;
import admin.model.InterAdminDAO;
import common.controller.AbstractController;
import product.model.ProductVO;

public class GetProductInfoAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		System.out.println("매소드 : "+method);
		
/*		if(!"POST".equalsIgnoreCase(method)) { // post 방식으로 들어온게 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;	
			
			
		}
		else { // Post 방식으로 들어왔다면 
			
		*/	
			String prodName = request.getParameter("name");
			//String searchButton = request.getParameter("searchButton");
			//System.out.println("버튼 : "+searchButton);
			
			if(prodName.isEmpty()) 
				prodName = "";
		
			
			InterAdminDAO adao = new AdminDAO();
			List<ProductVO> prodList = adao.getProductInfo(prodName);
			
			request.setAttribute("prodList", prodList);
			request.setAttribute("method", method);
			
			if(prodList.isEmpty()) {
				System.out.println("비었다.");
			}else {
				System.out.println("들어있음");
			}
			
			//System.out.println(prodList.get(1).getProd_code());

	//	}
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/product.jsp");
		
	}
	
	

}
