package admin.order.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.OrderVO;
import product.model.ProductDAO;


public class AdminOrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean bool = super.checkLogin(request);
		
		if(!bool) {
			// 로그인을 안했으면 
			String message = "비정상적인 경로로 접근하셨습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			return;
		}
		
		else {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( !"admin".equals(String.valueOf(loginuser.getUserid())) ) {
			// 로그인을 했지만 로그인한 자신의 코인충전에 대한 결제를 하는 것이 아니라 
			// 다른 사용자의 코인충전에 대한 결제를 하려고 접근한 경우 
			String message = "비정상적인 경로로 접근하셨습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/Main/msg.jsp");
			return;
		}
		
		
		else {
		///////////////////////////////////////////////////////////////////////////
			
			// *** 페이징처리를 한 관리자를 제외한 전체회원목록 보여주기 *** //
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			
			if(currentShowPageNo == null)
				currentShowPageNo = "1";
			
			HashMap<String,String> paraMap = new HashMap<>();
			paraMap.put("currentShowPageNo", currentShowPageNo);
			paraMap.put("sizePerPage", "10");	
			
		///////////////////////////////////////////////////////////////////////	
					
			
		InterProductDAO pdao = new ProductDAO();
		
		List<OrderVO> orderlist = pdao.selectOrderList(paraMap); 
		
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("sizePerPage", 10);
		
		
		// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
		int totalPage = pdao.getTotalPage(paraMap);
		
		int pageNo = 1;
		// pageNo 는 페이지바에서 보여지는 첫번째 페이지 번호 이다.
		
		int blockSize = 10;
		// blockSize 는 블럭(토막)당 보여지는 페이지 번호의 갯수이다.
		
		int loop = 1;
		// loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은  10개)까지만 증가하는 용도이다.
		
		// !!! 다음은 pageNo 를 구하는 공식이다. !!! //
		pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize )*blockSize + 1;
		
		String pageBar = "";
		
		// *** [이전] 만들기  *** // 
				if( pageNo != 1 ) {
					pageBar += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+(pageNo-1)+"'>[이전]</a>&nbsp;";
				}
				
				while( !(loop > blockSize || pageNo > totalPage) ) {
					
					if(pageNo == Integer.parseInt(currentShowPageNo) ) {
						pageBar += "&nbsp;<span style='color: black;'>"+pageNo+"</span>"; 
					}
					else {
						pageBar += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+pageNo+"' style='color: black;'>"+pageNo+"</a>";
					}
					
					pageNo++; // 1 2 3 4 5 6 7 8 9 10 11 12 13 14 .... 40 41 42 
					loop++;   // 1 2 3 4 5 6 7 8 9 10 
				}
				
				// *** [다음] 만들기  *** // 
				if( !(pageNo > totalPage) ) {
					pageBar += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+pageNo+"'>[다음]</a>&nbsp;";
				}
				
				
				request.setAttribute("pageBar", pageBar);
		
		/////////////////////////////////////////////////////////////////////////////////////
				
				
///////////////////////////////////////////////////////////////////////////
				
// *** 페이징처리를 한 관리자를 제외한 전체회원목록 보여주기 *** //
String currentShowPageNo2 = request.getParameter("currentShowPageNo2");

if(currentShowPageNo2 == null)
currentShowPageNo2 = "1";

HashMap<String,String> paraMap2 = new HashMap<>();
paraMap2.put("currentShowPageNo2", currentShowPageNo2);
paraMap2.put("sizePerPage2", "10");	

///////////////////////////////////////////////////////////////////////	


List<OrderVO> orderCompletelist = pdao.selectOrderCompleteList(paraMap2);

request.setAttribute("orderlist", orderlist);
request.setAttribute("sizePerPage", 10);


// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
int totalPage2 = pdao.getTotalPage(paraMap);

int pageNo2 = 1;
// pageNo 는 페이지바에서 보여지는 첫번째 페이지 번호 이다.

int blockSize2 = 10;
// blockSize 는 블럭(토막)당 보여지는 페이지 번호의 갯수이다.

int loop2 = 1;
// loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은  10개)까지만 증가하는 용도이다.

// !!! 다음은 pageNo 를 구하는 공식이다. !!! //
pageNo2 = ( (Integer.parseInt(currentShowPageNo2) - 1)/blockSize2 )*blockSize2 + 1;

String pageBar2 = "";

// *** [이전] 만들기  *** // 
if( pageNo2 != 1 ) {
pageBar2 += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+(pageNo2-1)+"'>[이전]</a>&nbsp;";
}

while( !(loop2 > blockSize2 || pageNo2 > totalPage2) ) {

if(pageNo2 == Integer.parseInt(currentShowPageNo2) ) {
pageBar2 += "&nbsp;<span style='color: black;'>"+pageNo2+"</span>"; 
}
else {
pageBar2 += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+pageNo2+"' style='color: black;'>"+pageNo2+"</a>";
}

pageNo2++; // 1 2 3 4 5 6 7 8 9 10 11 12 13 14 .... 40 41 42 
loop2++;   // 1 2 3 4 5 6 7 8 9 10 
}

// *** [다음] 만들기  *** // 
if( !(pageNo2 > totalPage2) ) {
pageBar2 += "&nbsp;<a href='adminOrder.hb?currentShowPageNo="+pageNo2+"'>[다음]</a>&nbsp;";
}
		
		request.setAttribute("pageBar2", pageBar2);
		
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("orderCompletelist", orderCompletelist);
		
		int n = pdao.countordership();
		int r = pdao.countorderCompleteship();
		
		request.setAttribute("n", n);
		request.setAttribute("r", r);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/adminOrder.jsp");
		
		}
		
		}
	}

}
