package admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.order.model.*;
import common.controller.AbstractController;
import product.model.CartVO;

public class AdminMainAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		InterOrderDAO adao = new OrderDAO();
		
		List<OrderVO> orderlist = adao.selectOrderList();
		request.setAttribute("orderlist", orderlist);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/Admin/orderList.jsp");
	}

}
