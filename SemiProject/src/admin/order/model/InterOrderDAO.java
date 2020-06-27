package admin.order.model;

import java.sql.SQLException;
import java.util.List;

public interface InterOrderDAO {

	// 주문정보 가져오기
	List<OrderVO> selectOrderList() throws SQLException;

	// 주문상태 업데이트
	int updateShipment(String order_code) throws SQLException;

}
