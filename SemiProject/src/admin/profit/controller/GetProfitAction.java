package admin.profit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.profit.model.AdminProfitDAO;
import admin.profit.model.InterAdminProfitDAO;
import admin.profit.model.ProfitVO;
import common.controller.AbstractController;

public class GetProfitAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		InterAdminProfitDAO pao = new AdminProfitDAO();
		
		// 정산 내역
		List<ProfitVO> profitList = pao.getProfitList(); 
		
		//월별 매출
		List<Map<String, Integer>> monthProfitList = pao.GetMonthProfit();
		
		//이번달 매출
		Map<String, Integer> thisMonthMap = pao.GetThisMonthProfit();
		
		request.setAttribute("profitList", profitList);
		request.setAttribute("monthProfitList", monthProfitList);
		request.setAttribute("thisMonthMap", thisMonthMap);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/habibi/admin/profit.jsp");
	}

	
}
