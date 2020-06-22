package product.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterProductDAO {

	// 카테고리별 정보 가져오기
    List<ProductVO> getProductList(String category, String prod_code) throws SQLException;
	
}
