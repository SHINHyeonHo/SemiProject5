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
			
			
			// 상품검색
			request.setCharacterEncoding("UTF-8");
			String submitButton = request.getParameter("submitButton");
			System.out.println(submitButton);
			
			InterAdminDAO adao = new AdminDAO();
			
			String name = null;
			switch (submitButton) {
			
			case "검색":
				
				name = request.getParameter("name");
				
				break;
				
			case "전체조회":
				
				name = "";
				
				break;

				
			case "상품등록":
				
				// 상품등록 
				String prodCode = "";
				String prodCategory = "";
				String prodName = "";
				int prodCost = -1;
				int prodPrice = -1;
				String prodColor = "";
				String prodMtl = "";
				String prodSize = "";
				int prodStatus = -1;
				
				if(request.getParameter("prodCode") != null && !request.getParameter("prodCode").isEmpty())
					prodCode = request.getParameter("prodCode");
				
				if(request.getParameter("prodCategory") != null && !request.getParameter("prodCategory").isEmpty())
					prodCategory = request.getParameter("prodCategory");
				
				if(request.getParameter("prodName") != null && !request.getParameter("prodName").isEmpty())
				    prodName = request.getParameter("prodName");

				if(request.getParameter("prodCost") != null && !request.getParameter("prodCost").isEmpty())
				    prodCost = Integer.parseInt(request.getParameter("prodCost"));

				if(request.getParameter("prodPrice") != null && !request.getParameter("prodPrice").isEmpty())
				    prodPrice = Integer.parseInt(request.getParameter("prodPrice"));

				if(request.getParameter("prodColor") != null && !request.getParameter("prodColor").isEmpty())
				    prodColor = request.getParameter("prodColor");

				if(request.getParameter("prodMtl") != null && !request.getParameter("prodMtl").isEmpty())
					prodMtl = request.getParameter("prodMtl");
				
				if(request.getParameter("prodSize") != null && !request.getParameter("prodSize").isEmpty())
					prodSize = request.getParameter("prodSize");
				
				if(request.getParameter("prodStatus") != null && !request.getParameter("prodStatus").isEmpty()) 		
					prodStatus = Integer.parseInt(request.getParameter("prodStatus"));
			
			    ProductVO pvo = new ProductVO();
			    pvo.setProd_code(prodCode);
			    pvo.setProd_category(prodCategory);
			    pvo.setProd_name(prodName);
			    pvo.setProd_cost(prodCost);
			    pvo.setProd_price(prodPrice);
			    pvo.setProd_color(prodColor);
			    pvo.setProd_mtl(prodMtl);
			    pvo.setProd_size(prodSize);
			    pvo.setProd_status(prodStatus);
			    
			    
			    // 상품 등록 insert
			    int result = adao.registerProduct(pvo);
			    System.out.println("1이면 성공 : "+result);
				
				return;
				
				//break;
				
			case "상품삭제" :
				
				break;
				
			}
			

			// 상품검색
			List<ProductVO> prodList = adao.getProductInfo(name);
			
			request.setAttribute("prodList", prodList);
			request.setAttribute("method", method);
			

			
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/product.jsp");
		
	}
	
	

}
