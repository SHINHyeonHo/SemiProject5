package admin.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import product.model.ProductVO;

public interface InterAdminProductDAO {

	// ***** 상품관리 *****
	
	//상품검색, 조회
	List<ProductVO> getProductInfo(String category, String name, int start, int end) throws SQLException;
	
	//상품 개수
	int getProdCount(String searchCategory, String searchName) throws SQLException;
	
	// 상품등록
	int registerProduct(ProductVO pvo) throws SQLException;
	
	// 상품삭제
	int DeleteProduct(String prodCodeString) throws SQLException;
	
	// 재고수량변경
	int changeProductStock(int prodStock, String prodCode) throws SQLException;

	// 판매상태변경
	int changeProductStatus(int prodStatus, String prodCode) throws SQLException;
	
	
	// 품절 임박 수량, 품절수량
	List<ProductVO> getSoldoutInfo(int soldoutNum) throws SQLException;
	
	
	
}
