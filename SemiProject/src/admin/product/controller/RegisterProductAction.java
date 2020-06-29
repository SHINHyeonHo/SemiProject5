package admin.product.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.product.model.AdminProductDAO;
import admin.product.model.InterAdminProductDAO;
import common.controller.AbstractController;
import product.model.ProductVO;

public class RegisterProductAction extends AbstractController{

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest mutiRequest = null;
		HttpSession session = request.getSession();
		
		ServletContext svlCtx = session.getServletContext();
		String imagesDir = svlCtx.getRealPath("/images/Product");
		
		//System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 imagesDir ==> " + imagesDir);
		///Users/user/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SemiProject/images/Product
	
		try {	
			  mutiRequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
			
	      } catch(IOException e) {
	    	  request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	    	  request.setAttribute("loc", request.getContextPath()+"/admin/product.hb"); 
	    	  super.setViewPage("/WEB-INF/habibi/admin/product.jsp");
	    	  return;
		  }
		
		String prodCode = mutiRequest.getParameter("prodCode");
		String prodCategory = mutiRequest.getParameter("prodCategory");
	    String prodName = mutiRequest.getParameter("prodName");
	    int prodCost = Integer.parseInt(mutiRequest.getParameter("prodCost"));
	    int prodPrice = Integer.parseInt(mutiRequest.getParameter("prodPrice"));
	    String prodColor = mutiRequest.getParameter("prodColor");
		String prodMtl = mutiRequest.getParameter("prodMtl");
		String prodSize1 = mutiRequest.getParameter("prodSize1");
		String prodSize2 = mutiRequest.getParameter("prodSize2");
		String prodSize3 = mutiRequest.getParameter("prodSize3");
		int prodStatus = Integer.parseInt(mutiRequest.getParameter("prodStatus"));
		int prodStock = Integer.parseInt(mutiRequest.getParameter("prodStock"));
		
		String prodSize = "w"+prodSize1+" x d"+prodSize2+" x h"+prodSize3+" mm";
		
		String prodImage = mutiRequest.getFilesystemName("prodImage");
		//System.out.println("prodImage : "+prodImage);
		
		
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
	    pvo.setProd_stock(prodStock);

	    
		InterAdminProductDAO adao = new AdminProductDAO();
	    int result = adao.registerProduct(pvo);
	    System.out.println("상품등록 : "+result);	
		
	}

}
