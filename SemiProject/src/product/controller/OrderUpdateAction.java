package product.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class OrderUpdateAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      String orderCartNo = request.getParameter("orderCartNo");
      String orderUserid = request.getParameter("orderUserid");
      String orderName = request.getParameter("orderName");
      String orderProducts = request.getParameter("orderProducts");
      String orderOqty = request.getParameter("orderOqty");
      String orderMobile = request.getParameter("orderMobile");
      String orderAddress = request.getParameter("orderAddress");
      String orderMemo = request.getParameter("orderMemo");
      String ordersumtotalPrice = request.getParameter("ordersumtotalPrice");
      String orderProductsCode = request.getParameter("orderProductsCode");
      String ordertotalPrice = request.getParameter("ordertotalPrice");
      String orderUsePoint = request.getParameter("orderUsePoint");
      String orderAddPoint = request.getParameter("orderAddPoint");
      
      
      String[] orderCartNoArr = orderCartNo.split(",");
      String[] orderProductsArr = orderProducts.split(",");
      String[] orderOqtyArr = orderOqty.split(",");
      String[] orderProductsCodeArr = orderProductsCode.split(","); 
      String[] ordertotalPriceArr = ordertotalPrice.split(",");
      String[] orderAddPointArr = orderAddPoint.split(","); 
      
      InterProductDAO pdao = new ProductDAO();
      
      HashMap<String,String> map = new HashMap<String,String>();
      
      map.put("orderUserid", orderUserid);
      map.put("orderName", orderName);
      map.put("orderMobile",orderMobile);
      map.put("orderAddress", orderAddress);
      map.put("orderMemo", orderMemo);
      map.put("ordersumtotalPrice", ordersumtotalPrice);
      map.put("orderUsePoint", orderUsePoint);
      
      
      // 전표 생성
      int junpyo = pdao.getJunpyo();
      
      // 주문 테이블에 주문내역 insert
      int n = pdao.insertOrder(map,junpyo);
      
      // 주문 상세 테이블에 insert
      int cnt = 0;
      for(int i=0; i<orderProductsCodeArr.length; i++) {
         cnt++;
         pdao.insertOrderInfo(orderProductsCodeArr[i],orderOqtyArr[i],junpyo,ordertotalPriceArr[i],orderProductsArr[i]);
      }
      
      // 사용한 적립금 마이너스 해주기
      pdao.minusPoint(orderUserid,orderUsePoint);
      
      // 구매한 상품에 대한 적립금 적립
      for(int i=0; i<orderAddPointArr.length; i++) {
         pdao.plusPoint(orderUserid,orderAddPointArr[i]);
      }
         
      // 적립금 테이블에 insert
      int point = 0;
      for(int i=0; i<orderAddPointArr.length; i++) {
         point += Integer.parseInt(orderAddPointArr[i]);
      }
      
      pdao.insertPointTabel(junpyo,orderUserid,point);
      
      
        if(Integer.parseInt(orderUsePoint) != 0 ) {
           pdao.insertMinusPointTable(junpyo,orderUserid,orderUsePoint); 
        }
   
      
      // 장바구니에서 비워줌
      for(int i=0; i<orderCartNoArr.length; i++) {
         pdao.orderCartDel(orderCartNoArr[i]);
      }
   
      // 주문한 수량 만큼 감소시키기
      for(int i=0; i<orderOqtyArr.length; i++) {
         pdao.minusProductStock(orderOqtyArr[i],orderProductsCodeArr[i]);
      }
      
      pdao.insertCaculate(junpyo, orderUserid, Integer.parseInt(ordersumtotalPrice));
      
      
      request.setAttribute("junpyo", junpyo);
      request.setAttribute("orderAddress", orderAddress);
      request.setAttribute("orderMemo", orderMemo);
      request.setAttribute("orderAddress", orderAddress);
      request.setAttribute("ordersumtotalPrice", ordersumtotalPrice);
      request.setAttribute("orderMobile", orderMobile);
      request.setAttribute("point", point);
      
      if(n==1) {
         super.setViewPage("/WEB-INF/habibi/product/OrderResult.jsp");
      }
      else {
         String message = "결제 실패";
         String loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는것.
      
         request.setAttribute("message", message);
         request.setAttribute("loc", loc);
      
      //   super.setRedirect(false);
         super.setViewPage("/WEB-INF/Main/msg.jsp");
      }
      
      
   }

}