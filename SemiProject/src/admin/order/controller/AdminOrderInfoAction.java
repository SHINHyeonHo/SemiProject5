package admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.OrderInfoVO;
import product.model.OrderVO;
import product.model.ProductDAO;

public class AdminOrderInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String orderCode = request.getParameter("orderCode");
		
	//	System.out.println(orderCode);
		InterProductDAO pdao = new ProductDAO();
		
		OrderVO orderlist = pdao.viewOrderList(orderCode);	
		List<OrderInfoVO> orderDetailList = pdao.viewOrderDetailList(orderCode);
			
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("orderDetailList", orderDetailList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/adminOrderInfo.jsp");
		
	}

}
