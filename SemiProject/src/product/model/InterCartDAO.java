package product.model;

import java.sql.SQLException;
import java.util.List;

public interface InterCartDAO {

	// 장바구니 불러오기
	List<CartVO> selectCartList() throws SQLException;

}
