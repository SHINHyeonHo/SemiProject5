package admin.product.model;

import java.sql.SQLException;
import java.util.List;

import product.model.ProductVO;

public interface InterAdminProductDAO {

	// ***** 상품관리 *****
	
	//상품검색, 조회
	List<ProductVO> getProductInfo(String name) throws SQLException;
	
	// 상품등록
	int registerProduct(ProductVO pvo) throws SQLException;
	
	// 상품삭제
	int DeleteProduct(String prodCodeString) throws SQLException;
	
	// 재고수량변경
	int changeProductStock(int prodStock, String prodCode) throws SQLException;

	// 판매상태변경
	int changeProductStatus(int prodStatus, String prodCode) throws SQLException;
	
	
}
