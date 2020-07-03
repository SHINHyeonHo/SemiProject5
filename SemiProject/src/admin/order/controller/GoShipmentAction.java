package admin.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.OrderVO;
import product.model.ProductDAO;

public class GoShipmentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ordercodejoin = request.getParameter("ordercodejoin");
	//	System.out.println(ordercodejoin);
		
		String[] ordercodeArr = ordercodejoin.split(",");
		
		InterProductDAO pdao = new ProductDAO();
		
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		int cnt = 0;
		for(int i=0; i<ordercodeArr.length; i++) {
			cnt++;
			pdao.goShipment(ordercodeArr[i]);
		}
		
		request.setAttribute("cnt", cnt);
		
		String message = cnt+" 개 상품이 배송처리 되었습니다.";
		String loc = "/SemiProject/admin/adminOrder.hb";
	
		
		////////////////////////////////////////////////
		// 정산 테이블에 insert
			
		for(int i=0; i<ordercodeArr.length; i++) {
		
		// insert할 정보 가져오기 
		OrderVO ovo = new OrderVO();	
		ovo = pdao.getOrderInfo(ordercodeArr[i]);
		
		int order_code = ovo.getOrder_code();
		String fk_userid = ovo.getFk_userid();
		int order_price = ovo.getOrder_price();
		
		// insert 해주기
		pdao.insertCaculate(order_code,fk_userid,order_price);
		
		}
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
	
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/Main/msg.jsp");
		
		
		
	}

}