package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

import product.model.*;
import util.habibi.HabibiUtil;

public class MemberOrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  HttpSession session = request.getSession();
	      MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	      
	      if(loginuser == null) {
	         // 비정상적인 접근 막기
	         String message = "먼저 로그인 해야 가능합니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	         super.setRedirect(false);
	         super.setViewPage("/WEB-INF/Main/msg.jsp");
	         
	         return;
	      }
	      
	      InterProductDAO pdao = new ProductDAO();
	      List<OrderVO> memberOrderList = pdao.selectMemberOrder(loginuser.getUserid());
	      
	      request.setAttribute("memberOrderList", memberOrderList);
	      
	      request.setAttribute("goBackURL", HabibiUtil.getCurrentURL(request));
	      
	      
	      super.setViewPage("/WEB-INF/habibi/member/memberOrderList.jsp");
	}

}
