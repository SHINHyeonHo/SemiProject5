package admin.profit.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterAdminProfitDAO {

	// 정산 내역 정보
	List<ProfitVO> getProfitList() throws SQLException;
	
	// 정산 날짜 오늘이랑 비교
	int ProfitDateCheck(String orderCode) throws SQLException;
	
	// 월별 매출,비용,수익 
	List<Map<String, Integer>> GetMonthProfit() throws SQLException;
	
	// 이번달 매출, 비용
	Map<String, Integer> GetThisMonthProfit() throws SQLException;
}
