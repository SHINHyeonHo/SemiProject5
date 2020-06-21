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
		
		if(!"POST".equalsIgnoreCase(method)) { // get 방식으로 들어왔다면 

			
		}
		
		else { // Post 방식으로 들어왔다면 
			
			request.setCharacterEncoding("UTF-8");
			
			String name = request.getParameter("name");
			String searchButton = request.getParameter("searchButton");
			System.out.println("버튼 : "+searchButton);
			
			
			switch (searchButton) {
			
			case "검색":
				
				if(name.isEmpty() || name == null) { // 상품명을 입력하지 않고 검색 누르면
			
					return;
				}
				
				break;
				
			case "전체조회":
					name = "";	
				break;

			}
			
			InterAdminDAO adao = new AdminDAO();
			List<ProductVO> prodList = adao.getProductInfo(name);
			
			request.setAttribute("prodList", prodList);
			request.setAttribute("method", method);
		
			
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/product.jsp");
		
	}
	
	

}
