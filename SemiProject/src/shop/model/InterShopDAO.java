package shop.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterShopDAO {

	// 매장 정보
	List<HashMap<String, String>> selectStoreMap() throws SQLException;

}
