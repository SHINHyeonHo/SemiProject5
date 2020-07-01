package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.ProductDAO;
import product.model.ProductVO;

public class CategoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String method = request.getMethod();
		
		if(!"GET".equalsIgnoreCase(method)) { // get 방식으로 들어온게 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;	
			
		}
		else {// get방식으로 들어왔다면 
		
			String category = request.getParameter("category");
			String page_ = request.getParameter("page");
			
			int page = 1;
			if(page_ != null && !page_.equalsIgnoreCase("")) {
				page = Integer.parseInt(page_);
			}
			
			String prodCode = "";
			
			ProductDAO pao = new ProductDAO();
			List<ProductVO> prodList =  pao.getProductList(category, prodCode, page, 0);
			List<ProductVO> prodBestList =  pao.getProductList(category, prodCode, page, 1);
			int count = pao.getProductCount(category);
			
			request.setAttribute("prodList", prodList);
			request.setAttribute("prodBestList", prodBestList);
			request.setAttribute("count", count);
			
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/product/category.jsp");
		
	}

}