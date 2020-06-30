package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class SearchProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if(!"GET".equalsIgnoreCase(method)) {
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			
			return;	
		}
		else {
			String searchWord = request.getParameter("searchWord");
			String page_ = request.getParameter("page");
			
			int page = 1;
			if(page_ != null && !page_.equalsIgnoreCase("")) {
				page = Integer.parseInt(page_);
			}
			
			InterProductDAO pao = new ProductDAO();
			List<ProductVO> prodList =  pao.getSearchProductList(searchWord, page);
			int count = pao.getSearchProductCount(searchWord);
			
			request.setAttribute("prodList", prodList);
			request.setAttribute("count", count);
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("n", 2);
		}
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/product/category.jsp");
		
	}

}
